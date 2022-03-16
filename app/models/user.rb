class User < ApplicationRecord
    has_many :transactions


    def balance_total
        total = self.transactions.map do |transaction| transaction.points end
           if total.reduce(:+)
            total.reduce(:+)
           else
               0
           end 
    end 
    
end
