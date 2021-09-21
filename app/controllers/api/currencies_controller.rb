class Api::CurrenciesController < ApplicationController
  def index
    @currencies = Currency.all.order(code: :asc)

    render json: paginate(@currencies)
  end

  def show
    @currency = Currency.find_by(code: params[:code].upcase)
    render json: {currency: @currency}
  end

  private

  def paginate(scope, default_per_page = 20)
    collection = scope.page(params[:page]).per((params[:per_page] || default_per_page).to_i)

    current = collection.current_page
    total = collection.total_pages
    per_page = collection.limit_value

    {
      pagination: {
        current: current,
        previous: (current > 1 ? (current - 1) : nil),
        next: (current == total ? nil : (current + 1)),
        per_page: per_page,
        pages: total,
        count: collection.total_count
      },
      currencies: collection.map(&:to_json)
    }
  end
end
