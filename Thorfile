require 'thor'
require 'fileutils'
require 'timeout'

class Packer < Thor

  desc 'validate', 'Validate all the packer templates'
  def validate
    Dir.chdir './packer' do
      templates = Dir.glob('*.json')
      templates.each do |template|
        puts "#{template}"
        unless system "packer validate #{template}"
          fail 'Validation failed!'
        end
        puts "\n"
      end
    end
  end

  desc 'clean', 'Remove temporary artifacts'
  def clean(what)
    if what == 'cache'
      FileUtils.rm_rf(Dir.glob('./packer/packer_cache'))
      FileUtils.rm_rf(Dir.glob('./packer/output-*-iso'))
    elsif what == 'boxes'
      FileUtils.rm_rf(Dir.glob('./builds/*/*.box'))
      FileUtils.rm_rf(Dir.glob('./builds/*/*_SHA256SUM'))
      FileUtils.rm_rf(Dir.glob('./builds/*/*_SHA512SUM'))
    end
  end

  desc 'build', 'Execute the packer builder'
  option :os, :banner => '<os>'
  option :os_version, :banner => '<os version>'

  def build
    Dir.chdir './packer' do
      template = "ubuntu-14.04.2-server-amd64.json"
      system "packer build --only=virtualbox-iso #{template}"
      system "shasum -a 256 ../builds/virtualbox/#{options[:os]}-#{options[:os_version]}-amd64_virtualbox.box > ../builds/virtualbox/#{options[:os]}-#{options[:os_version]}-amd64_virtualbox_SHA256SUM"
      system "shasum -a 512 ../builds/virtualbox/#{options[:os]}-#{options[:os_version]}-amd64_virtualbox.box > ../builds/virtualbox/#{options[:os]}-#{options[:os_version]}-amd64_virtualbox_SHA512SUM"
    end
  end

end
