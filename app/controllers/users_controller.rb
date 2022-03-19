class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        render json: User.all 
    end 

    def update
        user = User.find_by(id: params[:id])
        
        if user
            if user.balance > params[:balance]
                user.update(balance: user.balance - params[:balance])
                count = params[:balance]
                trans = []
                user.transactions.sort{|a,b| a.timestamp <=> b.timestamp}.each do |t|
                    if count >= t.points
                        trans.push({payer: t.payer, points: "-"+t.points.to_s})
                        count -= t.points
                        t.destroy
                    elsif count < t.points && count > 0
                        new_points = t.points - count
                        trans.push({payer: t.payer, points: "-"+count.to_s})
                        t.update(points: new_points)
                        count -= count
                    elsif count === 0
                        puts "nothing"
                    end
                end
                render json: trans, status: :ok
            else
                render json: {errors: "Insufficient Points"}, status: :unprocessable_entity
            end
            
        else
            render json: {errors: "Not authorized"}, status: :unauthorized
        end
    end

    def show
        user = User.find_by(id: params[:id])
        if user
            render json: user, status: :ok
        else
            render json: {errors: "Not authorized"}, status: :unauthorized
        end
    end

    def payer_balances
        user = User.find_by(id: params[:id])
        if user
            render json: user.payer_point_balances, status: :ok
        else
            render json: {errors: "Not authorized"}, status: :unauthorized
        end
    end

    def create
         user = User.new(user_params.merge({balance: 0}))
         if user.save
             render json: user, status: :created
         else
             render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
         end
    end
    
    private

    def user_balance_params
        params.permit(:id, :balance_total)
    end

    def user_params
        params.permit(:name, :id, :balance)
    end
    
end
