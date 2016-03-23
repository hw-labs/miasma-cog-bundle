#!/usr/bin/env ruby

require 'bogo-config'
require 'digest'
require 'json'
require "zip"

# Create Build Directory
Dir.mkdir(".build") unless Dir.exists?(".build")

# Generate Config
config = Bogo::Config.new('config.rb').to_hash

if ARGV[0] == "json"
  File.open(".build/config.json", "w") do |f|
    f.write(JSON.pretty_generate(config))
  end
else
  File.open(".build/config.yaml", "w") do |f|
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

File.open(".build/manifest.json", "w") do |f|
  f.write(JSON.pretty_generate(manifest))
end

# Create .cog
Zip::File.open("miasma.cog", Zip::File::CREATE) do |z|
  bundle_files.each do |f|
    z.add(f, f)
  end
  Dir.glob(".build/*").each do |f|
    z.add(File.basename(f), f)
  end
end

# Cleanup
Dir.glob(".build/*").each do |f|
  File.delete(f)
end

Dir.delete(".build")
