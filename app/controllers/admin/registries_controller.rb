class Admin::RegistriesController < ApplicationController
  layout "admin"
  before_filter :set_event, only: [:index, :update, :show, :new, :edit, :create, :destroy]
  before_filter :set_registry, only: [:show, :update, :edit, :destroy]
  before_filter :set_set_registry, only: [:index]
  before_action :authenticate_admin!

  def index
  end

  def show
  end

  def new
    @registry = Registry.new
  end

  def create
    @registry = Registry.new(registry_params)
    @registry.event_id = @event.id
    @registry.save!
    redirect_to :back
  end

  def edit
  end

  def update
    @registry.update_attributes(registry_params)
    redirect_to :back
  end

  def destroy
    @registry.destroy
    redirect_to :back
  end

  private

  def registry_params
    params.require(:registry).permit(:store, :logo, :link)
  end

  def set_event
    @event = Event.find params[:event_id] || default_event
  end

  def set_registry
    registry_id = params[:registry_id] || params[:id]
    @registry = @event.registries.find registry_id
  end

  def set_registries
    @registries = @event.registries.all
  end
end
