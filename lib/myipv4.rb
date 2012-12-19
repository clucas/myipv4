require "myipv4/version"
require 'em-http-request'
require 'resolv'
require 'yaml'

module Myipv4

  config = YAML.load_file(File.join(File.dirname(__FILE__),"../config/ip_resolvers.yml"))
  MIN_REQUEST = config[:minimum_requests]
  URLS = config[:sites]
  http_requests = []
  res_ips = []
  ips = []

  EventMachine.run  do
    URLS.each do |url|
      http_requests << EventMachine::HttpRequest.new(url).get
    end

    http_requests.each do |http_request|
      http_request.callback {
        if http_request.response_header.http_status.eql?(200)
          res_ips << http_request.response.scan(/\d+.\d+.\d+.\d+/)
        end
        ips = res_ips.uniq
        if res_ips.size >= MIN_REQUEST  && ips.size < res_ips.size-1
          EventMachine.stop 
        end
      }
    end
  end
  ips.collect{|x| puts x}
  
end
