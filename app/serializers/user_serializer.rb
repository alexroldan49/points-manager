class UserSerializer < ActiveModel::Serializer
  attributes :name, :balance_total, :id, :balance, :payer_point_balances

  has_many :transactions
end
