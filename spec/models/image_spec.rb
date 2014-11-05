require 'rails_helper'

describe Image do

  context 'relations' do
    it { should belong_to(:user) }
    it { should belong_to(:member).with_foreign_key(:user_id) }
  end

  context 'check attached' do
    it { should have_attached_file(:avatar) }
    it { should validate_attachment_content_type(:avatar).
                    allowing('image/png', 'image/gif').
                    rejecting('text/plain', 'text/xml') }
    it { should validate_attachment_size(:avatar).
                    less_than(2.megabytes) }
  end
end
