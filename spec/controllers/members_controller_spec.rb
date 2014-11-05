require 'rails_helper'
describe MembersController do

  before :each do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    @school = FactoryGirl.create(:school, creator_id: @user.id)
    sign_in @user
  end

  describe 'text' do
    before :each do
      @member = FactoryGirl.create(:member)
      rel = FactoryGirl.build(:user_school_relation, school_id: @school.id, member_id: @member.id)
      rel.save
    end

    context 'GET #index' do
      it 'assigns all users to @members' do
         get :index, school_id: @school
         expect(assigns(:members)).to eq([@member])
      end

      it 'renders the #index view' do
         get :index, school_id: @school
         expect(response).to render_template :index
      end
    end

    context 'GET #show' do
      it 'assigns the requested user to @member' do
         get :show, school_id: @school, id: @member
         expect(assigns(:member)).to eq(@member)
      end

      it 'renders the #show view' do
         get :show, school_id: @school, id: @member
         expect(response).to render_template :show
      end
    end

    context 'GET #edit' do
      it 'assigns the requested user to @member' do
         get :edit, school_id: @school, id: @member
         expect(assigns(:member)).to eq(@member)
      end

      it 'renders the #edit view' do
         get :edit, school_id: @school, id: @member
         expect(response).to render_template :edit
      end
    end

    describe 'PUT update' do
      context 'valid attributes' do
         it 'located the requested @member' do
           put :update, school_id: @school, id: @member, member: FactoryGirl.attributes_for(:member)
           expect(assigns(:member)).to eq(@member)
         end
         it 'changes @member attributes' do
           put :update, school_id: @school, id: @member, member: FactoryGirl.attributes_for(:member, first_name: 'Larry', last_name: 'Smith')
           @member.reload
           expect(@member.first_name).to eq('Larry')
           expect(@member.last_name).to eq('Smith')
         end
         it 'redirects to the updated member' do
           put :update, school_id: @school, id: @member, member: FactoryGirl.attributes_for(:member)
           expect(response).to redirect_to(school_id: @school.id, id: @member.id)
         end

         it 'redirects to the updated member' do
           put :update, school_id: @school, id: @member, member: FactoryGirl.attributes_for(:invalid_member)
           expect(response).to render_template :edit
         end
      end

      context 'invalid attributes' do
        it 'locates the requested @member' do
          put :update, school_id: @school, id: @member, member: FactoryGirl.attributes_for(:invalid_member)
          expect(assigns(:member)).to eq(@member)
        end
        it 'does not change @members attributes' do
          put :update, school_id: @school, id: @member, member: FactoryGirl.attributes_for(:member, first_name: 'Larry', last_name: 'Smith')
          @member.reload
          expect(@user.first_name).not_to eq('Larry')
          expect(@member.last_name).to eq('Smith')
        end
      end
    end

    context 'DELETE #destroy' do
      it 'renders after #destroy' do
        delete :destroy, school_id: @school.id, id: @member.id
        expect(response).to render_template :index
      end
    end

    context 'GET #new' do
      it 'assigns form params[:member] to the new member' do
        @member = FactoryGirl.build(:member)
        get :new, school_id: @school
        expect(assigns(:member)).not_to be_nil
      end

      it 'renders the #new view' do
        get :new, school_id: @school
        expect(response).to render_template :new
      end
    end
  end

  describe 'POST #create' do
    context '@create method' do
      it 'should return true for save obj' do
        post :create, school_id: @school, member: FactoryGirl.attributes_for(:member)
        expect(assigns(:member)).to eq(Member.last)
      end

      it 'should render template new' do
        post :create, school_id: @school, member: FactoryGirl.attributes_for(:invalid_member)
        expect(response).to render_template :new
      end
    end
  end
end
