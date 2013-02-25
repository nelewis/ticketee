require 'spec_helper'

feature "Viewing projects:" do
  let!(:user) { Factory(:confirmed_user) }
  let!(:project) { Factory(:project) }

  before do
    sign_in_as!(user)
    define_permission!(user, :view, project)
    #textmate_2 = Factory(:project, :name => "TextMate 2")
    #internet_explorer = Factory(:project, :name => "Internet Explorer")
  end

  scenario "Listing all projects" do
    visit '/'
    click_link project.name
    page.current_url.should == project_url(project)
    #page.should have_content("TextMate 2")
    #page.should have_content("Internet Explorer")
  end
end
