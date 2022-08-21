require "sinatra"
require "sinatra/reloader"
require 'tilt/erubis'

before do 
  @contents = File.readlines("data/toc.txt")
end

helpers do
  
  def in_paragraphs(text)
    text.split("\n\n").map.with_index do |paragraph, idx|
      "<p id='pgh-#{idx}'>#{paragraph}</p>"
    end.join
  end
  
  def each_chapter
    @contents.each_with_index do |chapter_name, idx|
      chapter_num = idx + 1
      chapter_content = File.read("data/chp#{chapter_num}.txt")
      yield chapter_name, chapter_num, chapter_content
    end
  end

  def search_chapters(text)
    results = []
    return results if !text || text.empty?
    each_chapter do |name, number, content|
      results << { name: name , number: number, content: content} if content.include?(text)

      # results.concat(search_paragraphs(content, text).map do |paragraph, idx|
      #   {number: number, name: name, paragraph: bold(text, paragraph), index: idx}
      # end)
    
    end
    results
  end

  def search_paragraphs(content, query)
    found_paragraphs = []
    content.split("\n\n").each_with_index do |pgh, idx|
      if pgh.include?(query)
        found_paragraphs << [pgh, idx]
      end
    end
    found_paragraphs
  end

  def bold(word, paragraph)
    paragraph.gsub(word, "<strong>#{word}</strong>")
  end

end

not_found do 
  redirect '/'
end

get '/search' do
  @results = search_chapters(params[:query])
  erb :search
end

get "/" do
  @title = "The Adventures of Sherlock Holmes"
  erb :home
end

get "/chapters/:num" do |num|
  num = num.to_i
  redirect '/' unless (1..@contents.size).cover? num

  @title = "Chapter #{num}: #{@contents[num - 1]}"
  @chapter = File.read("data/chp#{num}.txt")

  erb :chapter
end
