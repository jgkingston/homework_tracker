require 'rails_helper'

describe SubmissionsController do

  let!(:submission) { create(:submission) }
  let!(:assignment) { create(:assignment) } 

  describe "GET #show" do
    it "should find an Object" do
      sign_in
      get :show, assignment_id: submission.assignment, id: submission
      expect(assigns(:submission).class).to eq(Submission)
      expect(assigns(:submission).new_record?).to eq(false)
    end
  end

  describe "GET #new" do

    context 'as student' do

      before do
        @user = FactoryGirl.create(:student)
        sign_in @user 
      end

      it "should return a new Object" do
        get :new, assignment_id: submission.assignment
        expect(assigns(:submission).class).to eq(Submission)
        expect(assigns(:submission).new_record?).to eq(true)
      end
    end

    context 'as admin' do

      before do
        @user = FactoryGirl.create(:admin)
        sign_in @user 
      end

      it "should return a new Object" do
        get :new, assignment_id: submission.assignment
        expect(assigns(:submission).class).to eq(Submission)
        expect(assigns(:submission).new_record?).to eq(true)
      end
    end
  end

end