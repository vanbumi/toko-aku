class StoreController < ApplicationController

  def index 
  	@products = Product.order(:name)
  	# @products = Product.all
  end

end

