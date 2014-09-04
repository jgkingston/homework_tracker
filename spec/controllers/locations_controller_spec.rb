require 'rails_helper'

describe LocationsController do

  let!(:location) { create(:location) }

  it "GET #index" do
    sign_in
    get :index
    expect(assigns(:locations).class).to eq(Location::ActiveRecord_Relation)
  end

  describe "GET #show" do
    it 'should find an object' do
      sign_in
      get :show, id: location
      expect(assigns(:location).class).to eq(Location)
    expect(assigns(:location).new_record?).to eq(false)

    end
  end

  it "GET #new" do
    sign_in
    get :new
    expect(assigns(:location).class).to eq(Location)
    expect(assigns(:location).new_record?).to eq(true)
  end

  describe "POST #create" do
    it 'successful creation' do
      sign_in
      expect { post :create, location: attributes_for(:location) }.to change(Location, :count).by(1)
      expect(response).to redirect_to root_path
    end

    it "failed creation" do
      sign_in
      expect { post :create, location: {state: ""} }.not_to change(Location, :count)
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it 'should find an object' do
      sign_in
      get :edit, id: location
      
      expect(assigns(:location)).to eq(location)
      expect(assigns(:location).class).to eq(Location)
    end
  end

  describe "PATCH #update" do
    it 'should find an object' do
      sign_in
      put :update, id: location, location: attributes_for(:location)

      expect(assigns(:location).city).to eq("Charleston")
      expect(assigns(:location).class).to eq(Location)
    end

    it 'successful update' do
      sign_in
      put :update, id: location, location: {city: "Austin", state: "TX"} 
      expect(assigns(:location).city).to eq("Austin")
    end

    it "failed creation" do
      sign_in
      expect { put :update, id: location, location: {city: nil} }.not_to change(Location, :count)
      expect(response).to render_template :edit
    end
  end

  describe "DELETE #" do
    it 'should destroy an object' do
      sign_in
      puts location.id
      expect { delete :destroy, id: location }.to change(Location, :count).by(-1)
      expect(response).to redirect_to root_path
    end
  end

end