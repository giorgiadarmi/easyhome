class MatesController < ApplicationController
    def index
        @mates = Mate.all
   end
 
   def show
		id = params[:id]
		@user = Mate.find(id)
	end
	
	def new
		#default rendering
	end
	
	def create
		@user = Mate.create!(params[:mate].permit(:name))
		flash[:notice] = "#{@user.name} was successfully created."
		redirect_to mates_path
	end
	
	def edit
		id = params[:id]
		@user = Mate.find(id)
	end
	
	def update
		id = params[:id]
		@user = Mate.find(id)
		@user.update_attributes!(params[:user].permit(:name))
		flash[:notice] = "#{@user.name} was successfully updated."
		redirect_to mates_path(@user)
	end
	
	def destroy
		id = params[:id]
		@user = Mate.find(id)
		@user.destroy
		flash[:notice] = "#{@user.name} has been deleted."
		redirect_to mates_path
	end
end

