Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '972900359228-t7ng3ggkhuvk8deimap7rkvsffgnfe7f.apps.googleusercontent.com', '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'
  provider :linkedin, '77ghweyzhv3h25', '8IhzGP2oJla772JU'
  provider :github, '36e66ab597cf401dda4e', '630b36720125b6692d4fceee37256b2d67bcce0f', :scope => 'email'
end



