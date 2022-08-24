# frozen_string_literal: true

require_relative 'advice'
require_relative 'monroe'

class App < Monroe
  def call(env)
    case env["REQUEST_PATH"]
    when '/'
      status = "200"
      headers = { 'Content-Type' => 'text/html' }
      response(status, headers) do
        erb :index
      end
    when '/advice'
      some_advice = Advice.new.generate
      status = "200"
      headers = { 'Content-Type' => 'text/html' }
      response(status, headers) do
        erb(:advice, message: some_advice)
      end
    else
      status = "404"
      headers = { "Content-Type" => 'text/html', "Content-Length" => '90' }
      response(status, headers) do
        erb(:not_found)
      end
    end
  end
end