Given(/^any user is on the expedia homapage$/) do
  visit ExpediaHomePage
end

And(/^user clicks on oneway$/) do
  on(ExpediaHomePage).flight_tab_element.click
  on(ExpediaHomePage).oneway_tab_element.click
end

And(/^user enters valid departing airport$/) do
  @file = on(ExpediaHomePage).load_yaml_file
  on(ExpediaHomePage).select_flight_origin @file['dep_city_name'], @file['dep_airport_code']
end

And(/^user enters valid arrivng airport$/) do
  @file = on(ExpediaHomePage).load_yaml_file
  on(ExpediaHomePage).select_flight_destination @file['arr_city_name'], @file['arr_airport_code']
end

And(/^user enters valid date of departure$/) do
  @file = on(ExpediaHomePage).load_yaml_file
  on(ExpediaHomePage).select_departing_date @file['dep_date']
end

And(/^user enters on the valid number for adults$/) do
  @file = on(ExpediaHomePage).load_yaml_file
  on(ExpediaHomePage).select_adults @file['adults']
end

And(/^user clicks on search page$/) do
  on(ExpediaHomePage).submit_element.click
end

Then(/^user sees the results page$/) do
  actual_message = on(ExpediaResultsPage).title_text_element.text
  expected_message = 'Select your departure to'
  if(actual_message.include?expected_message)
    p "existing"
  end
end