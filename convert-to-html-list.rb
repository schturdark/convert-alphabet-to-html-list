require 'rubygems'
require 'cgi'
require 'sinatra'

get '/hi' do
  "Hello World"
end

get '/' do
	text = params[:input]
	@result = 'No input yet'

	unless text.nil?
		
		text = text.gsub(/\([b-z]\)/, '</li><li>')
		text = text.gsub(/\(a\)/, '<li>')
		text = "<div><ul>" + text + "</li></ul></div>"

		@result = CGI.escapeHTML(text) 
	end
	
	haml :index
end
