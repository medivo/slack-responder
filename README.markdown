== README

The slack-responder app responds to Trello POST requests and creates Trello cards :smile:.  Our [Slack Slash Command blog post](http://www.medivo.com/blog/slack-slash-command-to-trello/) provides a detailed walkthrough to get this app up-and-running to create cards on Trello backlog boards that correspond with Slack channels.  Here's the TL;DR:

1. Deploy the app to Heroku (you can deploy elsewhere, but the app is all set up for Heroku).

2. Get the environment variables that are required to run the app.

- Log into Trello & go to [this site](https://trello.com/app-key) to get the `TRELLO_DEV_PUBLIC_KEY`.  
- Go to this page to get the `TRELLO_MEMBER_TOKEN`: https://trello.com/1/authorize?key=[THE_APP_KEY]&name=trello-show&expiration=never&response_type=token&scope=read,write  Slack will be creating cards, so it's imperative that scope=read,write is set.  
- Go to https://[YOUR_TEAM_DOMAIN].slack.com/services/new/incoming-webhook and choose a channel (it doesn't matter which channel you choose) to get the `SLACK_WEBHOOK_URL`.  
- Go to https://[YOUR_TEAM_DOMAIN].slack.com/services/new/slash-commands and create a custom slash command.  Type in /work, click the button, and grab the token from the next screen.  Route the POST request to http://[HEROKU_APP_NAME]/slack/work.  Use this token to set the `SLACK_WORK_COMMAND_TOKEN`.  Create two more custom slash commands for /retro and /card and use the tokens that are provided to set `SLACK_RETRO_COMMAND_TOKEN` and `SLACK_CREATE_CARD_COMMAND_TOKEN'.  

3. [Set the environment variables in Heroku](https://devcenter.heroku.com/articles/config-vars).

Additional features will be added soon!

Feel free to submit a pull request if you have any improvements.
