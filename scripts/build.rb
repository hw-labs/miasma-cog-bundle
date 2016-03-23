#!/usr/bin/env ruby

require "zip"

bundle_files = Dir[ 'bin/*', 'commands/*' ]

# Create .cog
Zip::File.open("miasma.cog", Zip::File::CREATE) do |z|
  bundle_files.each do |f|
    z.add(f, f)
  end
  Dir.glob(".build/*").each do |f|
    z.add(File.basename(f), f)
  end
end
