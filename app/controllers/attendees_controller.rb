class AttendeesController < ApplicationController
    def index
        render json: Attendee.all
    end

    def show
        attendee = Attendee.find_by(email: session[:email])
        if attendee
            session[:user] ||= attendee
            render json: attendee
        else
            render json: { error: "Not authorized" }, status: :unauthorized
        end
    end

    def create
        render json: Attendee.create(attendee_params), status: :created
    end

    def update
        attendee = find_attendee
        attendee.update(
            name: params[:name], 
            email: params[:email],
            password: params[:password]
        )
        render json: attendee, status: :accepted
      end

    def destroy
        attendee = find_attendee
        attendee.destroy
        render json: {}, status: :ok
    end

    private

    def find_attendee
        Attendee.find_by(email: params[:email])
    end

    def attendee_params
        params.permit(:name, :email, :password, :password_digest)
    end
end
