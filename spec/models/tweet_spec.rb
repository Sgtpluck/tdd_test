require 'spec_helper'

describe Tweet do
  describe 'validations' do

    it 'is valid' do
      expect(create(:tweet)).to be_valid
    end

    it 'is invalid without a body' do
      expect(build(:tweet, body: nil)).to be_invalid
    end

    it 'should have a body of less that 140 characters' do
      a = 'a' * 141
      expect(build(:tweet, body: a)).to be_invalid
    end

    it 'should have an author' do
      expect(build(:tweet, author: nil)).to be_invalid
    end
  end
end
