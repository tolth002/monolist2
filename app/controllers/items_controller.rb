class ItemsController < ApplicationController
  before_action :logged_in_user , except: [:show]
  before_action :set_item, only: [:show]

  def new
    if params[:item_code]
      response = RakutenWebService::Ichiba::Item.search(
        keyword: params[:item_code],
        imageFlag: 1,
      )
      @items = response.first(20)
    end
  end

  def show
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
end
