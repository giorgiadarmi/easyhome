class AdsController < ApplicationController


    def index 
        @all = Ad.all
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
end
