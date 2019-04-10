class TicketsController < ApplicationController
	#before_action :set_ticket , only[:show, :destroy, :update]
	skip_before_action :verify_authenticity_token
  def create
	@ticket = Ticket.create(params[:ticket_type_id], params[:order_id])
	render json: @ticket
  end

  def destroy
	@ticket = Ticket.find(params[:id]).destroy
	head :no_content
    	#respond_to do |format|
      	#format.html { redirect_to root_url }
      	#format.json { head :no_content }
  #end
end
  def update
	@ticket = Ticket.find(params[:id])
    if @ticket.update(params[:ticket_type_id], params[:order_id])
    	@ticket = Ticket.update(params[:ticket_type_id], params[:order_id])
	format.json {head :no_content }

    else
      format.json { render json: @ticket.errors, status: :unprocessable_entity }
    end
  end

  def show
	@ticket = Ticket.find(params[:id])
	render json: @ticket
  end
end


