require 'selenium-webdriver'
require 'webdrivers'
require 'require_all'
require_all 'lib'

class Strigil
  attr_reader :client, :comments

  def initialize(user)
    @client = StrigilClient.new(user)
    @comments = Comments.new
  end

  def engage
    processing = true
    while processing == true
      begin
        @comments.add_comments(@client.pull_comments)
      rescue Selenium::WebDriver::Error::NoSuchElementError
        @comments.add_comments(@client.pull_comments)
        processing = false
        @client.close
        @comments.save
        puts "Pulled #{comments.log.size} comments."
        puts "JSON data stored in ./data/comments.json"
        @comments.clear
      end
    end
  end
end
