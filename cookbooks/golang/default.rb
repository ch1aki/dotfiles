case node[:platform]
when 'darwin'
  package 'go'
when 'ubuntu'
  package 'golang-go'
when 'arch'
  package 'go'
end
