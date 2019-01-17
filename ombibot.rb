require "slack-ruby-bot"
require "ombibot/commands/hello"
require "ombibot/commands/request"
require "ombibot/bot"

SlackRubyBot.configure do |config|
  config.aliases = ["plex", "plex_request", "ombi"]
end
