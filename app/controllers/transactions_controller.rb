class TransactionsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        transaction = Transaction.create(transaction_params.merge({timestamp: DateTime.current()}))
        user = User.find_by(id: params[:user_id])
        if transaction
            user.update(balance: user.balance + params[:points])
            render json: transaction, status: :ok 
        else
            render json: {errors: transaction.errors}, status: :unprocessable_entity 
        end
    end
    
    def index
        render json: Transaction.all
    end


    private 

    def transaction_params
        params.permit(:id, :user_id, :payer, :points)
    end
end
