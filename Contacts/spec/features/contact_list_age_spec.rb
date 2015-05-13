describe "the contact list", :type => :feature do
  before(:each) do
    adam = Contact.create!(
        first_name: "Adam",
        last_name: "Surname",
        date_of_birth:Date.today - 25.years)
    eve = Contact.create!(
      first_name: "Eve",
      last_name: "AnotherSurname",
      date_of_birth:Date.today - 19.years)
    @contacts = [adam, eve]

    visit '/contact/index'
  end

  it "shows the names of contacts and their age" do
    @contacts.each do |c|
      line = c.first_name + ' ' + c.last_name + ' | ' + c.age.to_s
      expect(page).to have_content line
    end
  end

  it "shows the correct amount of list items" do
    expect(page).to have_css("li", :count => @contacts.size)
  end

  it "Does not render the 'empty' message" do
    expect(page).to have_no_content 'No contacts available'
  end

  it "has a correct title" do
    expect(page).to have_title 'Contacts'
  end

  it "has a single top-level heading" do
    expect(page).to have_xpath("//h1", :count => 1)
  end

  it "saves the page HTML for debugging" do
    save_and_open_page
  end
end