require_relative '../match.rb' 

RSpec.describe Match do
    let(:match) { Match.new("Player 1", "Player 2") }

    describe "#score" do
        it "returns the initial score" do
            expect(match.score).to eq("0 - 0,  0 - 0")
        end
    end

    describe "#point_won_by" do
        it "updates score correctly for a single point" do
            match.point_won_by("Player 1")
            expect(match.score).to eq("0 - 0,  15 - 0")
        end

        it "updates score correctly for multiple points" do
            3.times { match.point_won_by("Player 1") }
            expect(match.score).to eq("0 - 0,  40 - 0")
        end
    end

    describe "Regular scoring" do
        it "handles deuce correctly" do
            3.times { match.point_won_by("Player 1") }
            3.times { match.point_won_by("Player 2") }
            expect(match.score).to eq("0 - 0,  Deuce")
        end

        it "handles advantage correctly" do
            3.times { match.point_won_by("Player 1") }
            4.times { match.point_won_by("Player 2") }
            expect(match.score).to eq("0 - 0,  Advantage Player 2")
        end

        it "updates score correctly when game is won" do
            4.times { match.point_won_by("Player 1") }
            expect(match.score).to eq("1 - 0,  0 - 0")
        end
    end

    describe "Set Won without tiebreak" do
        it "handles set won correctly" do
            24.times { match.point_won_by("Player 1") }
            expect(match.score).to eq("6 - 0,  0 - 0") # Player 1 won the Set, Program Terminated
        end
    end


    describe "Set Won with tiebreak" do
        # to run these test comment out exit(false) Line 41. in Set.rb
        it "handles set won correctly" do
            8.times { match.point_won_by("Player 1") }
            8.times { match.point_won_by("Player 2") }
            8.times { match.point_won_by("Player 1") }
            8.times { match.point_won_by("Player 2") }
            4.times { match.point_won_by("Player 1") }
            4.times { match.point_won_by("Player 2") }
            4.times { match.point_won_by("Player 1") }
            4.times { match.point_won_by("Player 2") }
            7.times { match.point_won_by("Player 2") }
            expect(match.score).to eq("6 - 7,  0 - 0") # Player 2 won the tie breaker
        end
    end
    
end
