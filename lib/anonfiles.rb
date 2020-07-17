require 'net/http'
require 'json'

module Anonfiles
  DOWN_URL = 'https://anonfiles.com/'
  UP_URL = 'https://api.anonfiles.com/upload'
  module Image
    def self.find(id)
      uri = URI.parse(DOWN_URL+id)
      req = Net::HTTP::Get.new(uri.to_s)
      res = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') { |http| http.request(req) }
      res.body.match(%r{src="https://cdn[^\"]*}).to_s[5..-1]
    end

    def self.upload(file)
      uri = URI(UP_URL)
      req = Net::HTTP::Post.new(uri)
      req.set_form([['file', file]], 'multipart/form-data')
      res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http| http.request(req) }
      result = JSON.parse(res.body)
      return nil unless result['status']
      result['data']['file']['metadata']['id']
    end
  end
  
end
