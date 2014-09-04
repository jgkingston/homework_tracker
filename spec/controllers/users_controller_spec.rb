require 'rails_helper'

describe UsersController do

  context 'logged in' do

    context 'as admin' do

      before do
        @user = FactoryGirl.create(:admin)
        sign_in @user 
      end

      it "GET #index" do

        get :index
          expect(assigns(:users).class).to eq(User::ActiveRecord_Relation)
     
      end

    end

  end

end
