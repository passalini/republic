require 'rails_helper'

RSpec.describe GroupBillsController, :type => :controller do
  before(:each) { request.accept = Mime::JSON }

  let(:valid_attributes) {
    { observations: 'Pay me NOW!', month: 'october' }
  }

  let(:invalid_attributes) {
    { observations: 'surprise mother f*cker!', month: nil }
  }

  describe 'POST create' do
    context 'when params is valid' do
      let(:action) { post :create, { group_bill: valid_attributes} }

      it { action; is_expected.to respond_with :created }
      it { expect { action }.to change(GroupBill, :count).by(1) }
    end

    context 'when params is invalid' do
      let(:action) { post :create, { group_bill: invalid_attributes} }

      it { action; is_expected.to respond_with :unprocessable_entity }
      it { expect { action }.to_not change(GroupBill, :count) }
    end
  end

  describe 'PUT update' do
    let(:action)    { put :update, id: group_bill.id, group_bill: attributes }
    let(:group_bill){ create :group_bill, observations: 'foo', month: 'bar' }

    context 'when params is valid' do
      let(:attributes) { valid_attributes }

      it { action; is_expected.to respond_with :no_content }
      it { expect { action }.to change { group_bill.reload.observations }.
        from('foo').to('Pay me NOW!') }
    end

    context 'when params is invalid' do
      let(:attributes) { invalid_attributes }

      it { action; is_expected.to respond_with :unprocessable_entity }
      it { expect { action }.to_not change { group_bill.reload.month } }
    end
  end

  describe 'GET index' do
    it 'should return all group_bills as json' do
      group_bill = GroupBill.create! valid_attributes
      get :index
      expect(response.body).to be_json_eql([group_bill].to_json)
    end
  end

  describe 'GET show' do
    it 'should return a group_bill as json' do
      group_bill = GroupBill.create! valid_attributes
      get :show, id: group_bill.id
      expect(response.body).to be_json_eql(group_bill.to_json)
    end
  end

  describe 'DELETE destroy' do
    it 'should destroy a group_bill' do
      group_bill = create :group_bill

      expect { delete :destroy, id: group_bill.id }.to change(GroupBill, :count).by(-1)
    end
  end

end
