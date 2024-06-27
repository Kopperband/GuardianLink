# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

@secret = ENV['SECRET_KEY_BASE'] || 'e6f049159561e1e1'
