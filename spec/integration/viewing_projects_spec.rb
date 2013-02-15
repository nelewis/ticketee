require 'spec_helper'

feature "Viewing projects:" do
  before do
	textmate_2 = Factory(:project, :name => "TextMate 2")
		
	internet_explorer = Factory(:project, :name => "Internet Explorer")

	visit '/'
  end
  
  scenario "Listing all projects" do
	page.should have_content("TextMate 2")
	page.should have_content("Internet Explorer")
  end
end