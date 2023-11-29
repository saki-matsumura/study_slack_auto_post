require "slack-notify"
require 'clockwork'
require 'active_support/time'
require 'dotenv'
Dotenv.load

module Clockwork
  client = SlackNotify::Client.new(webhook_url: ENV["SLACK_WEBHOOK_URL"])
  every(3.minutes, 'time_stamp') do
    client.notify(Time.now)
  end
end

