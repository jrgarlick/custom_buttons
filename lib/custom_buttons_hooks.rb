# plugins/custom_buttons/lib/custom_buttons_hooks.rb
class CustomButtonsHooks < Redmine::Hook::ViewListener
  include CustomButtonsHelper

  render_on :view_issues_show_details_bottom, partial: 'custom_buttons/issue_buttons_details'
  render_on :view_issues_show_description_bottom, partial: 'custom_buttons/issue_buttons_description'
end


#  :view_issues_index_bottom