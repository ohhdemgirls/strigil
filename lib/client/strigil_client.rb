class StrigilClient
  attr_reader :client

  def initialize(user)
    @client = Selenium::WebDriver.for :chrome
    client.navigate.to "https://reddit.com/u/#{user}/comments"
  end

  def pull_comments
    raw_comments = client.find_elements(class: "comment")
    Strigil::CommentsParser.parse(raw_comments)
  end

  def close
    client.close
  end

  def iterate
    begin
      client.find_element(link_text: "next ›").click
    rescue
      raise EndOfQueueError
    end
  end

end

class EndOfQueueError < StandardError
end
