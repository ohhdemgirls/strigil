class Strigil::CommentsParser

  def self.parse(comments)
    comments.map do |comment|
      Strigil::Comment.new(
        author: comment.attribute("data-author"),
        subreddit: comment.attribute("data-subreddit"),
        permalink: get_permalink(comment),
        timestamp: get_timestamp(comment),
        text: get_text(comment)
      )
    end
  end

  private

  def self.get_permalink(comment)
    entry = get_entry(comment)
    entry.find_element(class: "bylink").attribute(:href)
  end

  def self.get_timestamp(comment)
    entry = get_entry(comment)
    entry.find_element(tag_name: "time").attribute(:title)
  end

  def self.get_text(comment)
    entry = get_entry(comment)
    entry.find_element(class: "usertext-body").text
  end

  def self.get_entry(comment)
    comment.find_element(class: "entry")
  end
end
