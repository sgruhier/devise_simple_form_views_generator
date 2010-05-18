class DeviseSimpleFormViewsGenerator < Rails::Generators::Base
  desc "Copies all simple_form Devise views to your application."
  
  argument :scope, :required => false, :default => nil,
                   :desc => "The scope to copy views to"
  
  class_option :template_engine, :type => :string, :aliases => "-t", :default => "erb",
                                 :desc => "Template engine for the views. Available options are 'erb' and 'haml'."
  
  def self.source_root
    @_devise_source_root ||= File.expand_path("../../../templates/", __FILE__)
  end

  def copy_views
    case options[:template_engine]
    when "haml"
      verify_haml_existence
      verify_haml_version
      create_and_copy_haml_views
    else
      directory "views", "app/views/#{scope || 'devise'}"
      directory "locales", "config/locales"
      directory "stylesheets", "public/stylesheets"
    end
  end
  
  def show_readme
    readme "README"
  end
  
  protected
  
  def readme(path)
    say File.read(File.expand_path(path, File.dirname(__FILE__)))
  end

  def verify_haml_existence
    begin
      require 'haml'
    rescue LoadError
      say "HAML is not installed, or it is not specified in your Gemfile."
      exit
    end
  end
  
  def verify_haml_version
    unless Haml.version[:major] == 2 and Haml.version[:minor] >= 3 or Haml.version[:major] >= 3
      say "To generate HAML templates, you need to install HAML 2.3 or above."
      exit
    end
  end
  
  def create_and_copy_haml_views
    require 'tmpdir'
    html_root = "#{self.class.source_root}/views"

    Dir.mktmpdir("devise-haml.") do |haml_root|
      Dir["#{html_root}/**/*"].each do |path|
        relative_path = path.sub(html_root, "")
        source_path   = (haml_root + relative_path).sub(/erb$/, "haml")

        if File.directory?(path)
          FileUtils.mkdir_p(source_path)
        else
          `html2haml -r #{path} #{source_path}`
        end
      end

      directory haml_root, "app/views/#{scope || 'devise'}"
    end
  end
end