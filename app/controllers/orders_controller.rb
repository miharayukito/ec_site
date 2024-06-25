class OrdersController < ApplicationController

    def new
        @order = Order.new
        #@book = Book.find(params[:format])
        @books = @current_cart.books

        # @books.each do |book|
        #     if book.sold_out?
        #         redirect_to products_path
        #     end
        # end
    end

    def confirm
        counts = order_params[:count]
        @order = Order.new(order_params)
        @books = Book.where(order_params[:book_id])
        @line_items = @current_cart.line_items
        counts.each_with_index do |count, index|
            book_id = order_params[:book_ids][index]
            line_item = @line_items.find_by(book_id:book_id)
            if line_item.present?
                line_item.update(quantity: count)
            end
        end
    end

    
    def create
        count = params[:order][:count].to_i
        @order = Order.new(address: order_params[:address], count: count)
        @books = Book.where(order_params[:book_ids])
        @line_items = @current_cart.line_items
        if @order.save
            OrderDetail.create_items(@order, @line_items)
            @line_items.each do |item|
                item.book.sold_out!
            end
             redirect_to complete_order_path(@order)
        else
            redirect_to new_order_path, alert: '注文の登録ができませんでした'  
        end
    end
    
    def complete
        @Order = Order.find(params[:id])
        CompleteMailer.complete_mail(current_user).deliver
    end

    private

    def order_params
        params.require(:order).permit(:address, :status, count: [] ,  book_ids: [])
    end
end
