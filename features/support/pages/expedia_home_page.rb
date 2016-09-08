class ExpediaHomePage
  include PageObject

  page_url 'https://www.expedia.com/'

  a(:flight_tab, :id => 'tab-flight-tab')
  label(:oneway_tab, :id => 'flight-type-one-way-label')
  text_field(:flight_origin, :id => 'flight-origin')
  text_field(:flight_destination, :id => 'flight-destination')
  text_field(:flight_departing, :id => 'flight-departing')
  select(:adults, :id => 'flight-adults')
  button(:submit, :id => 'search-button')
  div(:list_of_cities, :class => 'display-group-results')



def select_flight_origin (city_name, airport_code)
  self.flight_origin = city_name
  self.flight_origin_element.send_keys :end
  list_of_cities_element.when_present.list_item_elements.each do |airport_name|
       if(airport_name.text.include?airport_code)
          airport_name.click
       end
      break
    end
  end

  def select_flight_destination (city_name, airport_code)
    self.flight_destination = city_name
    self.flight_destination_element.send_keys :end
    list_of_cities_element.when_present.list_item_elements.each do |airport_name|

      if(airport_name.text.include?airport_code)
        airport_name.click
        break
      end
    end
  end

def select_departing_date num_of_days
  self.flight_departing = select_format num_of_days
end

  def select_format number_of_days
    (Time.now + 3600 * 24 * number_of_days).strftime("%m/%d/%Y")
  end

def select_adults number_adults
  self.adults = number_adults
end

def load_yaml_file
  @file = YAML.load_file 'C:\Users\Suman\RubymineProjects\Suman\practice_yml\test.yml'
end









end



