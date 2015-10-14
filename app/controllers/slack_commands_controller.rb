class SlackCommandsController < ApplicationController

  before_filter :slash_command_auth

  WHITELIST_TOKENS = [
    ENV["SLACK_WORK_COMMAND_TOKEN"],
    ENV["SLACK_CREATE_CARD_COMMAND_TOKEN"],
    ENV["SLACK_RETRO_COMMAND_TOKEN"],
    ENV["SLACK_COPY_CARDS_COMMAND_TOKEN"]
  ].compact

  def work
    response = SlackTrello::WorkCommand.new(params, ENV["SLACK_WEBHOOK_URL"]).run
    render text: response
  end

  def create_card
    response = SlackTrello::CreateCardCommand.new(params, ENV["SLACK_WEBHOOK_URL"]).run
    render text: response
  end

  def retro
    response = SlackTrello::RetroCommand.new(params, ENV["SLACK_WEBHOOK_URL"]).run
    render text: response
  end

  def copy_cards
    response = SlackTrello::CopyCardsCommand.new(params, ENV["SLACK_WEBHOOK_URL"]).run
    render text: response
  end

  private

  def slash_command_auth
    unless WHITELIST_TOKENS.include?(params[:token])
      render text: "Unauthorized", status: :unauthorized
    end
  end

end

