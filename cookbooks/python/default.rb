case node[:platform]
when 'darwin'
  package 'pipenv'
  package 'pyenv'
when 'ubuntu'
  package 'python3-pip'
when 'arch'
  package 'python3'
end

unless node[:platform] == "darwin"
  pyenv_root = "#{ENV['HOME']}/.pyenv"
  git "#{pyenv_root}" do
    repository "https://github.com/pyenv/pyenv.git"
    user node[:user]
    not_if "test -d #{pyenv_root}"
  end

  execute 'get-pipenv.py' do
    command 'curl https://raw.githubusercontent.com/kennethreitz/pipenv/master/get-pipenv.py | python'
  end
end
