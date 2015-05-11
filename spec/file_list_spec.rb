require 'spec_helper'
require 'tmpdir'

describe FileList, type: :model do

  before(:all) do
    TMPDIR = Dir.mktmpdir 
    Dir.open(TMPDIR) do
      puts Dir.pwd
      File.new('something.png', 'w')
    end
  end

  it "should fail on a non-existent directory" do
    expect{ FileList.new('/nonexistent-directory') }.to raise_error(ArgumentError)
  end

  it "should return an array" do
    expect(FileList.new(TMPDIR).list).to be_a(Array)
  end

  it "should return image names" do
    expect(FileList.new(TMPDIR).list.first).to eq('something.png')
  end
end
