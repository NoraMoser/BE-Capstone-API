class UsersController < ApplicationController
  skip_before_action :authenticate_request 
  before_action :set_user, only: [:show, :update, :destroy]
  
  def authenticate 
    command = AuthenticateUser.call(params[:email], params[:password]) 
    
    if command.success? 
      render json: { auth_token: command.result[:token], user_id: command.result[:user_id] } 
    else 
      render json: { error: command.errors }, status: :unauthorized 
    end
  end

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    puts user_params
    @user = User.new(user_params)

    if @user.save
      render json: @user
    else
      render json: @user.errors
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:admin, :first_name, :last_name, :grade_level, :email, :password)
    end
end
