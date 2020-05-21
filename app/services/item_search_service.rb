class ItemSearchService
  def package(params)
    name(params) if params[:name]
  end

  private

  def name(params)
    string = params[:name]
    Item.where("lower(name) like ?", "%#{string}%").first
  end
end
