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
  option :atlas_version, :banner => '<atlas version>'
  option :os, :banner => '<os>'
  option :os_version, :banner => '<os version>'
  option :providers, :banner => '<providers>'

  def build
    Dir.chdir './packer' do
      templates = Dir.glob("#{options[:os]}-#{options[:os_version]}-amd64.json")
      templates.each do |template|
        providers = options[:providers].split(",")
        providers.each do |provider|
          system "packer build --only=#{provider}-iso -var 'PACKER_ATLAS_VERSION=#{options[:atlas_version]}' #{template}"
          system "shasum -a 256 ../builds/#{provider}/#{options[:os]}-#{options[:os_version]}-amd64_#{provider}.box > ../builds/#{provider}/#{options[:os]}-#{options[:os_version]}-amd64_#{provider}_SHA256SUM"
          system "shasum -a 512 ../builds/#{provider}/#{options[:os]}-#{options[:os_version]}-amd64_#{provider}.box > ../builds/#{provider}/#{options[:os]}-#{options[:os_version]}-amd64_#{provider}_SHA512SUM"
        end
      end
    end
  end

end
