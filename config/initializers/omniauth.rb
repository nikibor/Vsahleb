Rails.application.config.middleware.use OmniAuth::Builder do
  provider :vkontakte, '6193102' , 'HnFwoiQV1h2nCoo7BK2s',
           {
               :scope => 'email',
               :display => 'popup',
               :lang => 'en',
               :https => 1,
               :image_size => 'original'
           }
end
