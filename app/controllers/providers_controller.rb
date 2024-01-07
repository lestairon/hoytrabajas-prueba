class ProvidersController < ApplicationController
  before_action :set_provider, only: %i[ show ]

  def show
  end

  def new
    @provider = Provider.new
    @provider.build_bank_account
  end

  def create
    @provider = Provider.new(provider_params)

    respond_to do |format|
      if @provider.save
        format.html { redirect_to provider_url(@provider), notice: "Provider was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_provider
    @provider = Provider.find(params[:id])
  end

  def provider_params
    params.require(:provider).permit(:name, :nit, :contact_name, :contact_number, bank_accounts_attributes: [:name, :number])
  end
end
