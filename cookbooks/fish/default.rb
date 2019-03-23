package 'fish'

%w[fish fish/complications fish/conf.d fish/functions].each do |dir_name|
  directory "#{ENV['HOME']}/.config/#{dir_name}" do
    action :create
    user node[:user]
    not_if "test -d #{ENV['HOME']}/.config/#{dir_name}"
  end
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
