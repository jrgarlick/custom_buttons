# plugins/custom_buttons/app/controllers/custom_buttons_controller.rb
class CustomButtonsController < ApplicationController
  layout 'admin'
  before_action :require_admin

  def index
    @trackers = Tracker.all
    @buttons_by_tracker = CustomButton.all.group_by(&:tracker_id)
  end

  def update
    params[:custom_buttons].each do |tracker_id, buttons|
      CustomButton.where(tracker_id: tracker_id).destroy_all
      buttons.each do |button|
        # Skip blank rows
        next if button["title_template"].blank? || button["url_template"].blank?

        CustomButton.create!(
          tracker_id: tracker_id,
          title_template: button[:title_template],
          url_template: button[:url_template],
          location: button[:location] || 'top',
          position: button[:position] || 0,
          active: button[:active] == '1',
          icon_class: button[:icon_class] || ''
        )
      end
    end
    redirect_to custom_buttons_path, notice: 'Buttons updated successfully.'
  end
end