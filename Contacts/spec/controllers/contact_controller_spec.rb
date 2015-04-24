require 'rails_helper'

RSpec.describe ContactController, type: :controller do
  describe "GET index" do
    it "assigns @contacts in the context" do
      contact = Contact.create
      get :index
      expect(assigns(:contact_list)).to eq([contact])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
