class BankAccount < ApplicationRecord
  validates :number, length: { maximum: 15 }

  belongs_to :bank
  belongs_to :provider
end
