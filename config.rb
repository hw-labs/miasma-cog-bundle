version = "0.1.6"
env_vars = {
  :AWS_REGION => ENV['AWS_REGION'],
  :AWS_ACCESS_KEY_ID => ENV['AWS_ACCESS_KEY_ID'],
  :AWS_SECRET_ACCESS_KEY => ENV['AWS_SECRET_ACCESS_KEY']
}
Configuration.new do
  bundle do
    name "miasma"
    type "foreign"
    install "bin/install.sh"
  end
  templates []
  permissions []
  rules []
  commands array!(
    -> {
      name "list"
      version version
      env_vars env_vars
      executable "commands/miasma-list"
      enforcing false
      calling_convention "bound"
      documentation "List Stacks: `miasma:list`"
      options []
    },
    -> {
      name "find"
      version version
      env_vars env_vars
      executable "commands/miasma-find"
      enforcing false
      calling_convention "bound"
      documentation "Find Stacks by Name: `miasma:find <search string>`"
      options []
    },
    -> {
      name "describe"
      version version
      env_vars env_vars
      executable "commands/miasma-describe"
      enforcing false
      calling_convention "bound"
      documentation "Describe Stack: `miasma:describe <stack name>`"
      options []
    }
  )
end
