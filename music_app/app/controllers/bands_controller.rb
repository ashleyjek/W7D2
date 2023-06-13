class BandsController < ApplicationController 
    before_action :set_band, only: [:show, :edit, :update, :destroy]
    
    def set_band
        @band = Band.find(params[:id])
    end

    def index
        bands = Band.all
        render json: bands 
    end

    def show
        render json: @band
    end

    def create
        band = Band.new(band_params)
        if band.save
            redirect_to bands_url(params[:id])
        else
            redirect_to new_band_url
        end
    end

    def band_params
        params.require(:band).permit(:name)
    end

end