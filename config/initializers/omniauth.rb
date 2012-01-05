# Initialize Omniauth
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter,  ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET']
  provider :facebook, ENV['FB_APP_ID'], ENV['FB_APP_SECRET']
end
