class EventsController < ApplicationController
	#before_action :set_event , only[:show, :destroy, :update]
	skip_before_action :verify_authenticity_token
  def create
	@event = Event.create(event_params)
	render json: @event
  end

  def destroy
	@event =Event.find(params[:id])
	@event.destroy
    respond_to do |format|
      	format.json { head :no_content }
    end
  end

  def update
	respond_to do |format|
	    	if Event.find(params[:id]).update(event_params)
	    		@event = Event.find(params[:id]).update(event_params)
			format.json { head :no_content }
	    	else
	      		format.json { render json: @event.errors, status: :unprocessable_entity }
	    	end
  	end
  end

  def show
	@event = Event.find(params[:id])
	render json: @event
  end
	def event_params
	  params.require(:event).permit(:name, :description, :start_date, :event_venue_id)
	end
end
