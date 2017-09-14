require 'rails_helper'

describe Group do
  describe '#create' do
    it "is valid with a name" do
      group = create(:group)
      group.valid?
      expect(group).to be_valid
    end
  end
end
