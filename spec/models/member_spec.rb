require 'spec_helper'

describe Member do
  context 'check associations' do
    it { should have_many(:user_school_relations) }
    it { should have_many(:schools).through(:user_school_relations) }
  end

  context 'check nested attributes' do
    it { should accept_nested_attributes_for(:contact_info) }
    it { should accept_nested_attributes_for(:user_school_relations) }
  end
end


