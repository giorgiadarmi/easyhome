class AdsController < ApplicationController


    def index 
        @all = Ad.all
        
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
    end

    def edit
        @ad = Ad.find(params[:id])
    end

    def update  
        Ad.find(params[:id]).update(params[:ad].permit(:owner , :adtype, :title, :notice, :location))
        redirect_to ads_path
    end

    private
    def ad_params
        p=params.require(:ad).permit(:owner , :adtype, :title, :notice, :location)
        {:adtype=>p[:adtype], :title=>p[:title], :notice=>p[:notice], :location=>p[:location]}
    end
end
