#!/usr/bin/env ruby

#
# This is our coffee brewing client
# See this for more info: http://www.ietf.org/rfc/rfc2324.txt
#

require "faraday"

conn = Faraday.new

response = conn.get "http://localhost/"
puts response.status
puts response.body