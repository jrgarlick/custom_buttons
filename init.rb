# plugins/custom_buttons/init.rb

require 'redmine'
require_relative 'lib/custom_buttons_hooks'

Redmine::Plugin.register :custom_buttons do
  name 'Redmine Custom Buttons Plugin'
  author 'Jim Garlick'
  description 'This plugin lets you add Tracker-specific buttons to your Issues.'
  version '0.0.1'
  url 'https://github.com/jrgarlick/redmine_custom_buttons'
  author_url 'https://github.com/jrgarlick'

  menu :admin_menu, :custom_buttons, { controller: 'custom_buttons', action: 'index' }, caption: 'Custom Buttons', html: { class: 'icon icon-report' }

  # Plugin settings (optional)
  # settings default: {}, partial: 'settings/custom_buttons_settings'
end

# Include the hook to add buttons to issue pages
Rails.configuration.to_prepare do
  require_dependency 'custom_buttons_hooks'
  require_dependency 'custom_buttons_helper'
end

ActionView::Base.send :include, CustomButtonsHelper
