class MatesController < ApplicationController
    def index
        @mates = Mate.all
   end
 
   def show
     @mate = Mate.find(params[:id])
   end
 
   def new
       @mate = Mate.new
   end
 
   def create
       @mate = Mate.new(mate_params)
       if @mate.save
       redirect_to @mate
     else
       render :new
     end
   end
 
  def edit
     @mate = Mate.find(params[:id])
   end
 
 def destroy
     @mate = Mate.find(params[:id])
     @mate.destroy
 
     redirect_to root_path
   end
 
  def update
     @mate = Mate.find(params[:id])
     if @mate.update(mate_params)
       redirect_to @mate
     else
       render :edit
     end
   end
   
   def favorites
       @articles = current_user.favorites
   end
   
   def myarticles
       @articles = current_user.articles
   end
   
     private
     def mate_params
       params.require(:mate).permit(:name, :bio)
     end
end
