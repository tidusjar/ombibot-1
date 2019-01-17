require "slack-ruby-bot"

class OmbiBot < SlackRubyBot::Bot
  command "hello" do |c, d, m|
    c.say(text: "Hello!", channel: d.channel)
  end
end

OmbiBot.run
