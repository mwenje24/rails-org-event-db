class OrganizersController < ApplicationController
    def index
        render json: Organizer.all
    end

    def show
        organizer = Organizer.find_by(email: session[:email])
        if organizer
            session[:user] ||= organizer
            render json: organizer
        else
            render json: { error: "Not authorized" }, status: :unauthorized
        end
    end
    

    def create
        render json: Organizer.create(organizer_params), status: :created
    end

    def update
        organizer = find_organizer
        organizer.update(
            name: params[:name], 
            email: params[:email],
            password: params[:password]
        )
        render json: organizer, status: :accepted
    end

    def destroy
        organizer = find_organizer
        organizer.destroy
        render json: {}, status: :ok
    end

    private

    def find_organizer
        Organizer.find_by(email: params[:email])
    end

    def organizer_params
        params.permit(:name, :email, :password, :password_digest)
    end

    def record_not_found
        render json: { error: "record not found" }, status: :not_found
      end
end
