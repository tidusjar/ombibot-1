module OmbiBot
  module Commands
    class Hello < SlackRubyBot::Commands::Base
      command "hello" do |client, data, _match|
        client.say(text: "Hello there. What can I do for you?", channel: data.channel)
      end
    end
  end
end
