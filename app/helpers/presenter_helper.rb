module PresenterHelper
  def present(object, options = {})
    klass = options.delete(:klass) || "#{object.class}Presenter".constantize
    presenter = klass.new(object, **options)
    yield presenter if block_given?
  end
end
