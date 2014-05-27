#!/usr/bin/env ruby

require "sinatra"
require "json"

# Options
set :public_folder, "public"
enable :sessions
set :port, 5000

layout 'layout'


configure do
  	set :show_exceptions, true

    # Initial
end

# Global error
error do
	e = request.env['sinatra.error']
	puts e.to_s
	puts e.backtrace.join("\n")
	"Application error"
end

get "/" do

  alternates = {}
  alternates["/darjeeling"] = "{type message/teapot}"
  alternates["/earl-grey"] = "{type message/teapot}"
  alternates["/peppermint"] = "{type message/teapot}"

  # Brewing will not commence, send Alternates header
  response.headers['Alternates'] = alternates.to_json
	
end

# TODO:
# - BREW/POST - control of pot
# - GET - 
# - PROPFIND - metadata about brewed resource
# - WHEN - enough milk?

# Headers
# - Safe response header
# - Accept-Additions

# Response status codes:
# - 418 - Handle I'm a teapot

