class EventsController < ApplicationController

    def index
        render json: Event.all
    end

    def show
        event = find_event
        render json: event
    end

    def create
        Event.create(event_params)
        render json: Event.all, status: :created
    end

    def update
        event = find_event
        event.update(
            title: params[:title], 
            category_id: params[:category_id], 
            location: params[:location], 
            date: params[:date], 
            time: params[:time], 
            owner_id: params[:owner_id], 
            description: params[:description], 
            fee: params[:fee], 
            image: params[:image]
        )
        render json: event, status: :accepted
      end

    def destroy
        event = find_event
        event.destroy
        render json: Event.all, status: :ok
      end

    private

    def find_event
        Event.find_by(id: params[:id])
    end

    def event_params
        params.permit(:title, :category_id, :location, :date, :time, :owner_id, :description, :fee, :image)
    end

end
