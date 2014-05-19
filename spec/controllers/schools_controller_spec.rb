require 'spec_helper'
describe SchoolsController do

    before :each do
      request.env['devise.mapping'] = Devise.mappings[:user]
      @user = FactoryGirl.create(:user)
      @school = FactoryGirl.create(:school)
      @school.update_attributes(creator_id: @user.id)
      sign_in @user
    end

    it 'update permit' do
      hash = FactoryGirl.attributes_for(:school)
      hash[:creator_id] = @user.id
      put :update, user_id: @user, id: @school, school: hash
      assigns(:school).should eq(@school)
    end

    context 'GET #index' do
      it 'assigns all schools to @school' do
        get :index
        expect(assigns(:schools)).to eq([@school])
      end

      it 'renders the #index view' do
        get :index
        response.should render_template(:index)
      end
    end

    context 'GET #index user.schools' do
      it ' user.school' do
        get :index, user_id: @user
        expect(assigns(:schools)).to eq([@school])
      end

      it 'renders the #index view' do
        get :index
        response.should render_template(:index)
      end
    end

    context 'GET #show' do
      it 'assigns the requested user to @school' do
        get :show, id: @school
        assigns(:school).should eq(@school)
      end

      it 'renders the #show view' do
        get :show, id: FactoryGirl.create(:school)
        response.should render_template :show
      end
    end

      it "assigns form params[:school] to the new school" do
        @school = FactoryGirl.build :school
        get :new, user_id: @user.id
        assigns(:school).should_not be_nil
      end

      it "renders the #new view" do
        get :new, user_id: @user.id
        response.should render_template :new
      end

end
