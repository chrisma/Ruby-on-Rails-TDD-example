require 'rails_helper'

RSpec.describe "contact/index.html.erb", type: :view do
  context "with 2 contacts" do
    before(:each) do
      @adam = Contact.create!(first_name: "Adam", date_of_birth:Date.today - 25.years)
      @eve = Contact.create!(first_name: "Eve", date_of_birth:Date.today - 19.years)
      assign(:contact_list, [@adam, @eve])
      render # populates rendered
    end

    it "displays all first names of contacts" do
      expect(rendered).to match @adam.first_name
      expect(rendered).to match @eve.first_name
    end

    it "displays all first names of contacts" do
      expect(rendered).to match @adam.age.to_s
      expect(rendered).to match @eve.age.to_s
    end

	it "displays a heading" do
      expect(rendered).to match "<h1>Contact list</h1>"
    end
  end
end
