class OrdersController < ApplicationController
    def index
        @orders = Order.all
    end

    def new
        @order = Order.new
        @book = Book.find(params[:id])
    end

    def confirm
        @order = Order.new(order_params)
        @book = Book.find(params[:id])
    end

    def complete
    end

    def create
        @order = Order.new(order_params)

        if params[:back].present?
            render :new
        else
            if @order.save
                redirect_to complete_orders_path, notice: '購入が完了しました。'
            else
                render :new
            end
        end
    end

    private

    def order_params
        params.require(:order).permit(:title, :author, :published_on, :showimg, :price)
    end
end
