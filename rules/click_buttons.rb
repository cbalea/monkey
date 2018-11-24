# Click random buttons on the screen
class ClickButtons
  def run
    if all_buttons.empty?
      Cucumber.logger.info('No buttons found on the screen.')
    else
      button_to_click = all_buttons.sample
      button_to_click.click
      Cucumber.logger.info("Clicked button: #{button_to_click.name}")
    end
    Cucumber.logger.info('Rule execution status: SUCCESS')
  end

  private

  def all_buttons
    @all_buttons ||= wait do
      find_elements(:xpath, '//UIAButton[not(@name="shift") and not(@name="Next keyboard") '\
              'and not(@name="dictation") and not(@name="Next:")]')
    end
  end
end
