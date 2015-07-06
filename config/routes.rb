Rails.application.routes.draw do
  post "/slack/work", :to => "slack_commands#work"
end
