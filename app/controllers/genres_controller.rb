class GenresController < ApplicationController
    def show
        @genres = Genre.all
        @genre = Genre.find(params[:id])
        @products = Product.where(genre_id: @genre)
        # binding.pry
    end
end