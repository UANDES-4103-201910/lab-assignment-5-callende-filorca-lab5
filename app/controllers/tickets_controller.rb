class TicketsController < ApplicationController
	#before_action :set_ticket , only[:show, :destroy, :update]
	skip_before_action :verify_authenticity_token
  def create
	@ticket = Ticket.create(ticket_params)
	render json: @ticket
  end

	def destroy
		@ticket =Ticket.find(params[:id])
		@ticket.destroy
		respond_to do |format|
	      		format.json { head :no_content }
		end
	end

	def update
		respond_to do |format|
		    	if Ticket.find(params[:id]).update(ticket_params)
		    		@ticket = Ticket.find(params[:id]).update(ticket_params)
				format.json { head :no_content }
		    	else
		      		format.json { render json: @ticket.errors, status: :unprocessable_entity }
		    	end
	  	end
	end

	def show
		@ticket = Ticket.find(params[:id])
		render json: @ticket
	end
	def ticket_params
	  params.require(:ticket).permit(:ticket_type_id, :order_id)
	end

	def index
		@ticket = Ticket.all
		render json: @ticket
	end
end
