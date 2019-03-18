node.reverse_merge!(
  rbenv: {
    global: '2.6.0',
    versions: %w[
      2.6.0
      2.5.1
      2.4.0
    ],
  }
)

include_recipe "rbenv::user"
