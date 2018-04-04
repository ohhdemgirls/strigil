require 'fileutils'

class Strigil::Comments
  attr_accessor :log

  def initialize
    @log = []
  end

  def add_comments(comments)
    @log += comments
  end

  def add_comment(comment)
    @log.push(comment)
  end

  def save
    unless File.exist?('./data/')
      FileUtils.mkdir('./data/')
    end
    File.open("./data/comments.json", 'w') do |f|
      log.each do |comment|
        f.write(comment.to_json)
      end
    end
  end

  def clear
    @log = []
  end
end
