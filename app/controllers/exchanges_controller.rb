class ExchangesController < ApplicationController
  before_action :set_exchange, only: [ :show, :edit, :update, :destroy]




  # GET /exchanges
  def index
    @exchanges = Exchange.all
    @trans_count = Exchange.trans_count
    @total_money = Exchange.total_money
    @broke = Exchange.broke
    @maxamount = Exchange.biggest_expense
    @expensive_company = Exchange.expensive_company
  end

  def dashboard
    @exchanges = Exchange.all
    @trans_count = Exchange.trans_count
    @total_money = Exchange.total_money
    @broke = Exchange.broke
  end

  # GET /exchanges/1
  def show
  end

  # GET /exchanges/new
  def new
    @exchange = Exchange.new
  end

  # GET /exchanges/1/edit
  def edit
  end

  # POST /exchanges
  def create
    @exchange = Exchange.new(exchange_params)

    if @exchange.save
      redirect_to @exchange, notice: 'Exchange was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /exchanges/1
  def update
    if @exchange.update(exchange_params)
      redirect_to @exchange, notice: 'Exchange was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /exchanges/1
  def destroy
    @exchange.destroy
    redirect_to exchanges_url, notice: 'Exchange was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exchange
      @exchange = Exchange.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def exchange_params
      params.require(:exchange).permit(:withdrawal, :deposit, :collecter, :amount)
    end
end
