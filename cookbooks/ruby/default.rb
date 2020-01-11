node.reverse_merge!(
  rbenv: {
    user: node[:user],
    global: '2.6.3',
    versions: %w[
      2.6.3
    ],
  }
)

include_recipe "rbenv::user"
