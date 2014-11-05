require 'rails_helper'

describe Article do
  context 'check column' do
    it { should have_db_column(:title) }
    it { should have_db_column(:body) }
    it { should have_db_column(:school_id) }
    it { should have_db_column(:author_id) }
    it { should have_db_column(:published).with_options( default: false ) }
    it { should have_db_column(:to_homepage).with_options( default: false ) }

    it { should have_db_index(:school_id).unique(true) }
    it { should have_db_index(:author_id).unique(true) }
    it { should have_db_index(:admin_author_id).unique(true) }
  end
  context 'check associations' do
    it { should belong_to(:school) }
    it { should belong_to(:author) }
  end

  context 'check validate' do
    it { should validate_presence_of(:title) }
    it { should ensure_length_of(:title).is_at_least(5).is_at_most(140).with_message('The name must be at least 5 characters and no more than 140 characters!') }
    it { should validate_presence_of(:school_id) }
    it { should validate_presence_of(:author_id) }
  end
end


