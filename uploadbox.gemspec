$:.push File.expand_path('../lib', __FILE__)

require 'uploadbox/version'

Gem::Specification.new do |s|
  s.name        = 'uploadbox'
  s.version     = Uploadbox::VERSION
  s.authors     = ['Julio Protzek', 'Renato Carvalho']
  s.email       = ['julio@startae.com.br', 'renato@startae.com.br']
  s.homepage    = 'https://github.com/startae/uploadbox'
  s.summary     = 'Ajax file uploader for Rails applications.'
  s.description = 'Uploadbox makes easy to manage files in your Rails application.'

  s.required_ruby_version = '>= 1.9.3'

  s.license = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails',                  '>= 4.0.4', '< 5'
  s.add_dependency 'fog',                    '~> 1.25', '>= 1.25.0'
  s.add_dependency 'carrierwave',            '~> 0.9', '>= 0.9.0'
  s.add_dependency 'carrierwave-processing', '~> 0.0', '>= 0.0.2'
  s.add_dependency 'mini_magick',            '~> 3.6', '>= 3.6.0'
  s.add_dependency 'jbuilder',               '>= 1.2', '< 3'
  s.add_dependency 'resque',                 '~> 1.25', '>= 1.25.0'
  s.add_dependency 'sidekiq',                '~> 3.0.2', '>= 3.0.0'
  s.add_dependency 'redis',                  '~> 3.0', '>= 3.0.4'
  s.add_dependency 'heroku-api',             '~> 0.3', '>= 0.3.15'
  s.add_dependency 'dotenv-rails',           '~> 0.10','>= 0.10.0'
  s.add_dependency 'browser',                '~> 0.4', '>= 0.4.1'

  s.add_development_dependency 'jquery-rails',       '~> 3.0', '>= 3.0.4'
  s.add_development_dependency 'better_errors',      '~> 0.9', '>= 0.9.0'
  s.add_development_dependency 'binding_of_caller',  '~> 0.7', '>= 0.7.2'
  s.add_development_dependency 'pg',                 '~> 0.17', '>= 0.17.1'
  s.add_development_dependency 'rspec-rails',        '3.0.0.beta1'
  s.add_development_dependency 'capybara',           '~> 2.1', '>= 2.1.0'
  s.add_development_dependency 'factory_girl_rails', '~> 4.2', '>= 4.2.1'
  s.add_development_dependency 'poltergeist',        '~> 1.3', '>= 1.3.0'
  s.add_development_dependency 'database_cleaner',   '1.0.1'
  s.add_development_dependency 'sham_rack',          '~> 1.3', '>= 1.3.6'
  s.add_development_dependency 'simplecov',          '~> 0.7', '>= 0.7.1'
  s.add_development_dependency 'pry-rails',          '~> 0.3', '>= 0.3.2'
  s.add_development_dependency 'launchy',            '~> 2.4', '>= 2.4.2'
  s.add_development_dependency 'sass-rails',         '~> 4.0', '>= 4.0.2'
  s.add_development_dependency 'coffee-rails',       '~> 4.0', '>= 4.0.0'
  s.add_development_dependency 'slim',               '~> 2.0', '>= 2.0.1'
end
