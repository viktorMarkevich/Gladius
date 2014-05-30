require 'spec_helper'

describe Member do
  context 'check associations' do
    it { should have_one(:user_school_relation) }
    it { should have_one(:school).through(:user_school_relation) }
  end

  context 'check nested attributes' do
    it { should accept_nested_attributes_for(:contact_info) }
    it { should accept_nested_attributes_for(:user_school_relation) }
  end
end


