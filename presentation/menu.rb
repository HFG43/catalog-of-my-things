require_relative '../logic/user_interact'
require_relative 'app'
require_relative '../persistence/data/albums'
require_relative 'images'

class Menu
  include Ascii
  attr_accessor :data

  def initialize
    @data = UserInteract.new
    @app = App.new

    @menu = { 1 => ['List all books', 'list_books'],
              2 => ['List all music albums', 'list_albums'],
              3 => ['List all games', 'list_games'],
              4 => ['List all genres', 'list_genres'],
              5 => ['List all labels', 'list_labels'],
              6 => ['List all authors', 'list_authors'],
              7 => ['Add a book', 'add_book'],
              8 => ['Add a music album', 'add_album'],
              9 => ['Add a game', 'add_game'],
              10 => %w[Exit save_all_on_exit] }
  end

  def menu_options
    puts "\n"

    @menu.each do |key, value|
      puts "#{key}: #{value[0]}"
    end

    sub_menu(@data.option)
  end

  def sub_menu(option)
    @menu.each do |key, value|
      next unless key == option

      @app.send(value[1])
      next unless option == 10

      puts "\n\n\nI'll be back!!\n\n"

      hand

      exit
    end

    menu_options
  end
end
