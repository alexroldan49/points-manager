class TransactionsController < ApplicationController


    def create
        transaction = Transaction.create(transaction_params)
        if transaction
            render json: transaction, status: :ok 
        else
            render json: {errors: transaction.errors}, status: :unprocessable_entity 
        end
    end
    


    private 

    def transaction_params
        params.permit(:user_id, :payer, :points, :timestamp)
    end
    
end
