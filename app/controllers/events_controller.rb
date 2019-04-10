class EventsController < ApplicationController
	#before_action :set_event , only[:show, :destroy, :update]
  def create
	@event = Event.create(params[:name], params[:description], params[:start_date],params[:event_venues_id])
	render json: @event
  end

  def destroy
	@event =Event.find(params[:id]).destroy
    	respond_to do |format|
      	format.html { redirect_to root_url }
      	format.json { head :no_content }
    end
  end

  def update
	@event = Event.find(params[:id])
    if @event.update(params[:name], params[:description], params[:start_date],params[:event_venues_id])
    	@event = Event.update(params[:name], params[:description], params[:start_date],params[:event_venues_id])
	format.json {head :no_content }

    else
      format.json { render json: @event.errors, status: :unprocessable_entity }
    end
  end

  def show
	@event = Event.find(params[:id])
	render json: @event
  end
end
