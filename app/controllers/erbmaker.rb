class ErbMaker
  def initialize(app)
    @app = app
  end

  def call(env, file = './lib/templates/plainindex.html.erb',b = binding)
    template = File.read(file)
    result = ERB.new(template).result(b)
    [200,{'Content-Type' => 'text/html'}, ["#{result}"]]
  end
end
