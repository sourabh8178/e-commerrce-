CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    config.storage = :file
  else   
    config.fog_provider = 'aws'

    config.fog_credentials = {
      :provider               => 'AWS',      
      :aws_access_key_id      => 'AKIAQOUJYAUQFKXHMCN3',
      :aws_secret_access_key  => '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', 
      :endpoint               => "https://s3-'Asia Pacific (Mumbai) ap-south-1'.amazonaws.com"
    }
    config.fog_directory  = 'pravyafarm'
    config.fog_attributes = { :cache_control => 'max-age=315576000', :expires => 1.year.from_now.httpdate }
  end
end
	