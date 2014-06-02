require 'spec_helper'
describe MembersController do

    before :each do
      request.env['devise.mapping'] = Devise.mappings[:user]
      @user = FactoryGirl.create(:user)
      @member = FactoryGirl.create(:member)
      @school = FactoryGirl.create(:school, creator_id: @user.id)
      rel = FactoryGirl.build(:user_school_relation, school_id: @school.id, member_id: @member.id)
      rel.save
      sign_in @user
    end

    context 'permit' do
      it 'update permit' do
        hash = FactoryGirl.attributes_for(:member)
        put :update, school_id: @school, id: @member, member: hash
        assigns(:member).should eq(@member)
      end
    end

    context 'GET #index' do
      it 'assigns all users to @members' do
         get :index, school_id: @school
         expect(assigns(:members)).to eq([@member])
      end

      it 'renders the #index view' do
         get :index, school_id: @school
         response.should render_template(:index)
      end
    end

    context 'GET #show' do
      it 'assigns the requested user to @member' do
         get :show, school_id: @school, id: @member
         assigns(:member).should eq(@member)
      end

      it 'renders the #show view' do
         get :show, school_id: @school, id: @member
         response.should render_template :show
      end
    end
    #
    #context 'GET #edit' do
    #  it 'assigns the requested user to @user' do
    #    get :edit, id: @user
    #    assigns(:user).should eq(@user)
    #  end
    #
    #  it 'renders the #edit view' do
    #    get :edit, id: FactoryGirl.create(:user)
    #    response.should render_template :edit
    #  end
    #end
    #
    #describe 'PUT update' do
    #  context 'valid attributes' do
    #    it 'located the requested @user' do
    #      put :update, id: @user, user: FactoryGirl.attributes_for(:user)
    #      assigns(:user).should eq(@user)
    #    end
    #    it 'changes @users attributes' do
    #      put :update, id: @user, user: FactoryGirl.attributes_for(:user, first_name: 'Larry', last_name: 'Smith')
    #      @user.reload
    #      @user.first_name.should eq('Larry')
    #      @user.last_name.should eq('Smith')
    #    end
    #    it 'redirects to the updated user' do
    #      put :update, id: @user, user: FactoryGirl.attributes_for(:user)
    #      response.should redirect_to @user
    #    end
    #
    #    it 'redirects to the updated user' do
    #      put :update, id: @user.id, user: FactoryGirl.attributes_for(:invalid_user)
    #      response.should render_template(:edit)
    #    end
    #  end
    #
    #  context 'invalid attributes' do
    #    it 'locates the requested @user' do
    #      put :update, id: @user, user: FactoryGirl.attributes_for(:invalid_user)
    #      assigns(:user).should eq(@user)
    #    end
    #    it 'does not change @users attributes' do
    #      put :update, id: @user, user: FactoryGirl.attributes_for(:user, first_name: 'Larry', last_name: 'Smith')
    #      @user.reload @user.first_name.should_not eq('Larry')
    #      @user.last_name.should eq('Smith')
    #    end
    #  end
    #end
end
