module OmbiBot
  module Commands
    class Request < SlackRubyBot::Commands::Base
      command "request", "get", "download" do |client, data, match|
        client.say(text: "Ok, I found this:", channel: data.channel)
      end
    end
  end
end
