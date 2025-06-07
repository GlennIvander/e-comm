class Admin::StocksController < AdminController
  before_action :set_product
  before_action :set_admin_stock, only: %i[ show edit update destroy ]

  # GET /admin/stocks or /admin/stocks.json
  def index
    @admin_stocks = Stock.where(product_id: params[:product_id])
  end

  # GET /admin/stocks/1 or /admin/stocks/1.json
  def show
  end

  # GET /admin/stocks/new
  def new
    @admin_stock = Stock.new
  end

  # GET /admin/stocks/1/edit
  def edit
  end

  # POST /admin/stocks or /admin/stocks.json
  def create
    @admin_stock = @product.stocks.new(admin_stock_params)

    respond_to do |format|
      if @admin_stock.save
        format.html { redirect_to admin_product_stocks_path(@product, @admin_stock), notice: "Stock #{@admin_stock.size} was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/stocks/1 or /admin/stocks/1.json
  def update
    respond_to do |format|
      if @admin_stock.update(admin_stock_params)
        format.html { redirect_to admin_product_stocks_path(@admin_stock.product, @admin_stock), notice: "Stock was successfully updated." }

      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/stocks/1 or /admin/stocks/1.json
  def destroy
    @admin_stock.destroy!

    respond_to do |format|
      format.html { redirect_to admin_product_stocks_path, status: :see_other, notice: "Stock #{@admin_stock.size} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_product
    @product = Product.find_by(params[:product_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_stock
    @admin_stock = Stock.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def admin_stock_params
    params.require(:stock).permit(:amount, :size, :product_id)
  end
end
