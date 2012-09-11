#!/usr/bin/env ruby

# Commit filter not to commit your Github API token.

input = STDIN.read
filename = ARGV.first
secrets = {
  /token =/ => 'Github API token?'
}

output = []
input.lines.with_index do |line, i|
  errors = []
  secrets.each do |pattern, error|
    errors << error if pattern =~ line
  end
  
  if errors.size > 0
    STDERR.puts "Ignored #{filename}:#{i}. #{errors.join(' & ')}"
  else
    output << line
  end
end

STDOUT.puts output.join('')
