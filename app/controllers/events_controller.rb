class EventsController < ApplicationController
  before_action :tags_all, only: [:new, :edit]

  def index
    @events = Event.order("created_at DESC").page params[:page]
  end

  def show
    @event = Event.find(params[:id])
    @comments = @event.comments.all
    @event_tags = Tag.where(id: @event.tag_ids)
  end

  def new
    @event = Event.new
    @event.build_attachment
  end

  def edit
    @event = Event.find(params[:id])
    unless @event.attachment
      @event.build_attachment
    end
  end

  def create
    @event = Event.create(event_params)
    @event.tag_ids = params[:tag_ids]

    if @event.save
      redirect_to @event, notice: "Successfully saved"
    else
      render 'new'
    end
  end

  def update
    @event = Event.find(params[:id])
    @event.tag_ids = params[:tag_ids]

    if @event.update(event_params)
      redirect_to @event, notice: "Event was successfully updated"
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_path
  end

  private
  def tags_all
    @tags = Tag.all
  end

  def event_params
    params.require(:event).permit(:title, :address, attachment_attributes: [:data])
  end
end