Given /^I select the basic elements tab$/ do
  @main_window.get(:id => "main_tabs").select("basic") if @main_window.get(:id => "main_tabs").selected.name != "basic"
end

Then /^the first button exists$/ do
  @main_window.get(:id => "enabled_button").should exist
end

Then /^a non existent element does not exist$/ do
  @main_window.get(:id => "i dont exist").should_not exist
end

Then /^the enabled button is enabled$/ do
  @main_window.get(:id => "enabled_button").should be_enabled
end

Then /^the disabled button is disabled$/ do
 @main_window.get(:id => "disabled_button").should_not be_enabled
end

Then /^bewildr complains that the non existent element does not exist$/ do
  lambda {@main_window.get(:id => "I dont exist").enabled?}.should raise_error(Bewildr::ElementDoesntExist)
end

When /^I get the enabled button by specifying more than one condition$/ do
  @button = @main_window.get(:id => "enabled_button", :type => :button)
end

Then /^I have a reference to the button$/ do
  @button.should exist
end

When /^I wait for existence of an element$/ do
  @main_window.get(:id => "wait_for_existence_button").click
  @suddenly_exists_button = @main_window.wait_for(:name => "suddenly exists")
end

Then /^the element that I waited for exists$/ do
  @suddenly_exists_button.should exist
end

When /^I click the enabled button$/ do
  @main_window.get(:id => "enabled_button").click
end

Then /^the result message says clicked!$/ do
  @main_window.get(:id => "enabled_button_message").text.should match("clicked!")
end

Then /^the basic elements tab contains the enabled button$/ do
  @main_window.get(:id => "tab_basic").contains?(:id => "enabled_button").should be_true
end

Then /^the click for existence test button name is 'click for existence test'$/ do
  @main_window.get(:id => "wait_for_existence_button").name.should match("click for existence test")
end

Then /^the automation id of the enabled button is enabled_button$/ do
  @main_window.get(:id => "enabled_button").automation_id.should match("enabled_button")
end

When /^I double click the double click label$/ do
  @main_window.get(:id => "double_click_me").double_click
end

Then /^the double click result message says double clicked!$/ do
  @main_window.get(:id => "double_click_result").text.should match("double clicked!")
end

Then /^the command line arguments I passed are displayed$/ do
  @main_window.get(:id => "command_line_args").text.include?("arg1 arg2 arg3").should be_true
end

Then /^the enabled button is visible$/ do
  @main_window.get(:id => "enabled_button").should be_visible
end

Then /^the height of the enabled button is as expected$/ do
  @main_window.get(:id => "enabled_button").height.should == 39
end

Then /^the width of the enabled button is as expected$/ do
  @main_window.get(:id => "enabled_button").width.should == 126
end

When /^I look for all elements with automation id of flibble$/ do
  @flibbles = @main_window.get(:id => "flibble", :how_many => :all)
  #p @flibbles
end

Then /^an empty array is returned$/ do
  @flibbles.should be_empty
end

When /^I look for all elements with automation id of toggle_button$/ do
  @toggles = @main_window.get(:id => "toggle_button", :how_many => :all)
  #p @toggles
end

Then /^an array containing one element returned$/ do
  @toggles.should_not be_empty
  @toggles.size.should == 1
end

When /^I look for all button elements$/ do
  @buttons = @main_window.get(:type => :button, :how_many => :all)
  #p @buttons
end

Then /^an array containing a number of elements is returned$/ do
  @buttons.should_not be_empty
  @buttons.size.should > 1
end

When /^I get the enabled textfield's next sibling$/ do
  @enabled_next_sibling = @main_window.get(:id => "enabled_text_field").next_sibling
end

Then /^I have the disabled textfield$/ do
  @enabled_next_sibling.automation_id.should == "disabled_text_field"
end

When /^I get the password textfield's next sibling$/ do
  @password_next_sibling = @main_window.get(:id => "password_field").next_sibling
end

When /^I get the disabled textfield's previous sibling$/ do
  @disabled_previous_sibling = @main_window.get(:id => "disabled_text_field").previous_sibling
end

Then /^I have the enabled textfield$/ do
  @disabled_previous_sibling.automation_id.should == "enabled_text_field"
end

When /^I get the enabled textfield's previous sibling$/ do
  @enabled_previous_sibling = @main_window.get(:id => "enabled_text_field").previous_sibling
end

Then /^the password field does not have a next sibling$/ do
  @password_next_sibling.should be_nil
end

Then /^the enabled textfield does not have a previous sibling$/ do
  @enabled_previous_sibling.should be_nil
end