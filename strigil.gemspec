Gem::Specification.new do |s|
  s.name = "strigil"
  s.version = '0.1.0'
  s.license = 'MIT'
  s.date = '2018-04-03'

  s.author = "Harry Stebbins"
  s.email = 'hcstebbins@gmail.com'
  s.homepage = 'https://github.com/stebbins/strigil'

  s.summary = "Strigil is a gem for easily scraping a Reddit user's comment history into a JSON file."

  s.files = [
    'lib/strigil.rb',
    'lib/strigil/comment.rb',
    'lib/strigil/comments.rb',
    'lib/strigil/comments_parser.rb',
    'lib/strigil/strigil_client.rb'
  ]
  s.require_paths = ["lib"]
  s.add_runtime_dependency "selenium-webdriver", ["~> 3.11"]
  s.add_runtime_dependency "webdrivers", ["~> 3.2"]
end
