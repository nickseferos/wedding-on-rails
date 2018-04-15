class Admin::PartiesController < ApplicationController
  layout "admin"
  before_filter :set_event, only: [:index, :update, :show, :new, :edit, :create, :destroy]
  before_filter :set_party, only: [:show, :update, :edit, :destroy]
  before_filter :set_set_party, only: [:index]
  before_action :authenticate_admin!

  def index
  end

  def show
  end

  def new
    @party = Party.new
  end

  def create
    @party = Party.new(party_params)
    @party.event_id = @event.id
    @party.save!
    redirect_to :back
  end

  def edit
  end

  def update
    @party.update_attributes(party_params)
    redirect_to :back
  end

  def destroy
    @party.destroy
    redirect_to :back
  end

  private

  def party_params
    params.require(:party).permit(:name, :position, :image, :order, :bio)
  end

  def set_event
    @event = Event.find params[:event_id] || default_event
  end

  def set_party
    party_id = params[:party_id] || params[:id]
    @party = @event.parties.find party_id
  end

  def set_parties
    @partys = @event.parties.all
  end
end
