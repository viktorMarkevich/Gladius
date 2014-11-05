require 'rails_helper'

describe Article do
  context 'check column' do
    it { expect have_db_column(:title) }
    it { expect have_db_column(:body) }
    it { expect have_db_column(:school_id) }
    it { expect have_db_column(:author_id) }
    it { expect have_db_column(:published).with_options( default: false ) }
    it { expect have_db_column(:to_homepage).with_options( default: false ) }

    it { expect have_db_index(:school_id).unique(true) }
    it { expect have_db_index(:author_id).unique(true) }
    it { expect have_db_index(:admin_author_id).unique(true) }
  end
  context 'check associations' do
    it { expect belong_to(:school) }
    it { expect belong_to(:author) }
  end

  context 'check validate' do
    it { expect validate_presence_of(:title) }
    it { expect ensure_length_of(:title).is_at_least(5).is_at_most(140).with_message('The name must be at least 5 characters and no more than 140 characters!') }
    it { expect validate_presence_of(:school_id) }
    it { expect validate_presence_of(:author_id) }
  end
end


