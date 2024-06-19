class OrdersController < ApplicationController

    def new
        @order = Order.new
        @book = Book.find(params[:format])

        if @book.sold_out?
            redirect_to products_path
        end
    end

    def confirm
        @order = Order.new(order_params)
        @book = Book.find(order_params[:book_id])

        if @book.sold_out?
            redirect_to products_path
        end
    end

    
    def create
        @order = Order.new(order_params) 
        if @order.save
            @book = Book.find(order_params[:book_id])
            @book.sold_out!
            redirect_to complete_orders_path
        else
            render :"confirm"
        end
    end
    
    def complete
        CompleteMailer.complete_mail(current_user).deliver
    end

    private

    def order_params
        params.require(:order).permit(:count, :address, :book_id, :status)
    end
end
