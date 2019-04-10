class EventVenuesController < ApplicationController
	before_action :set_event_venue , only[:show, :destroy, :update]
  def create
	@event_venue = EventVenue.create(params[:name], params[:address], params[:capacity])
	render json: @event_venue
  end

  def destroy
	@event_venue =EventVenue.find(params[:id]).destroy
    	respond_to do |format|
      	format.html { redirect_to root_url }
      	format.json { head :no_content }
    end
  end

  def update
  end

  def show
	@event_venue = EventVenue.find(params[:id])
	render json: @event_venue
  end
end
