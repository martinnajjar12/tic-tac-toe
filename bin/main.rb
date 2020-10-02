#!/usr/bin/env ruby

require 'pry'

class Player
  attr_reader :name
  attr_accessor :sign
  def initialize(name, sign = nil)
    @name = name
    @sign = sign
  end

  def choose_sign
    puts "#{@name} Choose if x or o"
    @sign = gets.chomp
    unless @sign == 'x' || @sign == 'o'
      puts 'Choose either x or o please'
      choose_sign
    end
  end
end

def game_initializer
  players_objects = []
  puts 'Enter player1 name please:'
  player1 = Player.new(gets.chomp)
  players_objects << player1
  puts 'Enter player2 name please'
  player2 = Player.new(gets.chomp)
  players_objects << player2

  # Choose a random player to specify a sign and start the game
  first_player = players_objects.sample
  second_player = nil
  first_player == player1 ? second_player = player2 : second_player = player1
  first_player.choose_sign
  first_player.sign == 'x' ? second_player.sign = 'o' : second_player.sign = 'x'
  binding.pry
end

game_initializer
