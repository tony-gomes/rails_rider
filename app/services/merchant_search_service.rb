class MerchantSearchService
  def package(params)
    if params[:name]
      name(params)
    elsif params[:created_at] || params[:updated_at]
      binding.pry
      date(params)
    else
      multi(params)
    end
  end

  private

  def multi(params)
    date = params[:created_at] if params[:created_at]
    Merchant.where("name = ? AND created_at = ?", params[:name], date)

    date = params[:updated_at] if params[:updated_at]
    Merchant.where("name = ? AND updated_at = ?", params[:name], date)
  end

  def name(params)
    string = params[:name]
    Merchant.where("lower(name) like ?", "%#{string}%").first
  end

  def date(params)
    start_date = end_date = params[:created_at] unless params[:updated_at]
    start_date = end_date = params[:updated_at] unless params[:created_at]
    date = [params[:created_at], params[:updated_at]] if params[:created_at] && params[:updated_at]

    if date.kind_of?(Array)
      search_params1 = "created_at >= ? AND created_at >= ?"
      search_params2 = "AND updated_at <= AND updated_at <= ?"

      Merchant.where(search_params1.concat(search_params2), date[0], date[1]).first
    else
      search_params = "created_at >= ? AND created_at >= ?" if params[:created_at]
      search_params = "updated_at >= ? AND updated_at >= ?" if params[:updated_at]
      Merchant.where(search_params, start_date, end_date).first
    end
  end
end
