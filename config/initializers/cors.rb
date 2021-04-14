

Rails.application.config.middleware.insert_before 0, Rack::Cors do
<<<<<<< HEAD
    allow do
      origins 'http://localhost:3001'
  # Make sure to change the * to the location of you frontend after deployment in order to secure your application
  resource '*',
               headers: :any,
               methods: %i[get post put patch delete options head],
               credentials: true
    end
  end
=======
  allow do
    origins "http://localhost:3000"
    resource "*", headers: :any, methods: [ :get, :post, :put, :patch, :delete, :options, :head ],
    credentials: true #allow you to pass the cookie from fontend to backkend app
  end
  
  #allow do
  #    origins "http://farha-heroku.heroku.com"
  #    resource "*", headers: :any, methods: [ :get, :post, :put, :patch, :delete, :options, :head ],
  #credentials: true #allow you to pass the cookie from fontend to backkend app
  #  end
  
end
>>>>>>> FIX-register-user
