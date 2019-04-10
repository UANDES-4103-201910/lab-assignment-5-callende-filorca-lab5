class UsersController < ApplicationController
	#before_action :set_user , only[:show, :destroy, :update]
  def create
	@user = User.create(params[:name], params[:lastname], params[:email], 	params[:password], params[:address])
	render json: @user
  end

  def destroy
	@user =User.find(params[:id]).destroy
    	respond_to do |format|
      	format.html { redirect_to root_url }
      	format.json { head :no_content }
    end
  end

  def update
	@user = User.find(params[:id])
    if @user.update(params[:name], params[:lastname], params[:email], 		params[:password], params[:address])
    	@user = User.update(params[:name], params[:lastname], params[:email], 		params[:password], params[:address])
	format.json {head :no_content }

    else
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end

  def show
	@user = User.find(params[:id])
	render json: @user
  end
end
