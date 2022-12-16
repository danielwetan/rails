class CustomMiddleware 
  def initialize(app)
    @app = app 
  end

  def call(env)
    puts "Custom middleware triggered"
    @app.call(env)
  end
end

