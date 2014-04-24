require 'spec_helper'

describe FightingArt do
  context 'check column' do
    it { should have_db_column(:title) }
    it { should have_db_column(:description) }
  end
  context 'check associations' do
    it { should have_many(:schools) }
  end
end
