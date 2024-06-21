class LineItemsController < ApplicationController
    def create
        cart = current_cart
        book  = Book.find(params[:book_id])
        @line_item = cart.add_product(book.id)

        
      
        respond_to do |format|
          if @line_item.save
            format.html { redirect_to products_path, notice: '商品をカートに追加しました。' }
          else
            format.html { redirect_to products_index_url, notice: 'Unprocessable entity.' }
          end
        end
    end
end