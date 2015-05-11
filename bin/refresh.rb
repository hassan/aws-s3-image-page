#!/usr/bin/env ruby
Dir["../lib/*.rb"].each { |file| require file }

directory = ARGV[0] || '/Users/hassan/Dropbox/jewelry screenshots/'
bucket = ARGV[1] || 'elleschroeder-screenshots'

S3Refresh.new(directory, bucket).upload_files
