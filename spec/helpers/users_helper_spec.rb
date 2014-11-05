require 'rails_helper'

describe UsersHelper do
  it 'should receive a sex' do
    @user = FactoryGirl.create(:user, sex: true)
    expect(helper.get_sex).to eql('Женский')
  end
end
