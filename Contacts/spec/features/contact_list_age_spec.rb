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
      expect(page).to have_text line
    end
  end

  it "shows the correct amount of list items" do
    expect(page.all("ul li").size).to eq @contacts.size
  end

  it "has a correct title" do
    expect(page).to have_title 'Contacts'
  end
end