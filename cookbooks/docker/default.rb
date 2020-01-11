node.reverse_merge!(
  docker: {
    user: node[:user],
  }
)

include_recipe "docker::install"

