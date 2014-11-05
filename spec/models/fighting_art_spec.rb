require 'rails_helper'

describe FightingArt do
  context 'check column' do
    it { expect have_db_column(:title) }
    it { expect have_db_column(:description) }
  end
  context 'check associations' do
    it { expect have_many(:schools) }
  end
end
