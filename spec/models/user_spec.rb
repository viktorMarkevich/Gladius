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
end


