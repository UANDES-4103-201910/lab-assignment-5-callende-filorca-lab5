class UsersController < ApplicationController
	#before_action :set_user , only[:show, :destroy, :update]
	skip_before_action :verify_authenticity_token
  def create
	@user = User.create(params[:name], params[:lastname], params[:email], params[:password], params[:address])
	render json: @user
  end

  def destroy
	@user =User.find(params[:id])
	@user.destroy
	#@user.destroy
	#head :no_content
    	respond_to do |format|
      	format.html { redirect_to root_url }
      	format.json { head :no_content }
    end
  end

  def update
	@user = User.find(params[:id])
    if @user.update_attributes(user_params)
    	@user = User.update(params[:name], params[:lastname], params[:email], params[:password], params[:address])
	format.json {head :no_content }

    else
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end

  def show
	@user = User.find(params[:id])
	render json: @user
  end
	def user_params
	  params.require(:user).permit(:name, :lastname, :email, :password, :address)
	end
end
