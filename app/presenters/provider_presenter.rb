class ProviderPresenter
  attr_reader :provider

  def initialize(provider)
    @provider = provider
  end

  def bank_name
    bank&.name.presence || not_present
  end

  def bank_account_number
    bank_account&.number.presence || not_present
  end

  def not_present
    I18n.t('helpers.views.not_present')
  end

  private

  def bank
    @bank ||= Bank.joins(bank_accounts: :provider).find_by(provider: { id: provider.id })
  end

  def bank_account
    @bank_account ||= provider.bank_account
  end

  def method_missing(method_name, *args, &block)
    if @provider.respond_to?(method_name)
      @provider.send(method_name).presence || (args[0] || not_present)
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    @provider.respond_to?(method_name) || super
  end
end
