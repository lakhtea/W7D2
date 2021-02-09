class BandsController < ApplicationController
    def index
        @bands = Band.all
        render :index
    end

    def show
        @band = Band.find(params[:id])
        render :show
    end

    def create
        @band = Band.create(band_params)
        if @band.save
            debugger
            redirect_to bands_url
        else
            flash.now[:errors] = @band.errors.full_messages
            render :new
        end
    end

    def new
        @band = Band.new
        render :new
    end

    def edit
        @band = Band.find(params[:id])
        if @band
            render :edit
        else
            flash.now[:errors] = @band.errors.full_messages
            redirect_to new_band_url
        end
    end

    def update
        @band = Band.find(params[:id])
        if @band.update_attributes(band_params)
            redirect_to band_url(@band)
        else
            render :edit
        end
    end

    def destroy
        @band = Band.find(params[:id])
        @band.destroy
        redirect_to bands_url
    end

    private 

    def band_params
        params.require(:band).permit(:name)
    end
end