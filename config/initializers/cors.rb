

Rails.application.config.middleware.insert_before 0, Rack::Cors do
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