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

require 'strigil/comment'
require 'strigil/comments'
require 'strigil/comments_parser'
require 'strigil/strigil_client'
