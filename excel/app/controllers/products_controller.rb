class ProductsController < ApplicationController
	def index
  		@products = if params[:term] 
  			Product.where('name = ?',"#{params[:term]}",)
  			
  		else 
  			Product.all
  			
  		end
  		respond_to do |format|
   		format.html
  		format.csv { send_data @products.to_csv }
  		format.xls
  	
  	end
	end

	def products_params
  	params.require(:task).permit(:name, :complete, :due_date, :term)
  	respond_to do |format|
   	format.html
  	format.csv { send_data @products.to_csv }
  		format.xls
end
end
end