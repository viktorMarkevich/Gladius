require 'spec_helper'

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
  end

  context 'check nested attributes' do
    it { should accept_nested_attributes_for(:contact_info) }
  end
end
