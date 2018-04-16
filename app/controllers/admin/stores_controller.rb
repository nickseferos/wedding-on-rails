class Admin::StoresController < ApplicationController
  layout "admin"
  before_filter :set_event, only: [:index, :update, :show, :new, :edit, :create, :destroy]
  before_filter :set_store, only: [:show, :update, :edit, :destroy]
  before_filter :set_set_store, only: [:index]
  before_action :authenticate_admin!

  def index
  end

  def show
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    @store.event_id = @event.id
    @store.save
    redirect_to :back
  end

  def edit
  end

  def update
    @store.update_attributes(store_params)
    redirect_to :back
  end

  def destroy
    @store.destroy
    redirect_to :back
  end

  private

  def store_params
    params.require(:store).permit(:title, :content)
  end

  def set_event
    @event = Event.find params[:event_id] || default_event
  end

  def set_store
    store_id = params[:store_id] || params[:id]
    @store = @event.stores.find store_id
  end

  def set_stores
    @stores = @event.stores.all
  end
end
