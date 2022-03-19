class User < ApplicationRecord
    has_many :transactions


    def balance_total
        total = self.transactions.map do |transaction| transaction.points end
           if total.reduce(:+)
            total.reduce(:+).to_i
           else
               0
           end 
    end 

    def payer_point_balances
        list = {}
        self.transactions.each do |obj|
           if list.has_key?(obj.payer)
               list[obj.payer] += obj.points
           else
               list[obj.payer] = obj.points
           end
        end
        list
    end
    
    def sorted_transactions
        self.transactions.sort{|a,b| a.timestamp <=> b.timestamp}
    end


    # def spend
    #     while spend > 0
    #       self.sorted_transactions.each do |t|
    #         spend -= t.points
    #         self.
    #       end
    #     end
    # end
    
end
