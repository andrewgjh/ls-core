require 'fileutils'

ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'

require_relative '../cms'

def create_document(name, content = '')
  File.open(File.join(data_path, name), 'w') do |file|
    file.write(content)
  end
end

def session
  last_request.env['rack.session']
end

def admin_session
  { 'rack.session' => { token: { username: 'admin' } } }
end

class CMSTest < MiniTest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    FileUtils.mkdir_p(data_path)
    get '/', {}, admin_session
  end

  def teardown
    FileUtils.rm_rf(data_path)
  end

  def test_index
    create_document 'about.txt'
    create_document 'changes.txt'
    create_document 'history.txt'

    get '/'

  
    assert_equal 200, last_response.status
    assert_equal 'text/html;charset=utf-8', last_response['Content-Type']
    assert_includes last_response.body, 'about.txt'
    assert_includes last_response.body, 'history.txt'
    assert_includes last_response.body, 'changes.txt'
  end

  def test_file_route
    content = "I'm baby pBR&B sustainable taiyaki occupy, you probably haven't heard of them squid cliche kale chips portland celiac. Photo booth fingerstache readymade raw denim. Tilde authentic poutine pinterest, shoreditch retro 90's semiotics poke banjo edison bulb viral. Venmo flannel raw denim aesthetic bodega boys squid hoodie. Knausgaard YOLO 3 wolf moon fixie tilde tofu actually etsy raclette Brooklyn. Beard vaporware praxis taxidermy."
    create_document 'about.txt', content
    get '/about.txt'
    assert_equal 200, last_response.status
    assert_equal 'text/plain', last_response['Content-Type']

    assert_equal(content, last_response.body)
  end

  def test_file_does_not_exist
    get '/fake.txt'
    assert_equal 302, last_response.status
    expected = "'fake.txt' does not exist."
    assert_equal expected, session[:message]

    get last_response['Location']
    assert_equal 'text/html;charset=utf-8', last_response['Content-Type']

    assert_includes last_response.body, expected
    get '/'
    refute_includes last_response.body, expected
  end

  def test_markdown_file
    markdown_data = <<~MD
      # Ruby is...

      - a wonderful programming language
      - dynamic and open source with a focus on simplicity and productivity
      - has elegant syntax that is natural to read and write
      - what happens when I write this here

      Check out the [documentation](https://ruby-doc.org/)
    MD
    create_document 'ruby.md', markdown_data

    get '/ruby.md'
    assert_equal 'text/html;charset=utf-8', last_response['Content-Type']
    assert_includes last_response.body, '<h1>Ruby is...</h1>'
  end

  def test_editing_document_page
    create_document 'changes.txt', 'content'

    get '/changes.txt/edit'

    assert_equal 200, last_response.status
    assert_includes last_response.body, '<textarea'
    assert_includes last_response.body, "<button type='submit'"

    saved_body = last_response.body
    get '/changes.txt'

    assert_includes saved_body, last_response.body
  end

  def test_edit_file
    create_document 'changes.txt'
    first_text = "Tumeric migas live-edge, wolf fixie kickstarter four dollar toast craft beer truffaut enamel pin bodega boys. Wolf man bun listicle beard. Slow-carb hashtag celiac, copper mug keffiyeh kogi small batch tumblr bicycle rights 3 wolf moon hexagon you probably haven't heard of them PBR&B disrupt. Kale chips thundercats pork belly, whatever hexagon polaroid before they sold out listicle. Blog offal aesthetic pabst, kinfolk authentic iceland normcore selvage pour-over you probably haven't heard of them DIY man braid snackwave brunch. Kale chips meggings authentic synth try-hard."
    post '/changes.txt', file_content: first_text
    get '/changes.txt'
    assert_equal last_response.body, first_text

    assert_equal 'changes.txt has been successfully changed.', session[:message]

    second_text = 'Hammock DIY small batch, craft beer vexillologist venmo pickled. Dreamcatcher try-hard quinoa, ascot kinfolk normcore forage mukbang craft beer pabst before they sold out skateboard pitchfork. Shabby chic tbh banjo, keffiyeh synth marfa palo santo occupy tilde glossier. Vegan flexitarian coloring book tacos.'
    post '/changes.txt', file_content: second_text
    get '/changes.txt'
    assert_equal last_response.body, second_text
    assert_equal 'changes.txt has been successfully changed.', session[:message]
    get '/'
    refute_equal 'changes.txt has been successfully changed.', session[:message]
  end

  def test_new_doc_page
    get '/new'
    assert_equal 200, last_response.status
    assert_includes last_response.body, "<label for='document_name'>Add a new document:"
  end

  def test_file_already_exists
    create_document 'available.txt'
    post '/new', document_name: 'available.txt'
    assert_equal 'available.txt already exists.', session[:message]
  end

  def test_creates_new_file
    post '/new', document_name: 'test.md'
    assert exists?('test.md')
    assert_equal 302, last_response.status

    assert_equal 'test.md has been created', session[:message]

    get last_response['Location']
    assert_includes last_response.body, 'test.md has been created'
  end

  def test_add_txt_extension_when_not_provided
    post '/new', document_name: 'without_ext'
    assert exists?('without_ext.txt')
  end

  def test_deleting_file
    create_document 'document.txt'
    create_document 'second_doc.txt'

    assert exists?('document.txt')
    post '/document.txt/delete'
    assert_equal 'document.txt has been deleted from the file system.', session[:message]
    assert_equal 302, last_response.status

    refute exists?('document.txt')

    get last_response['Location']
    refute_includes last_response.body, '>document.txt</a>'
    assert_includes last_response.body, 'second_doc.txt</a>'
  end

  def test_sets_session_value
    get '/signout'
    post '/login', { username: 'admin', password: 'topsecretpassword' }
    assert_equal({ username: 'admin' }, session[:token])
  end

  def test_signin
    post '/login', { username: 'admin', password: 'topsecretpassword' }
    assert_equal 'Welcome', session[:message]
  end

  def test_no_such_user
    get '/signout'
    post '/login', { username: 'some_fake_user', password: 'topsecretpassword' }
    assert_equal 'User does not exist', session[:message]
  end

  def test_wrong_password
    get '/signout'
    post '/login', { username: 'admin', password: 'fakepassword' }
    assert_equal 'The password is incorrect', session[:message]
  end

  def test_signout
    get '/signout'
    assert_equal 'You are logged out.', session[:message]
    assert_nil session[:token]
    get '/'

    assert_includes last_response.body, "<a href='/login' class='btn sign-out'>Sign In</a>"
  end

  def test_non_admin_rejection_user_page
    get '/signout'
    get '/users', {}, { 'rack.session' => { token: { username: 'not_an_admin' } } }
    assert_equal 'The resouce is only accessible by an administrator.', session[:message]
  end

  def test_admin_users_pages
    get '/users'
    assert_includes last_response.body, "<table>
  <tr>
    <td><strong>Username</strong></td>
    <td><strong>Delete User</strong></td>
  </tr>"
  end

  def test_admin_post_users
    post '/users', { username: 'test_user', password: '123456' }
  end
end
