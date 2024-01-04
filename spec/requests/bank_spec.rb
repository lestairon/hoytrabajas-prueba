require 'rails_helper'

RSpec.describe 'Bank', type: :request do
  describe 'index' do
    let(:path) { banks_path }
    let!(:banks) { create_list(:bank, 10) }

    it 'shows all created banks' do
      get path
      
      banks.each do |bank|
        expect(response.body).to include(bank.name)
      end
    end
  end

  describe 'create' do
    let(:path) { banks_path }

    context 'with valid data' do
      let(:data) { { bank: { name: 'a' * 50 } } }

      it 'succesfully creates a new Bank' do
        expect { post path, params: data }.to change(Bank, :count).by(1)
      end
    end

    context 'with invalid data' do
      let(:data) { { bank: { name: 'a' * 51 } } }

      it 'does not create a new bank' do
        expect{ post path, params: data }.not_to change(Bank, :count)
      end
    end
  end

  describe 'update' do
    let(:bank) { create(:bank) }
    let(:path) { bank_path(bank) }
    let(:data) { { bank: { name: new_name } } }
    
    context 'with valid data' do
      let(:new_name) { Faker::Name.name }

      it 'succesfully changes the bank name' do
        expect { patch path, params: data }.to change { bank.reload.name }.to new_name
      end
    end

    context 'with invalid data' do
      let(:new_name) { 'a' * 51 }

      it 'does not change the bank name' do
        expect { patch path, params: data }.not_to change { bank.reload.name }
      end
    end
  end

  describe 'delete' do
    let!(:bank) { create(:bank) }
    let(:path) { bank_url(bank) }

    it 'successfully destroys the bank' do
      expect { delete path }.to change(Bank, :count).by(-1)
    end
  end
end
