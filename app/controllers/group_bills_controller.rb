class GroupBillsController < ApplicationController
  respond_to :json
  before_action :set_group_bill, only: [:show, :update, :destroy]

  def index
    respond_with GroupBill.all
  end

  def show
    respond_with @group_bill
  end

  def create
    group_bill = GroupBill.new(group_bill_params)
    group_bill.save
    respond_with group_bill
  end

  def update
    @group_bill.update group_bill_params
    respond_with @group_bill
  end

  def destroy
    @group_bill.destroy
    respond_to do |format|
      format.html { redirect_to group_bills_url, notice: 'Group bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_group_bill
      @group_bill = GroupBill.find(params[:id])
    end

    def group_bill_params
      params.require(:group_bill).permit(:month, :observations)
    end
end
