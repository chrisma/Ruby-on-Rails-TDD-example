require 'rails_helper'

RSpec.describe Contact, type: :model do
  before(:each) do
    @contact = Contact.new(first_name:'Adam', date_of_birth:Date.today)
  end

  context "age calculation" do
    it "calculates the correct age for newborns" do
      expect(@contact.age).to eq(0)
    end

    it "updates correctly on date_of_birth changes" do
      expect { 
        @contact.date_of_birth = Date.today - 5.years 
      }.to change{@contact.age}.from(0).to(5)
    end

    it "calculates correctly in full years" do
      @contact.date_of_birth = Date.today - 1.year
      expect(@contact.age).to eq(1)
    end

    it "calculates correctly in between years" do
      @contact.date_of_birth = Date.today - 366.days
      expect(@contact.age).to eq(1)
    end

    it "handles dates of birth in the future" do
      @contact.date_of_birth = Date.today + 1.year
      expect(@contact.age).to eq(0)
    end

  end
end
