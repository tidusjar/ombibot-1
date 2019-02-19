# OmbiBot

> A bot to ombi with

![](ombibot.gif)

## Prerequisites

1. Ruby >= 1.9.3
2. Bundler/RubyGems

## Installation

1. Install git (varies by platform)
2. Cone from git

```
git clone https://github.com/tidusjar/ombibot-1.git
```

3. Install dependencies

```
$ bundle install
```

## Configure

1. Set up Slack bot

   1. [Create a Slack app](https://api.slack.com/apps) and configure it in your workspace
   2. Add features: Bots, Interactive Components, and Permissions
       Permissions include:
        - chat:write:bot
        - bot
        - commands
   3. Collect slack API key for the bot under `OAuth & Permissions` save `Bot User OAuth Access Token` (will be needed later)
   4. Under `Interactive Components` fill in `Request URL` for the callback URL
        - This needs to be the address of the system running the bot, on TCP port 4567
          o in cases where the bot is hosted behind a NAT or router, port 4567 must be forwarded to the system hosting the bot
          o the address needs to be accessible from the internet, so use your WAN IP
        - URL can be HTTP (non-secured)

2. Replace environment variables

   1. Copy `.env.example` to `.env`
   2. Edit `.env` with the Ombi information
   ```
   SLACK_API_TOKEN=(copied from Slack bot setup in step 1)
   OMBI_API_KEY=(copied from the Ombi server, Settings, Ombi, Ombi Configuration, API Key)
   OMBI_URL=http://ombi_ip_or_fqdn:5000
   OMBI_USER=apiuser
   ```
     Editing the OMBI_USER is optional, but the user _must_ exist in Ombi.

2. Start the server

```
$ bundle exec foreman start
```

3. The bot should now be accessible in Slack, add it to a channel!

4. ?

5. Profit!

(optional) Linux auto-start:

1. create a script with the following lines:
```
#!/bin/bash
cd /path/to/ombibot
bundle exec foreman start
```
2. add script to statup using /etc/rc.local using screen (before Exit 0):
```
su - local_username -c "screen -dm bash -c /pathtoscript/script.sh"
```
3. reboot

Note: if there's ever a problem, you can access the bot by logging in as local_username and typing:
```
screen -r
```
  reboot, or re-run /etc/rc.local as root to restart the bot.

## How to use:

```
plex search ricky bobby
```

will return Talladega Nights: The Ballad of Ricky Bobby

Command Structure:

```
[trigger] [command] [expression]
```

- `trigger` - one of "plex" or "ombibot" or "ombi"
- `command` - one of "download" or "find" or "search" or "get" or "request"
- `expression` - the movie you're searching for (TV support coming soon.)

You can also send DMs to the bot, for your more embarassing requests. The DMs don't require the trigger word.

## Built With:

[Slack Ruby Bot](https://github.com/dblock/slack-ruby-bot)
