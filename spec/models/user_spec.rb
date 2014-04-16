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
    it { should have_many(:schools).with_foreign_key('creator_id') }
  end

  context 'check validate' do
    it { should validate_presence_of(:login) }
    it { should validate_uniqueness_of(:login) }
    it { should allow_value('dfsfgfd').for(:login) }
    it { should_not allow_value('asd fjkl').for(:login).with_message('should not have spaces') }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should allow_value('example@ex.re').for(:email) }
    it { should_not allow_value('exampl eex.re').for(:email).with_message('the wrong format') }
    it { should validate_presence_of(:birthday) }
    it { should validate_presence_of(:role) }
  end

end


