require 'spec_helper.rb'

RSpec.describe StatTracker do
  before do
    games_test_csv = './spec/feature/game_test.csv'
    game_teams_test_csv = './spec/feature/game_team_test.csv'
    team_test_csv = './spec/feature/team_test.csv'
    games_csv = './data/games.csv'
    team_csv = './data/teams.csv'
    game_teams_csv = './data/game_teams.csv'

    @locations = {
      games: games_test_csv,
      teams: team_test_csv,
      game_by_team: game_teams_test_csv
    }
    @locations_2 = {
      games: games_csv,
      teams: team_csv,
      game_by_team: game_teams_csv
    }
    @stat_tracker = StatTracker.new
    @stat_tracker.from_csv(@locations)
  end
  describe "#exists" do
    it "exists" do
      expect(@stat_tracker).to be_a(StatTracker)
    end

    it "has readable attributes" do
      expect(@stat_tracker.games).to be_a(Array)
      expect(@stat_tracker.teams).to be_a(Array)
      expect(@stat_tracker.game_by_team).to be_a(Array)

    end
  end

  describe "#from_csv" do
    it "creates game objects" do

      expect(@stat_tracker.games[0]).to be_a(Game)
      expect(@stat_tracker.games.count).to eq(52)

    end

    it 'creates team_games objects' do

      expect(@stat_tracker.game_by_team[0]).to be_a(Game_By_Team)
      expect(@stat_tracker.game_by_team.count).to eq(269)
      expect(@stat_tracker.game_by_team)

    end

    it 'creates team objects' do
      expect(@stat_tracker.teams[0]).to be_a(Team)
      expect(@stat_tracker.teams.count).to eq(32)
      expect(@stat_tracker.teams)

    end
  end

  describe '#game_statics' do

    it "#highest_total_score" do
      expect(@stat_tracker.highest_total_score).to eq(6)
    end

    it "#lowest_total_score" do
      expect(@stat_tracker.lowest_total_score).to eq(1)
    end

    it "can find the percentage of home wins" do
      expect(@stat_tracker.percentage_home_wins).to eq(12.48)
    end

    it 'can find the percentage of away wins' do
      expect(@stat_tracker.percentage_visitor_wins).to eq(22.68)
    end

    it 'can find average goals per game' do
      expect(@stat_tracker.average_goals_per_game).to eq(3.72)
    end
    it 'can calculate #percentage_ties' do
      expect(@stat_tracker.percentage_ties).to eq(17.31)
    end

    it 'can calculate #count_of_games_by_season' do
    expected = {
      "20122013" => 20,
      "20132014" => 25,
      "20142015" => 2,
      "20162017" => 5
    }
    expect(@stat_tracker.count_of_games_by_season).to eq(expected)
    end

    it "can find the average goals per season" do
      expect(@stat_tracker.average_goals_by_season).to eq({
        "20122013"=>3.9,
        "20132014"=>3.64,
        "20142015"=>5.0,
        "20162017"=>2.8
      })
    end

  end



  describe '#league statics' do
    it 'can determine #average_goals_by_team' do
    expected = {
      "3"=>1.8064516129032258,
      "6"=>2.727272727272727,
      "5"=>1.9,
      "17"=>1.9285714285714286,
      "16"=>2.1379310344827585,
      "9"=>2.1818181818181817,
      "8"=>1.7272727272727273,
      "30"=>1.875,
      "26"=>2.130434782608696,
      "19"=>1.6666666666666667,
      "24"=>2.3529411764705883,
      "2"=>1.8333333333333333,
      "15"=>1.6923076923076923,
      "20"=>1.75,
      "14"=>1.9230769230769231,
      "28"=>2.4,
      "4"=>1.0,
      "21"=>1.7142857142857142,
      "25"=>2.5
    }
    expect(@stat_tracker.average_goals_by_team).to eq(expected)
    end

    it 'can determine which team has #best_offense' do
    expect(@stat_tracker.best_offense).to eq("FC Dallas")
    end

    it 'can determine which team has #worst_offense' do
    expect(@stat_tracker.worst_offense).to eq("Chicago Fire")
    end

    it 'can determine which team was #lowest_scoring_visitor' do
    expect(@stat_tracker.lowest_scoring_visitor).to eq("Seattle Sounders FC")
    end

    it 'can determine which team was #lowest_scoring_home_team' do
    expect(@stat_tracker.lowest_scoring_home_team).to eq("Chicago Fire")

  describe '#league_statics' do

    it 'can calculate #highest_scoring_visitor' do
      expect(@stat_tracker.highest_scoring_visitor).to eq("Los Angeles FC")
    end

    it 'can calculate #highest_scoring_home_team' do
      expect(@stat_tracker.highest_scoring_home_team).to eq("Seattle Sounders FC")

  describe "#season_statistics" do
    it "can display the name of the team with the most tackles in the season" do
      expect(@stat_tracker.most_tackles).to eq("Houston Dynamo")
    end

    it "can display the name of the team with the fewest tackles in the season" do
      expect(@stat_tracker.fewest_tackles).to eq("Toronto FC")
    end

    it "can find the total amount of goals per team" do
      expect(@stat_tracker.total_goals_by_teams).to eq({
        "3"=>56,
        "6"=>30,
        "5"=>38,
        "17"=>27,
        "16"=>62,
        "9"=>24,
        "8"=>19,
        "30"=>45,
        "26"=>49,
        "19"=>30,
        "24"=>40,
        "2"=>11,
        "15"=>22,
        "20"=>7,
        "14"=>25,
        "28"=>12,
        "4"=>6,
        "21"=>12,
        "25"=>15
      })
    end

    it "can name the team with the best ratio of shots to goals for the season"do
      expect(@stat_tracker.most_accurate_team).to eq("Chicago Fire")
    end

    it "can name the team with the worst ratio of shots to goals for the season"do
      expect(@stat_tracker.least_accurate_team).to eq("Chicago Red Stars")
    end
  end
end