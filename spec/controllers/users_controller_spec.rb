require 'spec_helper'

describe UsersController do

    before :each do
      request.env['devise.mapping'] = Devise.mappings[:user]
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    it 'update permit' do
      hash = FactoryGirl.attributes_for(:user)
      put :update, id: @user, user: hash
      assigns(:user).should eq(@user)
    end

    context "GET #index" do

      it "assigns all users to @users" do
        get :index
        expect(assigns(:users)).to eq([@user])
      end

      it "renders the #index view" do
        get :index
        response.should render_template(:index)
      end
    end

    context "GET #show" do

      it "assigns the requested user to @user" do
        get :show, :id => @user
        assigns(:user).should eq(@user)
      end

      it "renders the #show view" do
        get :show, :id => FactoryGirl.create(:user)
        response.should render_template :show
      end
    end

    context "GET #edit" do

      it "assigns the requested user to @user" do
        get :edit, :id => @user
        assigns(:user).should eq(@user)
      end

      it "renders the #edit view" do
        get :edit, :id => FactoryGirl.create(:user)
        response.should render_template :edit
      end
    end

    it 'check methods of model' do
      put :update, id: @user.id, user: FactoryGirl.attributes_for(:user, email: 'login@example.com')
      @user.reload
      @user.email.should == 'login@example.com'
      puts @user.email
    end

    # describe 'PUT #update' do
    #
    #   before(:each) {
    #     User.stub(:find).and_return(@user)
    #   }
    #
    #   it 'should redirect to the user path on succesful save' do
    #     @user.should_receive(:update_attributes).and_return true
    #     put :update, id: @user.id, user: FactoryGirl.attributes_for(:user, email: 'test@example.com')
    #     response.should redirect_to edit_user_path(@user)
    #   end
    #
    #   it 'should render the edit screen again with errors if the model does not save' do
    #     @user.should_receive(:update_attributes).and_return false
    #     put :update, id: @user.id, user: FactoryGirl.attributes_for(:user, email: 'test@example.com')
    #     response.should render_template 'edit'
    #   end
    # end
end
