class AdsController < ApplicationController


    def index 
        @all = Ad.all
        @favorites = current_user.favorites
    end

    def show
        id= params[:id]
        if Ad.exists?(id)
            @ad = Ad.find(id)
        else 
            render html: 'Ad does not exists.'
        end
    end

    def new
        
    end

    def create 
       p=params.require(:ad).permit(:adtype, :title, :notice, :location)
       Ad.create(p)
       redirect_to ads_path
    end

    def destroy
        Ad.find(params[:id]).destroy
        redirect_to ads_path
    end

    def edit
        @ad = Ad.find(params[:id])
    end

    def update
        Ad.find(params[:id]).update(params[:ad].permit(:adtype, :title, :notice, :location)) 
        redirect_to ads_path
    end
    
    def favorite
    	@ad = Ad.find(params[:id])
		type = params[:type]
		if type == "favorite"
		  current_user.favorites << @ad
		  redirect_to ads_path, notice: "You favorited #{@ad.title}"

		elsif type == "unfavorite"
		  current_user.favorites.delete(@ad)
		  redirect_to ads_path, notice: "Unfavorited #{@ad.title}"

		else
		  # Type missing, nothing happens
		  redirect_to ads_path, notice: 'Nothing happened.'
		end
	end
end
