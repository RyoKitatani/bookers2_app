class SearchesController < ApplicationController  

  def search
    if params[:id].present?
      @books = Book.where('name LIKE ?', "#{params[:title]}")
    else
      @books = Book.none
    end
  end
  
end


