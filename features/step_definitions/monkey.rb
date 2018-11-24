all_rules = Dir['rules/*.rb']
all_rules.each { |file| require_relative "../../#{file}" }

def extract_rule_class_name(rule)
  rule.sub(%r{rules/(.+).rb}, '\1').split('_').collect!(&:capitalize).join
end

Given(/^I run monkey test for (.+) minutes*$/) do |mins|
  executions = 0
  Cucumber.logger = Logger.new("monkey.#{Time.now.to_i}.log")
  start_time = Time.now

  while Time.now < (start_time + mins.to_f.minutes)
    page_title = wait { find_element(:id, 'screen_title') }.value
    Cucumber.logger.info("Page title: #{page_title}")
    rule_to_execute = extract_rule_class_name(all_rules.sample)
    Cucumber.logger.info("Executing rule: #{rule_to_execute}")
    Object.const_get(rule_to_execute).new.run
    executions += 1
  end
  puts "Executed #{executions} rules."
end
