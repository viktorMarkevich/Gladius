require 'rails_helper'

describe School do
  context 'check column' do
    it { expect have_db_column(:name) }
    it { expect have_db_column(:date_of_foundation) }
    it { expect have_db_column(:status) }
    it { expect have_db_column(:info) }
  end
  context 'check associations' do
    it { expect belong_to(:creator).class_name('User') }
    it { expect belong_to(:fighting_art) }
    it { expect have_one(:contact_info) }
    it { expect have_many(:user_school_relations).dependent(:destroy) }
    it { expect have_many(:members).through(:user_school_relations) }
    it { expect have_many(:articles).dependent(:destroy) }
  end

  context 'check nested attributes' do
    it { expect accept_nested_attributes_for(:contact_info) }
  end

  context 'check validation' do
    it { expect validate_uniqueness_of(:name) }
    it { expect validate_presence_of(:name) }
    it { expect ensure_length_of(:name).is_at_least(5).is_at_most(40).with_message('The name must be at least 5 characters and no more than 40 characters!') }
    it { expect validate_presence_of(:creator_id) }
  end
end
