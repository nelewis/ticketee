require 'spec_helper'

feature "Creating Tickets:" do

  before do

    project = Factory(:project, :name => "Internet Explorer")

    user = Factory(:confirmed_user, :email => "ticketee@example.com")

    define_permission!(user, "view", project)

    define_permission!(user, "create tickets", project)

    sign_in_as!(user)

    visit '/'

    click_link "Internet Explorer" #only project listed

    click_link  "New Ticket" #start to create a new ticket

    #message = "You need to sign in or sign up before continuing."

    #page.should have_content(message)

    #fill_in "Email", :with => "ticketee@example.com"

    #fill_in "Password", :with => "password"

    #click_button "Sign in"

    within("h2") { page.should have_content("New Ticket") }

  end

  scenario "Creating a ticket" do

    fill_in "Title", :with => "Non-standards compliance"

    fill_in "Description", :with => "My pages are ugly!"

    click_button "Create Ticket"

    page.should have_content("Ticket has been created.")

    within("#ticket #author") do

      page.should have_content("Created by ticketee@example.com")

    end

  end

  scenario "Creating a ticket with an attachment" do
    fill_in "Title", :with => "Add documentation for blink tag"
    fill_in "Description", :with => "The blink tag has a speed attribute"
    attach_file "File #1", "spec/fixtures/speed.txt"
    attach_file "File #2", "spec/fixtures/spin.txt"
    attach_file "File #3", "spec/fixtures/gradient.txt"
    click_button "Create Ticket"
    page.should have_content("Ticket has been created.")
    within("#ticket .assets") do
      page.should have_content("speed.txt")
      page.should have_content("spin.txt")
      page.should have_content("gradient.txt")
    end
  end

  scenario "Creating a ticket without valid attributes fails" do

    click_button "Create Ticket"

    page.should have_content("Ticket has not been created.") # seems to be only 1 alert message allowed

    page.should have_content("Title can't be blank")

    page.should have_content("Description can't be blank")

  end

  scenario "Description must be longer than 10 characters in nested ticket inside project" do

    fill_in "Title", :with => "Non-standards compliance"

    fill_in "Description", :with => "it sucks"

    click_button "Create Ticket"

    page.should have_content("Ticket has not been created.")  # seems to be only 1 alert message allowed

    page.should have_content("Description is too short")

  end

end
