module Api
  module V1
    class UsersController < ApplicationController
      def login
        valid = User.find_by(email: params[:email]).valid_password?(params[:password])
        if valid
          @user = User.find_by(email: params[:email])
          @user.api_token = Devise.friendly_token.to_s
          @user.save
          respond_to do |format|
            format.json { render json: @user.api_token, status: :ok }
          end
        else
          respond_to do |format|
            format.json { render json: 'Wrong email or password'.to_json, status: :ok }
          end
        end
      end

      def register
        new_user = User.new(name: params[:name1], email: params[:email], password: params[:password])
        if new_user.save
          render json: { success: true, message: 'User created', data: { user: new_user } }, status: :created
        else
          render json: { success: false, errors: new_user.errors }, status: :unprocessable_entity
        end
      end
    end
  end
end