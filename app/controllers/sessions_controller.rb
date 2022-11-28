class SessionsController < ApplicationController
    def createAttendee
        user = Attendee.find_by(email: params[:email])
        session[:email] = user.email
        session[:user_name] = user.name
        render json: user
    end

    def destroyAttendee
        session.delete :email
        session.delete :user_name
        head :no_content
    end

    def createOrganizer
        user = Organizer.find_by(email: params[:email])
        session[:email] = user.email
        session[:user_name] = user.name
        render json: user
    end

    def destroyOrganizer
        session.delete :email
        session.delete :user_name
        head :no_content
    end
end
