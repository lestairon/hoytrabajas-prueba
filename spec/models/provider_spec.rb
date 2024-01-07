require 'rails_helper'

RSpec.describe Provider do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:contact_number).is_at_most(10) }
  end

  describe 'associations' do
    it { is_expected.to have_one(:bank_account) }
  end

  describe 'nested attributes' do
    it { is_expected.to accept_nested_attributes_for(:bank_account) }
  end
end
