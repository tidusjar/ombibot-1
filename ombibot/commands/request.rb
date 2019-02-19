require "httparty"
require "uri"

OMBI_API_KEY = ENV["OMBI_API_KEY"]
OMBI_URL = ENV["OMBI_URL"]

module OmbiBot
  module Commands
    class Request < SlackRubyBot::Commands::Base
      command "download", "get", "request", "search", "find" do |client, data, match|
        query = URI.escape(match["expression"])
        body = JSON.parse(HTTParty.get(
          "#{OMBI_URL}/api/v1/Search/movie/#{query}",
          {
            headers: {
              "ApiKey" => OMBI_API_KEY,
              "UserName" => "ApiBasic",
            },
          }
        ).body)

        build_message = -> {
          {
            channel: data.channel,
            text: "Showing first #{[3, body.size].min} of #{body.size} results for \"#{match["expression"]}\":",
            fallback: "use a full-featured slack client to use OmbiBot",
            attachments: body.first(3).map do |movie|
              {
                title: "#{movie["title"]} (#{movie["releaseDate"][0..3]})",
                thumb_url: "https://image.tmdb.org/t/p/w300/#{movie["posterPath"]}",
                text: movie["overview"][0..200] + "...",
                callback_id: "movie_request",
                actions: [
                  {
                    name: "request",
                    text: "Request #{movie["title"]}",
                    type: "button",
                    value: movie["id"],
                  },
                ],
              }
            end,
          }
        }

        client.web_client.chat_postMessage(build_message.call)
      end
    end
  end
end
