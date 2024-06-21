# frozen_string_literal: true

# Load gems
require 'dotenv/load'
require 'nylas'

# Initialize Nylas client
nylas = Nylas::Client.new(
  api_key: ENV['V3_TOKEN']
)

# Request Body
request_body = {
  trigger_types: [Nylas::WebhookTrigger::EVENT_CREATED],
  webhook_url: 'https://YOUR_URL.koyeb.app/webhook',
   description: 'My first webhook',
  notification_email_address: [ENV['GRANT_ID']]
}

webhooks, = nylas.webhooks.create(request_body: request_body)
puts webhooks
