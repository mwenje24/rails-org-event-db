class EventCategoriesController < ApplicationController
    def index
        render json: EventCategory.all
    end

    def show
        event_category = find_event_category
        render json: event_category
    end

    def create
        render json: EventCategory.create(event_category_params), status: :created
    end

    def update
        event_category = find_event_category
        event_category.update(
            category_name: params[:category_name], 
            description: params[:description]
        )
        render json: event_category, status: :accepted
      end

    def destroy
        event_category = find_event_category
        event_category.destroy
        render json: {}, status: :ok
      end

    private

    def find_event_category
        EventCategory.find_by(id: params[:id])
    end

    def event_category_params
        params.permit(:category_name, :description)
    end
end
