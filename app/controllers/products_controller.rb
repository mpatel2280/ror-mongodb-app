# app/controllers/products_controller.rb
class ProductsController < ApplicationController
    def index
      @products = Product.all
      render json: @products
    end
  
    def show
      @product = Product.find(params[:id])
      render json: @product
    end
  
    def new
      @product = Product.new
    end
  
    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to @product, notice: 'Product was successfully created.'
      else
        render :new
      end
    end
  
    def edit
      @product = Product.find(params[:id])
    end
  
    def update
      @product = Product.find(params[:id])
      if @product.update(product_params)
        redirect_to @product, notice: 'Product was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to products_url, notice: 'Product was successfully destroyed.'
    end

    # External API call
    def get_products
        url = 'https://dummyjson.com/products'
        response = RestClient.get(url)
        render json: response, status: :ok
    end
  
  
    private
  
    def product_params
      params.require(:product).permit(:title, :description)
    end
  end
  