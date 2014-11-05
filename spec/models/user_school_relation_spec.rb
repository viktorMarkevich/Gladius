require 'rails_helper'

describe UserSchoolRelation do
  context 'check column' do
    it { expect have_db_column(:member_id) }
    it { expect have_db_column(:school_id) }
    it { expect have_db_column(:level).with_options( default: 0 ) }
    it { expect have_db_column(:status).with_options( default:'student' ) }
    it { expect have_db_column(:role).with_options( default:'student' ) }
  end
  context 'check associations' do
    it { expect belong_to(:member) }
    it { expect belong_to(:school) }
  end
end
