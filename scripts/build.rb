#!/usr/bin/env ruby

require "zip"

bundle_files = Dir[ 'bin/*', 'commands/*' ] + %w(manifest.json config.yaml)

# Create .cog
Zip::File.open("miasma.cog", Zip::File::CREATE) do |z|
  bundle_files.each do |f|
    z.add("miasma/#{f}", f)
  end
end
