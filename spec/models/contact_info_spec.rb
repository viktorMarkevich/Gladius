require 'spec_helper'

describe ContactInfo do
  context 'check column' do
    it { should have_db_column(:name) }
    it { should have_db_column(:info_for_id) }
    it { should have_db_column(:info_for_type) }
    it { should have_db_column(:country) }
    it { should have_db_column(:city) }
    it { should have_db_column(:address) }
    it { should have_db_column(:site) }
    it { should have_db_column(:skype) }
    it { should have_db_column(:phone) }
  end
  context 'check associations' do
    it { should belong_to(:info_for) }
  end
end
