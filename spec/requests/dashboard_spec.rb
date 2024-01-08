require 'rails_helper'

RSpec.describe 'Dashboard', type: :request do
  describe 'index' do
    let(:user) { create(:user) }

    before { sign_in user }

    context 'when there are records present' do
      let(:bank_count) { rand(30) }
      let!(:banks) { create_list(:bank, bank_count) }
      let(:provider_count) { rand(30) }
      let!(:providers) { create_list(:provider, provider_count) }

      it 'displays the number of banks and providers' do
        get dashboard_path

        expect(response.body).to include(bank_count.to_s)
        expect(response.body).to include(provider_count.to_s)
      end
    end
  end
end
