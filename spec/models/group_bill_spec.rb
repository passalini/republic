require 'rails_helper'

RSpec.describe GroupBill, :type => :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :month }
    it { is_expected.to validate_presence_of :observations }
  end
end
