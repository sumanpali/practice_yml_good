require 'watir-webdriver'



Before do
  @browser = Watir::Browser.new :chrome
  @browser.window.maximize
end

  After do |scenario|
    SCREENSHOTS_DIRECTORY = "html-report"
    if scenario.failed?
      #Saves screenshots to features/test_results/Screenshots directory, name is scenario name + timestamp
      #timestamp = Time.now
      # "#{scenario.name.gsub(' ', '_').gsub(/[^0-9A-Za-z_]/, '')}.png"
      screenshot = "screenshot-#{scenario.name.gsub(' ', '_').gsub(/[^0-9A-Za-z_]/, '')}-#{Time.now.strftime('%Y-%m-%d %H-%M-%S')}.png"
      @browser.driver.save_screenshot(File.join(SCREENSHOTS_DIRECTORY, screenshot))
      embed(File.join(SCREENSHOTS_DIRECTORY, screenshot), "image/png", "SCREENSHOT")
    end
  end


# After do
#   @browser.close
# end