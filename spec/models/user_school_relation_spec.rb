require 'spec_helper'

describe UserSchoolRelation do
  context 'check column' do
    it { should have_db_column(:member_id) }
    it { should have_db_column(:school_id) }
    it { should have_db_column(:level).with_options( default: 0 ) }
    it { should have_db_column(:status).with_options( default:'student' ) }
    it { should have_db_column(:role).with_options( default:'student' ) }
  end
  context 'check associations' do
    it { should belong_to(:member).class_name('User') }
    it { should belong_to(:school) }
  end
end
