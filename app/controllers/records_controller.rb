class RecordsController < ApplicationController
  def index
    # get all rows in Records
    @records = Record.all
    $redis.set("mykey", "hello world")
    @info = $redis.get("mykey")
  end

  def create
    @record = Record.new(record_params)

    if @record.save
      render json: @record
    else 
      render json: @record.errors, status: :unprocessable_entity
    end
  end

  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
      render json: @record
    else
      render json: @record.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    head :no_content
  end

  private
    def record_params
      params.require(:record).permit(:title, :username, :password)
    end
end
