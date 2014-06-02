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

  context 'GET #edit' do
    it 'assigns the requested user to @member' do
       get :edit, school_id: @school, id: @member
       assigns(:member).should eq(@member)
    end

    it 'renders the #edit view' do
       get :edit, school_id: @school, id: @member
       response.should render_template :edit
    end
  end

  describe 'PUT update' do
    context 'valid attributes' do
       it 'located the requested @member' do
         put :update, school_id: @school, id: @member, member: FactoryGirl.attributes_for(:member)
         assigns(:member).should eq(@member)
       end
       it 'changes @member attributes' do
         put :update, school_id: @school, id: @member, member: FactoryGirl.attributes_for(:member, first_name: 'Larry', last_name: 'Smith')
         @member.reload
         @member.first_name.should eq('Larry')
         @member.last_name.should eq('Smith')
       end
       it 'redirects to the updated member' do
         put :update, school_id: @school, id: @member, member: FactoryGirl.attributes_for(:member)
         response.should redirect_to(school_id: @school.id, id: @member.id)
       end

       it 'redirects to the updated member' do
         put :update, school_id: @school, id: @member, member: FactoryGirl.attributes_for(:invalid_member, email: nil)
         response.should render_template(:edit)
       end
    end

    context 'invalid attributes' do
      it 'locates the requested @member' do
        put :update, school_id: @school, id: @member, member: FactoryGirl.attributes_for(:invalid_member, email: nil)
        assigns(:member).should eq(@member)
      end
      it 'does not change @members attributes' do
        put :update, school_id: @school, id: @member, member: FactoryGirl.attributes_for(:member, first_name: 'Larry', last_name: 'Smith')
        @member.reload @user.first_name.should_not eq('Larry')
        @member.last_name.should eq('Smith')
      end
    end
  end

  context 'DELETE #destroy' do
    it 'renders after #destroy' do
      delete :destroy, school_id: @school.id, id: @member.id
      response.should render_template(:index)
    end
  end

  context 'GET #new' do
    it 'assigns form params[:member] to the new member' do
      @member = FactoryGirl.build(:member)
      get :new, school_id: @school
      assigns(:member).should_not be_nil
    end

    it 'renders the #new view' do
      get :new, school_id: @school
      response.should render_template :new
    end
  end
end
