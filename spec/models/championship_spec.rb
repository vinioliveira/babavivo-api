require 'rails_helper'

RSpec.describe Championship, :type => :model do

  let!(:championship){FactoryGirl.build(:championship)}

  describe "#save" do
    it 'without error' do
      expect(championship.save).to be true
    end
    it 'cant save missing any required field' do
      championship.creator = nil;
      expect(championship.save).to be false
    end
  end

  describe 'validation' do
    it 'number of outfiled_players between 0 and 10' do
      championship.outfield_players = 11
      expect(championship).to be_invalid
      expect(championship.errors[:outfield_players]).to include("must be less than or equal to 10")
    end

    it 'only S or F accepted as type_team' do
      championship.type_teams = 'N'
      expect(championship).to be_invalid
      expect(championship.errors[:type_teams]).to include("N is not a valid type")
    end

    it 'need a draw date if type_team were S' do
      championship.type_teams = 'S'
      championship.draw_date = nil
      expect(championship).to be_invalid
      expect(championship.errors[:draw_date]).to include("can't be blank")
    end

    it 'no need a draw date if type_team different of S' do
      championship.type_teams = 'F'
      championship.draw_date = nil
      expect(championship).to be_valid
    end

    it 'need at least one metric' do
      championship.metrics.clear
      expect(championship).to be_invalid

    end

  end

end
