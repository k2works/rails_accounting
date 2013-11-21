# -*- coding: utf-8 -*-
# RSpecの設定
# Gemfileを編集する。
gem_group :development, :test do
  gem "rspec-rails",'~>2.0'
  gem "factory_girl_rails"
  gem "database_cleaner"
  gem "email_spec"  
end

# RSpecをセットアップする。
generate "rspec:install"

# DatabaseCleanerの設定をする。
inject_into_file 'spec/spec_helper.rb', after: "config.order = \"random\"\n" do <<-'RUBY'
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
RUBY
end

# Email Specの設定
inject_into_file 'spec/spec_helper.rb', after: "RSpec.configure do |config|\n" do <<-'RUBY'
  config.include(EmailSpec::Helpers)
  config.include(EmailSpec::Matchers)
RUBY
end

# Rails Generatorの設定。
inject_into_file 'config/application.rb', after: "class Application < Rails::Application\n" do <<-'RUBY'
    # don't generate RSpec tests for views and helpers
    config.generators do |g|
      g.test_framework :rspec, fixture: true
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.view_specs false
      g.helper_specs false
      g.stylesheets = false
      g.javascripts = false
      g.helper = false
    end
RUBY
end

# RSpecの実行
rake "-T"
rake "db:migrate"
rake "db:test:prepare"
rake "spec"
#controller,modelテストの作成
#Cucumberの設定
# Gemの追加
gem_group :development, :test do
  gem "cucumber-rails" , require: false
  gem "capybara"
  gem "database_cleaner"
  gem "email_spec"  
end

generate "cucumber:install"

# 設定ファイル編集
inject_into_file 'features/support/env.rb', after: "Cucumber::Rails::Database.javascript_strategy = :truncation\n" do <<-'RUBY'
require 'debugger'
RUBY
end

file 'features/support/email_spec.rb', <<-CODE
require 'email_spec/cucumber'
CODE

file 'features/support/email_spec.rb', <<-CODE
require 'email_spec/cucumber'
CODE

# Email Specの設定
generate "email_spec:steps"

# Cucumberの実行

# Cucumberシナリオ作成
