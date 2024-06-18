class CompletesController < ApplicationController
# POST /completes
# POST /completes.json
    def create
        @complete = Complete.new(complete_params)
  
    respond_to do |format|
      if @complete.save
        CompleteMailer.complete_mail(@complete).deliver
  
        format.html { redirect_to @complete, notice: 'To do task was successfully created.' }
        format.json { render :show, status: :created, location: @complete }
      else
        format.html { render :new }
        format.json { render json: @complete.errors, status: :unprocessable_entity }
      end
    end

    private
    def complete_params
      params.require(:complete).permit(:title, :description, :email)
    end
end