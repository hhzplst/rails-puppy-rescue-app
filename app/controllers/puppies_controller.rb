class PuppiesController < ApplicationController
  def index
    @puppies = Puppy.all.order :id
  end

  def new
    @puppy = Puppy.new
  end

  def create
    @puppy = Puppy.new puppy_params
    if @puppy.save
      redirect_to root_url, notice: "Puppy successfully created!"
    else
      render :new
    end
  end

  def show
    @puppy = Puppy.find params[:id]
  end

  def edit
    @puppy = Puppy.find params[:id]
  end

  def update
    @puppy = Puppy.find params[:id]
    if @puppy.update puppy_params
      redirect_to @puppy, notice: "Puppy successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @puppy = Puppy.find params[:id]
    @puppy.destroy
    redirect_to puppies_path, notice: "Puppy successfully deleted!"
  end

  private

  def puppy_params
    params.require(:puppy).permit(:name, :age, :breed, :bio, :img)
  end
end
