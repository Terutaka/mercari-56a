require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module Mercari56a
  class Application < Rails::Application
    config.load_defaults 5.2

  # ========== 不要なGEMは作成しない ==========
    config.generators do |g|
      g.stylesheets   false
      g.javascripts   false
      g.helper        false
      g.test_framework false
    end

  # ========== 設定を原則日本 ==========
    config.i18n.default_locale = :ja
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

  # ========== 各種画像形式をAssets ==========
  Rails.application.config.assets.precompile += %w(*.eot *.woff *.woff2 *.ttf *.svg *.otf *.png *.jpg *.gif )
  end
end
