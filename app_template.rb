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

# Bootstrap適用
gem 'sass-rails',   '~> 3.2.3'
gem 'bootstrap-sass', '~> 3.0.2.0'

run "rm app/assets/stylesheets/application.css"

file 'app/assets/stylesheets/application.css.scss', <<-CODE
@import "bootstrap";
@import "bootstrap/theme";
CODE

inject_into_file 'app/assets/javascripts/application.js', after: "//= require_tree .\n" do <<-CODE
// Loads all Bootstrap javascripts
//= require bootstrap/affix
//= require bootstrap/alert
//= require bootstrap/button
//= require bootstrap/carousel
//= require bootstrap/collapse
//= require bootstrap/dropdown
//= require bootstrap/tab
//= require bootstrap/transition
//= require bootstrap/scrollspy
//= require bootstrap/modal
//= require bootstrap/tooltip
//= require bootstrap/popover
CODE
end

# 日本語対応
gsub_file 'config/application.rb', '# config.i18n.default_locale = :de', 'config.i18n.default_locale = :ja'

gem 'i18n_generators'

# ページング
gem 'kaminari'

# アプリケーションセットアップ
#generate(:scaffold, "account", "bs_pl_division:string", "debit_credit_division:string", "code:string","name:string","parent_code:string")


