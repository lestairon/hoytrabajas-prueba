require 'rails_helper'

RSpec.describe 'Providers', type: :request do
  describe 'create' do
    let(:path) { providers_path }

    context 'with valid data' do
      let(:data) do
        {
          provider: {
            name: 'Provider Inc', nit: '123456', contact_name: 'John Doe', contact_number: '1234567890',
            bank_account_attributes: { name: 'Bank 1', number: '100' }
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
end
