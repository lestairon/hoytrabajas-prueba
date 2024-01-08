class Provider < ApplicationRecord
  validates :name, presence: true
  validates :contact_number, length: { maximum: 10 }

  has_one :bank_account, dependent: :destroy

  accepts_nested_attributes_for :bank_account
end
