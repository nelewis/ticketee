require 'spec_helper'

feature "Viewing projects" do
  scenario "Listing all projects" do
	views = Factory.create(:name => "States")
	visit '/'
	click_link 'States'
	page.current_url.should == project_url(views)
  end
end