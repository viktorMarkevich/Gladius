require 'rails_helper'

describe Member do
  context 'check associations' do
    it { expect have_one(:image).with_foreign_key(:user_id) }
    it { expect have_one(:user_school_relation) }
    it { expect have_one(:school).through(:user_school_relation) }
  end

  context 'check nested attributes' do
    it { expect accept_nested_attributes_for(:contact_info) }
    it { expect accept_nested_attributes_for(:user_school_relation) }
  end

  context 'check methods of model' do
    it 'after_create :member?' do
      member = FactoryGirl.build(:invalid_member)
      expect(member.kind).to eq nil
      member.save
      member.send(:member?)
      expect(member.kind).to eq 'Member'
    end
  end
end


