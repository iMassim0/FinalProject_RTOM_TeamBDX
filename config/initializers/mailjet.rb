Mailjet.configure do |config|
  config.api_key = ENV["MJ_PUBLIC"]
  config.secret_key = ENV["MJ_SECRET"]
  config.default_from = 'resiliencetravelofmango'
end
