require 'rails_helper'

describe UsersHelper do
  it 'should receive a sex' do
    @user = FactoryGirl.create(:user, sex: true)
    helper.get_sex.should eql('Женский')
  end
end
