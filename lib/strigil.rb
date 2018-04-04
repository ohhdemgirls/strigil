require 'selenium-webdriver'
require 'webdrivers'
require 'client/strigil_client'
require 'parsers/comments_parser'
require 'items/comment'
require 'items/comments'

class Strigil
  def self.engage(user)
    client = Strigil::StrigilClient.new(user)
    comments = Strigil::Comments.new

    processing = true
    while processing == true
      comments.add_comments(client.pull_comments)

      begin
        client.iterate
      rescue EndOfQueueError
        processing = false

        client.close
        comments.save

        puts "Pulled #{comments.log.size} comments."
        puts "JSON data stored in ./data/comments.json"

        comments.clear
      end
    end
  end
end
