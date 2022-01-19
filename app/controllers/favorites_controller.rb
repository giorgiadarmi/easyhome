class FavoritesController < ApplicationController
before_action :find_ad
before_action :find_favorite, only: [:destroy]

  def create
        if already_favorited?
            flash[:notice] = "You can't like more than once"
        else
            @ad.favorites.create(user_id: current_user.id)
        end
    redirect_to ad_path(@ad)
  end

  def destroy
    if !(already_favorited?)
      flash[:notice] = "Cannot unlike"
    else
      @favorite.destroy
    end
    redirect_to ad_path(@ad)
  end

  private
  def find_ad
    @ad = Ad.find(params[:ad_id])
  end
  def already_favorited?
    Favorite.where(user_id: current_user.id, ad_id:
    params[:ad_id]).exists?
  end
  def find_favorite
    @favorite = @ad.favorites.find(params[:id])
 end

end
