require_relative '../../features/support/helpers/touch_actions_helper'

# Fill inputs on the screen with random text
class FillInputs
  include Helpers::TouchActions

  def run
    if all_text_fields.empty?
      Cucumber.logger.info('No textfields found on the screen.')
    else
      all_text_fields.each do |field|
        random_string = FFaker::Lorem.word
        clear_text_field(field)
        type(field, random_string)
        Cucumber.logger.info("Input [#{field.name}]: '#{random_string}'")
      end
    end
    Cucumber.logger.info('Rule execution status: SUCCESS')
  end

  private

  def all_text_fields
    @all_text_fields ||= wait { find_elements(:xpath, '//UIATextField') }
  end
end
