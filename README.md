# Strigil
> Strigil is a gem for easily scraping a Reddit user's comment history into a JSON file

Strigil is an OSINT tool that makes it easy to scrape a Reddit user's comment history into a JSON file. With the official Reddit API, it's only possible to go back to the previous 100 comments by a user. Using Selenium, Strigil is able to go back about 1,000 comments. It results in a `comments.json` file that you can then manipulate as you wish. For example, you could run analysis on the data to build charts of posting frequency, heatmaps for what subreddits a user comments in, and other such things.

The `comments.json` file is presented as an array of JSON objects. The JSON objects are formatted in the following way:
```
{
  "author": "exampleuser"
  "subreddit": "examplesub"
  "permalink": "https://www.reddit.com/r/examplesub/comments/8830oa/example_post/dwhg6vi/"
  "timestamp": "2017-8-19 18:15:43 -0400"
  "text": "Yes, mods, I expect another ban."
}
```

## Installation
------------
Strigil is incredibly easy to set up and use. You just need to install the gem `strigil` and run two commands. You can even do it directly in the `irb` shell. You simply need to require the gem and run `Strigil.engage('username')`, filling in `username` with the target user.

1. `$ gem install strigil`
2. `$ irb`
3. `> require 'strigil'`
4. `> Strigil.engage('username')`

It may take a moment, but a `data/comments.json` file will be created in your current directory.

## Contribute
-----------
Feel free to contribute to the project by forking and issuing a pull request.

## Support
------------
Simply open an issue ticket to report any problems or bugs.

## License
------------
This project is licensed under the MIT license.
