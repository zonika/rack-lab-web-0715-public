class Application
  def initialize

  end

  def self.call(env)
    request = Rack::Request.new(env)
    if request.path == '/'
      method = RequestMethod.new(self)
      m = method.call(env)
      number = RandomNumber.new(self)
      num = number.call(env)
      sp = ServerPort.new(self)
      port = sp.call(env)
      erb = ErbMaker.new(self)
      erbresponse = erb.call(env,'./lib/templates/index.html.erb',binding)
      # [200,{'Content-Type' => 'text/html'}, ["#{rand(100)}"]]
    else
      Rack::Response.new("<h1><a href='/'>Are you lost?</a></h1>")
    end
  end
end
