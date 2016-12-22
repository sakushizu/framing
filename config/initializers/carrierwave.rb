CarrierWave.configure do |config|
    config.storage = :fog
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Settings.aws.access_key_id
    aws_secret_access_key: Settings.aws.secret_access_key
    region: 'us-east-1'
  }

    case Rails.env
    when 'development'
        config.fog_directory  = 'sakura-framing'
        config.asset_host = 'https://s3.amazonaws.com/sakura-framing'
    when 'production'
        config.fog_directory  = 'sakura-framing'
        config.asset_host = 'https://s3.amazonaws.com/sakura-framing'
    end
end
