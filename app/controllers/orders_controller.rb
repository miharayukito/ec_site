class OrdersController < ApplicationController

    def new
        @order = Order.new
        @book = Book.find(params[:format])
    end

    def confirm
        @order = Order.new(order_params)
        @book = Book.find(order_params[:book_id])
    end

    
    def create
        @order = Order.new(order_params) 
        if @order.save
            redirect_to complete_orders_path, notice: '登録が完了しました。'
        else
            render :"confirm"
        end
    end
                
    def complete
    end

    private

    def order_params
        params.require(:order).permit(:count, :address, :book_id)
    end
end
