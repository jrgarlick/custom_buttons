# plugins/custom_buttons/app/models/custom_button.rb
class CustomButton < ActiveRecord::Base
  belongs_to :tracker

  validates :title_template, :url_template, :location, presence: true
  validates :location, inclusion: { in: %w[details description] }
  default_scope { order(:position) }
end