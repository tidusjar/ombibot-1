require "slack-ruby-bot"

module OmbiBot
  class Bot < SlackRubyBot::Bot
    help do
      title "Plex Bot"
      desc "Ask me to download stuff for you."
    end
  end
end
