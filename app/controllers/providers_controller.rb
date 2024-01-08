class ProvidersController < ApplicationController
  include Pagy::Backend

  before_action :set_provider, only: %i[ show edit update destroy ]

  def index
    @pagy, @records = pagy(Provider.all)
  end

  def show; end

  def new
    @provider = Provider.new
    @provider.build_bank_account
  end

  def edit; end

  def create
    @provider = Provider.new(provider_params)

    respond_to do |format|
      if @provider.save
        format.html { redirect_to provider_url(@provider), notice: t('providers.notices.created') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @provider.update(provider_params)
        format.html { redirect_to provider_url(@provider), notice: t('providers.notices.updated') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @provider.destroy

    respond_to do |format|
      format.html { redirect_to providers_url, notice: t('providers.notices.destroyed') }
    end
  end

  private

  def set_provider
    @provider = Provider.find(params[:id])
  end

  def provider_params
    params.require(:provider).permit(:name, :nit, :contact_name, :contact_number,
                                     bank_account_attributes: %i[number bank_id])
  end
end
