class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
    @name = params[:name]
    @email = params[:email]
    @phone_number = params[:phone_number]
  end

  def create
    @author = Author.new(author_params)
    if @author.valid?
      @author.save
      redirect_to author_path(@author)
    else
      @name = params[:name]
      @email = params[:email]
      @phone_number = params[:phone_number]
      render :new
    end
  end

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end
