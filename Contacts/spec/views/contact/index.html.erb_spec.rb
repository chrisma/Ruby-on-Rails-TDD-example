require 'rails_helper'

RSpec.describe "contact/index.html.erb", type: :view do
  context "with 2 contacts" do
    before(:each) do
      @adam = Contact.create!(first_name: "Adam")
      @eve = Contact.create!(first_name: "Eve")
      assign(:contact_list, [@adam, @eve])
      render # populates rendered
    end

    it "displays all first names of contacts" do
      expect(rendered).to match @adam.first_name
      expect(rendered).to match @eve.first_name
    end

    it "displays a heading" do
      expect(rendered).to match "<h1>Contact list</h1>"
    end
  end
end
