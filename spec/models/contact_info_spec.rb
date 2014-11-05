require 'rails_helper'

describe ContactInfo do
  context 'check column' do
    it { expect have_db_column(:name) }
    it { expect have_db_column(:info_for_id) }
    it { expect have_db_column(:info_for_type) }
    it { expect have_db_column(:country) }
    it { expect have_db_column(:city) }
    it { expect have_db_column(:address) }
    it { expect have_db_column(:site) }
    it { expect have_db_column(:skype) }
    it { expect have_db_column(:phone) }
  end
  context 'check associations' do
    it { expect belong_to(:info_for) }
  end
end
