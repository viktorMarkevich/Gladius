require 'rails_helper'

describe School do
  context 'check column' do
    it { should have_db_column(:name) }
    it { should have_db_column(:date_of_foundation) }
    it { should have_db_column(:status) }
    it { should have_db_column(:info) }
  end
  context 'check associations' do
    it { should belong_to(:creator).class_name('User') }
    it { should belong_to(:fighting_art) }
    it { should have_one(:contact_info) }
    it { should have_many(:user_school_relations).dependent(:destroy) }
    it { should have_many(:members).through(:user_school_relations) }
    it { should have_many(:articles).dependent(:destroy) }
  end

  context 'check nested attributes' do
    it { should accept_nested_attributes_for(:contact_info) }
  end

  context 'check validation' do
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:name) }
    it { should ensure_length_of(:name).is_at_least(5).is_at_most(40).with_message('The name must be at least 5 characters and no more than 40 characters!') }
    it { should validate_presence_of(:creator_id) }
  end
end
