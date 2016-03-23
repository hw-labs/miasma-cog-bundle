#!/usr/bin/env ruby

require 'bogo-config'
require 'digest'
require 'json'

# Generate Config
config = Bogo::Config.new('config.rb').to_hash

if ARGV[0] == "json"
  File.open("config.json", "w") do |f|
    f.write(JSON.pretty_generate(config))
  end
else
  File.open("config.yaml", "w") do |f|
    f.write(config.to_yaml)
  end
end

# Generate Manifest
manifest = {
  "files" => []
}

bundle_files = Dir[ 'bin/*', 'commands/*' ]

bundle_files.each do |file|
  manifest["files"].push(
    {
      "path" => file,
      "sha256" => Digest::SHA256.file(file).hexdigest
    }
  )
end

File.open("manifest.json", "w") do |f|
  f.write(JSON.pretty_generate(manifest))
end
