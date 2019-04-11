class EventVenuesController < ApplicationController
	before_action :set_event_venue , only[:show, :destroy, :update]
	skip_before_action :verify_authenticity_token
def create
	@event_venue = EventVenue.create(user_params)
	render json: @event_venue
  end

  def destroy
	@event_venue =EventVenue.find(params[:id])
	@event_venue.destroy
    respond_to do |format|
      	format.json { head :no_content }
    end
  end

  def update
	respond_to do |format|
	    	if EventVenue.find(params[:id]).update(user_params)
	    		@event_venue = EventVenue.find(params[:id]).update(user_params)
			format.json { head :no_content }
	    	else
	      		format.json { render json: @event_venue.errors, status: :unprocessable_entity }
	    	end
  	end
  end

  def show
	@event_venue = EventVenue.find(params[:id])
	render json: @event_venue
  end
	def user_params
	  params.require(:event_venue).permit(:name, :address, :capacity)
	end
end
