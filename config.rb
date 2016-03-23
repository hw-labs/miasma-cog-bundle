version = "0.1.5"
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
      executable "commands/miasma-list"
      enforcing false
      calling_convention "bound"
      documentation "List Stacks: `miasma:list`"
      options []
    },
    -> {
      name "find"
      version version
      executable "commands/miasma-find"
      enforcing false
      calling_convention "bound"
      documentation "Find Stacks by Name: `miasma:find <search string>`"
      options []
    },
    -> {
      name "describe"
      version version
      executable "commands/miasma-describe"
      enforcing false
      calling_convention "bound"
      documentation "Describe Stack: `miasma:describe <stack name>`"
      options []
    }
  )
end
