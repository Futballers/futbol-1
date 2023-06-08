require 'csv'
require 'spec_helper.rb'

RSpec.describe GameStatics do
    before do
        games_csv = './spec/feature/game_test.csv'
        game_array = CSV.read(games_csv, headers: true).map(&:to_h)
        @game_statics = GameStatics.new(game_array)
      end

    it "#highest_total_score" do
      expect(@game_statics.highest_total_score).to eq(5)
    end

    it "#lowest_total_score" do
      expect(@game_statics.lowest_total_score).to eq(3)
    end

  describe "#percentage_home_wins" do
    it "can find the percentage of home wins" do
      expect(@game_statics.percentage_home_wins).to eq(0.08)
    end
  end
end