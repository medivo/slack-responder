Rails.application.routes.draw do
  post "/slack/work", :to => "slack_commands#work"
  post "/slack/retro", :to => "slack_commands#retro"
  post "/slack/create_card", :to => "slack_commands#create_card"
end
