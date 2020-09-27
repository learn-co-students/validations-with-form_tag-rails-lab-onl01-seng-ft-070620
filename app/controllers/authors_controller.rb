class AuthorsController < ApplicationController
  def show
      @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
      @author = Author.new(author_params(:name, :email, :phone_number))
      if @author.save
          redirect_to author_path(@author) 
          return
      end
      render 'new'
  end

  def edit
      @author = Author.find(params[:id])
  end

  def update
      @author = Author.find(params[:id])
      if @author.update(author_params)
          redirect_to author_path(@author)
          return
      end
      render 'edit'
  end

  private

  def author_params(*args)
      params.permit(args)
  end
end