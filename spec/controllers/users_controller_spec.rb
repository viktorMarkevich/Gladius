require 'spec_helper'

describe UsersController, :type => :controller do

  auth_for :user do
    before :each do
      @user = FactoryGirl.create(:user)
    end

    it 'update permit' do
      put :update, id: @user, user: FactoryGirl.attributes_for(:user)
      assigns(:user).should eq(@user)
    end

    it 'check methods of model' do
      put :update, id: @user, user_params: FactoryGirl.attributes_for(:user)
      should permit( :email, :password, :password_confirmation, :remember_me,
                             :about, :birthday, :first_name, :last_name, :level, :second_name,
                             :sex, :status, :weight, :login, :avatar, :role, :user_school_relations_attributes,
                             contact_info_attributes: [:site, :phone, :skype, :country, :city, :address]).for(:update)
    end
  end

end
