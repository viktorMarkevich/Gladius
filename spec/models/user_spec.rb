require 'spec_helper'

describe User do
  context 'check column' do
    it { should have_db_column(:email) }
    it { should have_db_column(:login) }
    it { should have_db_column(:first_name) }
    it { should have_db_column(:second_name) }
    it { should have_db_column(:last_name) }
    it { should have_db_column(:birthday) }
    it { should have_db_column(:sex).with_options( default: false ) }
    it { should have_db_column(:weight) }
    it { should have_db_column(:about) }
    it { should have_db_column(:role).with_options( default: 'fighter' ) }

    it { should have_db_index(:email).unique(true) }
    it { should have_db_index(:login).unique(true) }
    it { should have_db_index(:reset_password_token).unique(true) }
  end
  context 'check associations' do
    it { should have_one(:contact_info) }
    it { should have_one(:image).dependent(:destroy) }
    it { should have_many(:schools).with_foreign_key('creator_id') }
    it { should have_many(:articles).with_foreign_key('author_id').dependent(:destroy) }
  end

  context 'check validate' do
    it { should validate_uniqueness_of(:login) }
    it { should allow_value('dfsfgfd').for(:login) }
    it { should_not allow_value('asd fjkl').for(:login).with_message('should not have spaces') }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should allow_value('example@ex.re').for(:email) }
    it { should validate_presence_of(:role) }
    it { should allow_value(11.1).for(:weight) }
    it { should_not allow_value('dfgdg').for(:weight).with_message('should not have characters strings.') }
  end

  context 'check nested attributes' do
    it { should accept_nested_attributes_for(:contact_info) }
  end

  context 'check methods of model' do
    it "before_create :create_login" do
      user = FactoryGirl.build(:user, email: 'login@mail.ru')
      user.send(:create_login).should == 'login'
      user.save
    end

    it "before_create :create_login when login are taken" do
      user_new = FactoryGirl.build(:user, email: 'login@mail_new.ru')
      FactoryGirl.create(:user, email: 'login@mail.ru')
      user_new.send(:create_login).should == 'login@mail_new.ru'
      user_new.save
    end

    it "check to full_name method" do
      user = FactoryGirl.build(:user, email: 'login@mail.ru')
      user.full_name.should == 'A B'
    end
  end
end


