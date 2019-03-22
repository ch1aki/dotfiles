package 'fish'

directory "#{ENV['HOME']}/.config/fish" do
  action :create
  not_if "test -d #{ENV['HOME']}/.config/fish"
end

directory "#{ENV['HOME']}/.config/fish/complications" do
  action :create
  not_if "test -d #{ENV['HOME']}/.config/fish/complications"
end

directory "#{ENV['HOME']}/.config/fish/conf.d" do
  action :create
  not_if "test -d #{ENV['HOME']}/.config/fish/conf.d"
end

directory "#{ENV['HOME']}/.config/fish/functions" do
  action :create
  not_if "test -d #{ENV['HOME']}/.config/fish/functions"
end

ln '.config/fish/config.fish' do
  source 'fish/config.fish'
end

ln '.config/fish/functions/fish_prompt.fish' do
  source 'fish/functions/fish_prompt.fish'
end

ln '.config/fish/fishfile' do
  source 'fish/fishfile'
end
