require_relative "rps"
require "minitest/autorun"

class RPSTest < Minitest::Test
  
  #player = Player.new("Argus",["rock","paper","scissors"])
  
  def test_player_move_type
    player = Player.new("Argus",["rock","paper","scissors"])
    player.get_move
    assert_kind_of(Array,player.move) #should fail
  end
  
  def test_move_is_valid
    player = Player.new("Argus",["rock","paper","scissors"])
    player.get_move
    assert_includes(player.valid_entries,player.move) #should pass
  end
  
  def test_player_check_move
    player = Player.new("Argus",["rock","paper","scissors"])
    player.get_move
    foo = player.check_move(player.move)
    assert_equal(false, foo) #should fail
  end

  def test_player_won_round
    player = Player.new("Argus",["rock","paper","scissors"])
    player.won_round
    assert_equal(2,player.score) #should fail
  end
  
  def test_player_won_round_twice
    player = Player.new("Argus",["rock","paper","scissors"])
    player.won_round
    player.won_round
    assert_equal(2,player.score) #should succeed
  end
    
  
end
