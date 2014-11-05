require 'rails_helper'

describe Image do

  context 'relations' do
    it { expect belong_to(:user) }
    it { expect belong_to(:member).with_foreign_key(:user_id) }
  end

  context 'check attached' do
    it { expect have_attached_file(:avatar) }
    it { expect validate_attachment_content_type(:avatar).
                    allowing('image/png', 'image/gif').
                    rejecting('text/plain', 'text/xml') }
    it { expect validate_attachment_size(:avatar).
                    less_than(2.megabytes) }
  end
end
