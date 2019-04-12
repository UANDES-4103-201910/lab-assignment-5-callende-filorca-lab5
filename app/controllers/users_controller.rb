class UsersController < ApplicationController
	#before_action :set_user , only[:show, :destroy, :update]
	skip_before_action :verify_authenticity_token
  def create
	@user = User.create(user_params)
	render json: @user
  end

  def destroy
	@user =User.find(params[:id])
	@user.destroy
    respond_to do |format|
      	format.json { head :no_content }
    end
  end

  def update
	respond_to do |format|
	    	if User.find(params[:id]).update(user_params)
	    		@user = User.find(params[:id]).update(user_params)
			format.json { head :no_content }
	    	else
	      		format.json { render json: @user.errors, status: :unprocessable_entity }
	    	end
  	end
  end

  def show
	@user = User.find(params[:id])
	render json: @user
  end
	def user_params
	  params.require(:user).permit(:name, :lastname, :email, :password, :address)
	end

  def user_with_most_tickets
	@user = User.joins(:orders => :tickets).group(:user_id).order(:desc).limit(1)
	render json: @user
  end
end
#{"user":{"name":"AAA","lastname":"BBB","email":null,"password":"ABC","address":"CBA"}}
