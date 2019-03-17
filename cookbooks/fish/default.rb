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

link "#{ENV['HOME']}/.config/fish/config.fish" do
  to "#{ENV['HOME']}/dotfiles/config/fish/config.fish"
  force true
end

link "#{ENV['HOME']}/.config/fish/functions/fish_prompt.fish" do
  to "#{ENV['HOME']}/dotfiles/config/fish/functions/fish_prompt.fish"
  force true
end

link "#{ENV['HOME']}/.config/fish/fishfile" do
  to "#{ENV['HOME']}/dotfiles/config/fish/fishfile"
  force true
end