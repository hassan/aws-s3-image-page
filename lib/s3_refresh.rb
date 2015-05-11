require 'aws-sdk'
require_relative 'utilities'

class S3Refresh
  include Utilities

  def initialize(dir, bucket_name)
    @dir = dir
    @bucket_name = bucket_name
  end

  def s3
    Aws::S3::Client.new(region: ENV['AWS_REGION'] || 'us-east-1' )
  end

  def bucket
    Aws::S3::Bucket.new(@bucket_name)
  end

  def file_list
    FileList.new(@dir).list
  end

  def index_page
    IndexPage.new(file_list).make_page
  end

  def upload_files
    Dir.chdir(@dir)
    file_list.each do |file_name|
      bucket.put_object(key: file_name, body: File.new(file_name))
    end
    bucket.put_object(key: 'index.html', body: index_page)
  end

end
