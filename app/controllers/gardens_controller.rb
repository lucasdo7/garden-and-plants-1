class GardensController < ApplicationController

  def index
    @gardens = Garden.all
  end

  def show
    @garden = Garden.find(params[:id])
  end

  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new(garden_params)

    respond_to do |format|
      if @garden.save
        format.html { redirect_to garden_url(@garden), notice: "Garden was successfully created." }
        format.json { render :show, status: :created, location: @garden }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @garden.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @garden = Garden.find(params[:id])
  end

  def update
    @garden = Garden.find(params[:id])

    respond_to do |format|
      if @garden.update(garden_params)
        format.html { redirect_to garden_url(@garden), notice: "Garden was successfully updated." }
        format.json { render :show, status: :ok, location: @garden }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @garden.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @garden = Garden.find(params[:id])
    @garden.destroy

    respond_to do |format|
      format.html { redirect_to gardens_url, notice: "Garden was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def garden_params
    params.require(:garden).permit(:name, :banner_url)
  end
end
