require 'rails_helper'

describe User do
  context 'check column' do
    it { expect have_db_column(:email) }
    it { expect have_db_column(:login) }
    it { expect have_db_column(:first_name) }
    it { expect have_db_column(:second_name) }
    it { expect have_db_column(:last_name) }
    it { expect have_db_column(:birthday) }
    it { expect have_db_column(:sex).with_options( default: false ) }
    it { expect have_db_column(:weight) }
    it { expect have_db_column(:about) }
    it { expect have_db_column(:role).with_options( default: 'fighter' ) }

    it { expect have_db_index(:email).unique(true) }
    it { expect have_db_index(:login).unique(true) }
    it { expect have_db_index(:reset_password_token).unique(true) }
  end
  context 'check associations' do
    it { expect have_one(:contact_info) }
    it { expect have_one(:image).dependent(:destroy) }
    it { expect have_many(:schools).with_foreign_key('creator_id') }
    it { expect have_many(:articles).with_foreign_key('author_id') }
  end

  context 'check validate' do
    it { expect validate_uniqueness_of(:login) }
    it { expect allow_value('dfsfgfd').for(:login) }
    it { should_not allow_value('asd fjkl').for(:login).with_message('should not have spaces') }
    it { expect validate_presence_of(:email) }
    it { expect validate_uniqueness_of(:email) }
    it { expect allow_value('example@ex.re').for(:email) }
    it { expect validate_presence_of(:role) }
    # it { should allow_value(11.1).for(:weight) }
    # it { should_not allow_value('dfgdg').for(:weight).with_message('should not have characters strings.') }
  end

  context 'check nested attributes' do
    it { expect accept_nested_attributes_for(:contact_info) }
  end

  context 'check methods of model' do
    it "before_create :create_login" do
      user = FactoryGirl.build(:user, email: 'login@mail.ru')
      expect(user.send(:create_login)).to eq 'login'
      user.save
    end

    it "before_create :create_login when login are taken" do
      user_new = FactoryGirl.build(:user, email: 'login@mail_new.ru')
      FactoryGirl.create(:user, email: 'login@mail.ru')
      expect(user_new.send(:create_login)).to eq 'login@mail_new.ru'
      user_new.save
    end

    it "check to full_name method" do
      user = FactoryGirl.build(:user, email: 'login@mail.ru')
      expect(user.full_name).to eq 'A B'
    end
  end
end


