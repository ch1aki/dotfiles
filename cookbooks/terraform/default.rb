case node[:platform]
when 'darwin'
  package 'tfenv'
when 'ubuntu', 'arch'
  git "#{ENV['HOME']}/.tfenv" do
    repository 'https://github.com/tfutils/tfenv.git'
  end

  %w[tfenv terraform].each do |cmd|
    link "/usr/local/bin/#{cmd}" do
      to "#{ENV['HOME']}/.tfenv/bin/#{cmd}"
    end
  end
end
