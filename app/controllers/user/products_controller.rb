class User::ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    if params[:search].present?
      @products = Product.where("title ILIKE ?", "%#{params[:search]}%")
    else
      @products = Product.all.page(params[:page])
    end
    if params[:sort].present?
      case params[:sort]
      when "title"
        @products = @products.order(title: :asc)
      when "price"
        @products = @products.order(price: :asc)
      when "created_at"
        @products = @products.order(created_at: :asc)
      end
    end
  end

  def export_csv
    @products = Product.all
    respond_to do |format|
      format.csv do
        headers["Content-Disposition"] = 'attachment; filename="products.csv"'
        headers["Content-Type"] ||= "text/csv"

        csv_data = CSV.generate(headers: true) do |csv|
          # Add column headers
          csv << ["title", "Price", "Description", "status"]

          # Add product data
          @products.each do |product|
            csv << [product.title, product.price, product.description, product.status]
          end
        end

        send_data csv_data
      end
    end
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to user_product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to user_product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to user_products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:title, :price, :description, :status)
  end
end
