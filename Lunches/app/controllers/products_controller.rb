class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :check_admin

  def new; end
  def show; end
  def edit; end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render action: 'new'
    end
  end

  def index
    @products = Product.all
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render action: 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :price, :description, :position, :in_menu,
                                    :path_to_image, :path_to_image_cache,
                                    :remote_path_to_image_url, :remove_path_to_image)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
