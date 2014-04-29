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
    #
    # context 'GET #edit' do
    #   it 'assigns the requested user to @user' do
    #     get :edit, id: @user
    #     assigns(:user).should eq(@user)
    #   end
    #
    #   it 'renders the #edit view' do
    #     get :edit, id: FactoryGirl.create(:user)
    #     response.should render_template :edit
    #   end
    # end
    #
    # describe 'PUT update' do
    #   context 'valid attributes' do
    #     it 'located the requested @user' do
    #       put :update, id: @user, user: FactoryGirl.attributes_for(:user)
    #       assigns(:user).should eq(@user)
    #     end
    #     it 'changes @users attributes' do
    #       put :update, id: @user, user: FactoryGirl.attributes_for(:user, first_name: 'Larry', last_name: 'Smith')
    #       @user.reload
    #       @user.first_name.should eq('Larry')
    #       @user.last_name.should eq('Smith')
    #     end
    #     it 'redirects to the updated user' do
    #       put :update, id: @user, user: FactoryGirl.attributes_for(:user)
    #       response.should redirect_to @user
    #     end
    #
    #     it 'redirects to the updated user' do
    #       put :update, id: @user.id, user: FactoryGirl.attributes_for(:invalid_user)
    #       response.should render_template(:edit)
    #     end
    #   end
    #
    #   context 'invalid attributes' do
    #     it 'locates the requested @user' do
    #       put :update, id: @user, user: FactoryGirl.attributes_for(:invalid_user)
    #       assigns(:user).should eq(@user)
    #     end
    #     it 'does not change @users attributes' do
    #       put :update, id: @user, user: FactoryGirl.attributes_for(:user, first_name: 'Larry', last_name: 'Smith')
    #       @user.reload @user.first_name.should_not eq('Larry')
    #       @user.last_name.should eq('Smith')
    #     end
    #   end
    # end
end
