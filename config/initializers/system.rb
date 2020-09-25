require_relative '../../lib/core'

Dry::Rails.container do
  auto_register!('app/models') do |config|
    config.instance do |component|
      component.loader.constant
    end
  end

  auto_register!('lib')
  auto_register!('app/operations')
end
