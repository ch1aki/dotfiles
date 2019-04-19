cask 'alacritty'

directory "#{ENV['HOME']}/.config/alacritty" do
  action :create
  user node[:user]
end

ln '.config/alacritty/alacritty.yml' do
  source 'alacritty.yml'
end