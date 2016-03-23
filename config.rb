version = "0.1.0"
Configuration.new do
  bundle do
    name "miasma"
    type "foreign"
    install "/usr/bin/touch /tmp/miasma.installed"
  end
  templates []
  permissions []
  rules []
  commands array!(
    -> {
      name "list"
      version version
      executable "/usr/local/bin/miasm-list"
      enforcing false
      calling_convention "bound"
      documentation "List Stacks: `miasma:list`"
      options []
    },
    -> {
      name "find"
      version version
      executable "/usr/local/bin/miasma-find"
      enforcing false
      calling_convention "bound"
      documentation "Find Stacks by Name: `miasma:find <search string>`"
      options []
    },
    -> {
      name "describe"
      version version
      executable "/usr/local/bin/miasma-describe"
      enforcing false
      calling_convention "bound"
      documentation "Describe Stack: `miasma:describe <stack name>`"
      options []
    }
  )
end
