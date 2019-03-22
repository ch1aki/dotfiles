define :ln, source: nil do
  source = params[:source] || params[:name]
  dotfile = File.join(ENV['HOME'], params[:name])
  link dotfile do
    to File.expand_path("../../../config/#{source}", __FILE__)
  end
end
