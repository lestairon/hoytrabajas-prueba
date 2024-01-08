require 'rails_helper'

RSpec.describe ProviderPresenter do
  let(:provider) { create(:provider) }
  let(:presenter) { ProviderPresenter.new(provider) }

  describe '#bank_name' do
    context 'when the bank name is present' do
      let(:bank) { create(:bank) }
      let!(:bank_account) { create(:bank_account, provider: provider, bank: bank) }

      it 'returns the bank name' do
        expect(presenter.bank_name).to eq(bank.name)
      end
    end

    context 'when the bank name is not present' do
      it 'returns the not present message' do
        expect(presenter.bank_name).to eq(I18n.t('helpers.views.not_present'))
      end
    end
  end

  describe '#bank_account_number' do
    context 'when the bank account number is present' do
      let!(:bank_account) { create(:bank_account, provider: provider) }

      it 'returns the bank account number' do
        expect(presenter.bank_account_number).to eq(bank_account.number)
      end
    end

    context 'when the bank account number is not present' do
      it 'returns the not present message' do
        expect(presenter.bank_account_number).to eq(I18n.t('helpers.views.not_present'))
      end
    end
  end

  describe 'method_missing' do
    context 'when the provider has the attribute' do
      it 'returns the attribute value' do
        expect(presenter.name).to eq(provider.name)
      end
    end

    context 'when the provider does not have the attribute' do
      let(:provider) { create(:provider, contact_name: nil) }

      it 'returns the not present message' do
        expect(presenter.contact_name).to eq(I18n.t('helpers.views.not_present'))
      end
    end
  end
end
