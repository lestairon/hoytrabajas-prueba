require 'rails_helper'

RSpec.describe 'Providers', type: :request do
  describe 'create' do
    let(:path) { providers_path }

    context 'with valid data' do
      let(:bank) { create(:bank) }
      let(:data) do
        {
          provider: {
            name: 'Provider Inc', nit: '123456', contact_name: 'John Doe', contact_number: '1234567890',
            bank_account_attributes: { number: '100', bank_id: bank.id }
          }
        }
      end

      it 'succesfully creates a new Provider' do
        expect { post path, params: data }.to change(Provider, :count).by(1)
      end
    end

    context 'with invalid data' do
      let(:data) { { provider: { name: '' } } }

      it 'does not create a new provider' do
        expect { post path, params: data }.not_to change(Provider, :count)
      end
    end
  end

  describe 'index' do
    let(:path) { providers_path }
    let!(:providers) { (0...10).map { |index| create(:provider, :with_bank_account, name: "Provider #{index}") } }

    it 'shows all created providers' do
      get path

      providers.each do |provider|
        expect(response.body).to include(provider.name)
      end
    end

    it 'renders action buttons for providers' do
      get path

      expect(response.body).to include('Show').and(include('Edit')).and(include('Destroy'))
    end

    context 'when a provider does not have all info' do
      let!(:providers) { create(:provider, :with_bank_account, contact_name: nil) }

      it 'renders no information instead of the blank string' do
        get path

        expect(response.body).to include(I18n.t('helpers.views.not_present'))
      end
    end
  end

  describe 'update' do
    let(:provider) { create(:provider) }
    let(:path) { provider_path(provider) }
    let(:data) { { provider: { name: new_name } } }

    context 'with valid data' do
      let(:new_name) { 'New Provider Name' }

      it 'succesfully changes the provider name' do
        expect { patch path, params: data }.to change { provider.reload.name }.to new_name
      end
    end

    context 'with invalid data' do
      let(:new_name) { '' }

      it 'does not change the provider name' do
        expect { patch path, params: data }.not_to(change { provider.reload.name })
      end
    end
  end

  describe 'delete' do
    let!(:provider) { create(:provider) }
    let(:path) { provider_path(provider) }

    it 'successfully destroys the provider' do
      expect { delete path }.to change(Provider, :count).by(-1)
    end
  end
end
