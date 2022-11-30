class SessionsController < ApplicationController
    def createAttendee
        user = Attendee.find_by(email: params[:email])
        if user && params[:password] == user.password
            session[:email] = user.email
            session[:user_name] = user.name
            render json: user, status: :accepted
        else
            render json: { error: 'Invalid email or password' }, status: :unprocessable_entity
        end
    end

    def destroyAttendee
        session.delete :email
        session.delete :user_name
        head :no_content
    end

    def createOrganizer
        user = Organizer.find_by(email: params[:email])
        if user && params[:password] == user.password
            session[:email] = user.email
            session[:user_name] = user.name
            render json: user, status: :accepted
        else
            render json: { error: 'Invalid email or password' }, status: :unprocessable_entity
        end
    end

    def destroyOrganizer
        session.delete :email
        session.delete :user_name
        head :no_content
    end
end
