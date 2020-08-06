class SongsController < ApplicationController

    def edit
        @song = Song.find_by_id(params[:id])
    end 

    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end
    

end
