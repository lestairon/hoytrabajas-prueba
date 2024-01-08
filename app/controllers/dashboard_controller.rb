class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @providers = Provider.count
    @banks = Bank.count
  end
end
