#!/usr/bin/env ruby

require 'bogo-config'
require 'zip'

# Generate Config
config = Bogo::Config.new('config.rb').to_hash

File.open("config.yaml", "w") do |f|
    f.write(config.to_yaml)
end

bundle_files = Dir[ 'bin/*', 'commands/*' ] + %w(manifest.json config.yaml)

# Create .cog
Zip::File.open("miasma.cog", Zip::File::CREATE) do |z|
  bundle_files.each do |f|
    z.add("miasma/#{f}", f)
  end
end
