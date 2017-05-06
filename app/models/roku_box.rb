# == Schema Information
#
# Table name: roku_boxes
#
#  id         :integer          not null, primary key
#  ip_address :string(30)
#  port       :string(8)        default("8060")
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RokuBox < ApplicationRecord
  def base_uri
    "#{self.ip_address}:#{self.port}"
  end
end
