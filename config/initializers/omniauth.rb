Rails.application.config.middleware.use OmniAuth::Builder do
  provider :vkontakte, '6229627' , 'dIrqmABaIe0Hjvvd8ZmO',
           {
               :scope => 'email',
               :display => 'popup',
               :lang => 'en',
               :https => 1,
               :image_size => 'original'
           }
end
