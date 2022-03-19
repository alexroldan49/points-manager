class UserSerializer < ActiveModel::Serializer
  attributes :name, :balance_total, :id, :balance, :transactions_list

  has_many :transactions
end
