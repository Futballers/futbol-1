require 'spec_helper'

RSpec.describe Team do
  before do
    @data = {
    :team_id      => 1,
    :franchiseid => 23,
    :teamname    => "Atlanta United",
    :abbreviation => "ATL",
    :stadium      => "Mercedes-Benz Stadium",
    :link         => "/api/v1/teams/1"
    }
    
    @team = Team.new(@data)
  end

  describe "#exists" do
    it "exists" do
      expect(@team).to be_a(Team)
    end

    it "has readable attributes" do
      expect(@team.team_id).to eq(1)
      expect(@team.franchise_id).to eq(23)
      expect(@team.team_name).to eq("Atlanta United")
      expect(@team.abbreviation).to eq("ATL")
      expect(@team.stadium).to eq("Mercedes-Benz Stadium")
      expect(@team.link).to eq("/api/v1/teams/1")
    end
  end
end