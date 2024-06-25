class ProductsController < ApplicationController
    def index
        @books = Book.all
    end

    def show
        @book = Book.find(params[:id])
    end

    private
    def product_params
        params.require(:product).permit(:photo)
    end
end
