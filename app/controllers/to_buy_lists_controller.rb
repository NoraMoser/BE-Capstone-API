class ToBuyListsController < ApplicationController
  before_action :set_to_buy_list, only: [:show, :update, :destroy]

  # GET /to_buy_lists
  def index
    @to_buy_lists = ToBuyList.all

    render json: @to_buy_lists
  end

  # GET /to_buy_lists/1
  def show
    render json: @to_buy_list
  end

  # POST /to_buy_lists
  def create
    @to_buy_list = ToBuyList.new(to_buy_list_params)

    if @to_buy_list.save
      render json: @to_buy_list, status: :created, location: @to_buy_list
    else
      render json: @to_buy_list.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /to_buy_lists/1
  def update
    if @to_buy_list.update(to_buy_list_params)
      render json: @to_buy_list
    else
      render json: @to_buy_list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /to_buy_lists/1
  def destroy
    @to_buy_list.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_to_buy_list
      @to_buy_list = ToBuyList.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def to_buy_list_params
      params.require(:to_buy_list).permit(:book_title, :author, :cover_photo, :user_id)
    end
end
