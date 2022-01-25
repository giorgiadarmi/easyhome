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
        if (current_user==Ad.find(params[:id]).user || current_user.is_admin?)
            Ad.find(params[:id]).destroy
        else
            flash[:notice] = "Non puoi eliminare articoli di altri utenti"
        end
        redirect_to ads_path
    end

    def edit
        @ad = Ad.find(params[:id])
    end

    def update  
        if (current_user==Ad.find(params[:id]).user  || current_user.is_admin?)
            Ad.find(params[:id]).update(params[:ad].permit(:owner , :adtype, :title, :notice, :location))
        else
            flash[:notice] = "Non puoi modificare articoli di altri utenti"
        end
        redirect_to ads_path
    end

    private
    def ad_params
        p=params.require(:ad).permit(:owner , :adtype, :title, :notice, :location)
        {:adtype=>p[:adtype], :title=>p[:title], :notice=>p[:notice], :location=>p[:location]}
    end
end
