class StrigilClient
  attr_reader :client

  def initialize(user)
    @client = Selenium::WebDriver.for :chrome
    client.navigate.to "https://reddit.com/u/#{user}/comments"
  end

  def pull_comments
    raw_comments = client.find_elements(class: "comment")
    comments = CommentsParser.parse(raw_comments)
    click_next_page
    comments
  end

  def close
    client.close 
  end

  private

  def click_next_page
    client.find_element(link_text: "next ›").click
  end
end
