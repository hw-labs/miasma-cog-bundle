# miasma-cog-bundle
A Cog Bundle to install a command set for interacting with Cloud providers using the Miasma library

## Dependencies
Currently, these dependencies must be installed separately.
* Ruby 2.x
* bundler gem
* miasma gem
* miasma-aws gem

## Installation
* Clone the git repo as the operable/cog user
* `cd` to the repo & run `bundle install`
* Export the following Environment Variables:
  ```
  AWS_ACCESS_KEY_ID
  AWS_SECRET_ACCESS_KEY
  AWS_REGION
  ```
  These credentials need access to:
  ```
  "cloudformation:DescribeStacks",
  "cloudformation:DescribeStackEvents",
  "cloudformation:DescribeStackResource",
  "cloudformation:DescribeStackResources",
  "cloudformation:GetTemplate",
  "cloudformation:List*"
  ```
  Amazon provides this via the `arn:aws:iam::aws:policy/AWSCloudFormationReadOnlyAccess` policy
* run `bundle exec scripts/build.rb` to generate `miasma.cog`
* `mv` or `cp` `miasma.cog` to the `relay/data/pending` directory

## Scripts

* release.rb - Generates manifest.json and config.yaml (or config.json)
* build.rb - Generates miasma.cog installation file.
