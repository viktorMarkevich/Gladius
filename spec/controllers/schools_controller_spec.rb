require 'rails_helper'
describe SchoolsController do

  before :each do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe 'first part' do
    before :each do
      @school = create(:school, creator: @user)
    end

    it 'update permit' do
      put :update, user_id: @user, id: @school, school: FactoryGirl.attributes_for(:school).merge!( creator_id: @user.id )
      expect(assigns(:school)).to eq(@school)
    end

    it 'render to edit' do
      put :update, user_id: @user, id: @school, school: FactoryGirl.attributes_for(:school)
      expect(response).to render_template(:edit)
    end

    context 'GET #index', :search => true do
      it 'assigns all schools to @school' do
        get :index
        Sunspot.commit
        expect(School.solr_search { keywords 'wing-chun'}.results).to eq([@school])
      end

      it 'renders the #index view' do
        get :index
        expect(response).to render_template(:index)
      end
    end

    context 'GET #index user.schools', :search => true do
      it ' user.schools' do
        get :index, user_id: @user
        Sunspot.commit
        expect(School.solr_search { keywords 'wing-chun'}.results).to eq([@school])
      end

      it 'renders the #index view' do
        get :index
        expect(response).to render_template(:index)
      end
    end

    context 'GET #show' do
      it 'assigns the requested user to @school' do
        get :show, id: @school
        expect(assigns(:school)).to eq(@school)
      end

      it 'renders the #show view' do
        get :show, id: @school
        expect(response).to render_template :show
      end
    end

    context 'GET #new' do
      it 'assigns form params[:school] to the new school' do
        @school = FactoryGirl.build :school
        get :new, user_id: @user
        expect(assigns(:school)).not_to be_nil
      end

      it 'renders the #new view' do
        get :new, user_id: @user
        expect(response).to render_template :new
      end
    end

    context 'DELETE #destroy' do
      it 'renders after #destroy' do
        delete :destroy, user_id: @user, id: @school
        expect(response).to render_template :index
      end
    end
  end

  describe 'POST #create' do
    context '@create method' do
      it 'should return true for save obj' do
        post :create, user_id: @user, school: FactoryGirl.attributes_for(:school).merge!( creator_id: @user.id )
        expect(assigns(:school)).to eq(School.last)
      end

      it 'should render template new' do
        post :create, user_id: @user, school: FactoryGirl.attributes_for(:school).merge!(name: 'name')
        expect(response).to render_template(:new)
      end
    end
  end

end
