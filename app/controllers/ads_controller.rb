class AdsController < ApplicationController


    def index 
        @all = Ad.all
        @favorites = current_user.favorites
        @ads = Ad.includes(:user)
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
        @ad = Ad.new
    end

    def create 
        @ad = Ad.new(ad_params)
        @ad.user_id = current_user.id
        @ad.owner = current_user.name
        if @ad.save 
            redirect_to ads_path
        else
            render 'new'
        end
    end

    def destroy
        Ad.find(params[:id]).destroy
        redirect_to ads_path
    end

    def edit
        @ad = Ad.find(params[:id])
    end

    def update
        Ad.find(params[:id]).update(params[:ad].permit(:owner , :adtype, :title, :notice, :location)) 
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

    private
    def ad_params
        p=params.require(:ad).permit(:owner , :adtype, :title, :notice, :location)
        {:adtype=>p[:adtype], :title=>p[:title], :notice=>p[:notice], :location=>p[:location]}
    end
end
