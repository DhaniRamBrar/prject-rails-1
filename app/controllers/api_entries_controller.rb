class ApiEntriesController < ApplicationController
  def index
    scope = ApiEntry.all
    scope = scope.where("LOWER(api_name) LIKE ?", "%#{params[:search].downcase}%") if params[:search].present?
    scope = scope.where(category_id: params[:api_entry][:category_id]) if params.dig(:api_entry, :category_id).present?
    
    @api_entries = scope.page(params[:page]).per(10)
  end
  def show
    @api_entry = ApiEntry.find(params[:id])
  end
end
