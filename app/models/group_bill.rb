class GroupBill < ActiveRecord::Base
  validates :month, :observations, presence: true
end
