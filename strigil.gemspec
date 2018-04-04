Gem::Specification.new do |s|
  s.name = "strigil"
  s.authors = "Harry Stebbins"
  s.email = 'hcstebbins@gmail.com'
  s.homepage = 'https://github.com/stebbins/strigil'
  s.licenses = ['MIT']
  s.version = "0.1.0"
  s.date = '2018-04-03'
  s.summary = "Strigil is a gem for easily scraping a Reddit user's comment history into a JSON file."
  s.files = [
    'lib/strigil.rb',
    'lib/client/strigil_client.rb',
    'lib/items/comment.rb',
    'lib/items/comments.rb',
    'lib/parsers/comments_parser.rb'
  ]
  s.require_paths = ["lib"]
end
