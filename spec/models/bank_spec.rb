require 'rails_helper'

RSpec.describe Bank do
  describe 'validations' do
    subject { described_class.new(name: name) }

    context 'with valid name' do
      let(:name) { Faker::Name.name }

      it { is_expected.to be_valid }
    end

    context 'with an invalid name' do
      let(:name) { 'a' * 51 }

      it { is_expected.not_to be_valid }
    end
  end
end
