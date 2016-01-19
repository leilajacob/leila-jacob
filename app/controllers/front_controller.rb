class FrontController < ApplicationController
  def all_art
  	@arts = Art.all
  end

  def by_size
  	@art = Art.where(category_id: params[:cat_id])
  	@category = Category.find(params[:cat_id])
  end
end
