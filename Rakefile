# encoding: UTF-8
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "devise_simple_form_views_generator"
    s.version = VERSION.dup
    s.summary = "Views generator for devise gem. Views are generated to be used with simple_form gem. It also adds full i18N support"
    s.email = "sebastien.gruhier@xilinus.com.br"
    s.homepage = "http://github.com/sgruhier/devise_simple_form_view_generator"
    s.description = "Views generator for devise gem. Views are generated to be used with simple_form gem. It also adds full i18N support"
    s.authors = ['Sébastien Gruhier']
    s.files =  FileList["[A-Z]*", "{lib}/**/*"]
    s.extra_rdoc_files = FileList["[A-Z]*"] - %w(Gemfile Rakefile)
    s.add_dependency("devise", "~> 1.1")
    s.add_dependency("simple_form", "~> 1.1.3")
  end

  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler, or one of its dependencies, is not available. Install it with: [sudo] gem install technicalpickles-jeweler -s http://gems.github.com"
end
