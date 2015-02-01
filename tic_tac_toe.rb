class Game
	def initialize(player1, player2)
		@player1 = "X"
		@player2 = "Y"

		puts "Welcome to Ruby command line Tic-Tac-Toe"
		puts "Player1 - you will be 'X'"
		puts "Player2 - you will be 'O'"
		puts "Good luck to both players!"
		puts "Let the games begin:"

		@turn = 1
		drawBoard
		showBoard
		gamePlay
	end

	def drawBoard
		@board = {
			"a1"=>' ',
			"a2"=>' ',
			"a3"=>' ',
			"b1"=>' ',
			"b2"=>' ',
			"b3"=>' ',
			"c1"=>' ',
			"c2"=>' ',
			"c3"=>' '
		}

		@board_select = ["a1", "a2", "a3", "b1", "b2", "b3", "c1", "c2", "c3"]

	end

	def showBoard
		puts ""
		puts "#{@board['a1']}|#{@board['a2']}|#{@board['a3']}"
		puts "------"
		puts "#{@board['b1']}|#{@board['b2']}|#{@board['b3']}"
		puts "------"
		puts "#{@board['c1']}|#{@board['c2']}|#{@board['c3']}"
		puts ""
	end
	
	def gamePlay
		while @turn < 10
			if @turn%2==1
				clear = 0
				while clear == 0
					puts "Player1 - choose a block (a1-c3):"
					choice = gets.chomp.downcase.to_s
					if @board_select.include? choice
						clear = 1
					else
						clear = 0					
					end
				end
				@board[choice]=@player1
				@board_select.delete(choice)
			elsif @turn%2==0
				clear = 0
				while clear == 0
					puts "Player2 - choose a block (a1-c3):"
					choice = gets.chomp.downcase.to_s
					if @board_select.include? choice
						clear = 1
					else
						clear = 0
					end
				end
				@board[choice]=@player2
				@board_select.delete(choice)
			end
			showBoard
			@turn += 1
			gameTests
		end
	end

	def gameTests
		gameOver = false
		if @board["a1"] != ' ' || @board['b2'] != ' ' || @board['c3'] != ' '
			if (@board["a1"] == @board["a2"] && @board["a1"] == @board["a3"])
		 		gameOver = true
		 		winner=@board["a1"]
		 	elsif (@board["a1"] == @board["b2"] && @board["a1"] == @board["c3"])
		 		gameOver = true
		 	elsif (@board["a1"] == @board["b1"] && @board["a1"] == @board["c1"] )
		 		gameOver = true
		 		
		 	elsif (@board["b1"] == @board["b2"] && @board["b1"] == @board["b3"])
		 		gameOver = true
		 		
		 		winner=@board["b1"]
		 	elsif (@board["c1"] == @board["c2"] && @board["c1"] == @board["c3"])
		 		gameOver = true
		 		
		 		winner=@board["c1"]
		 	elsif (@board["c1"] == @board["b2"] && @board["c1"] == @board["a3"])
		 		gameOver = true
		 		
		 		winner=@board["c1"]
		 	elsif (@board["a2"] == @board["b2"] && @board["a2"] == @board["c2"])
		 		gameOver = true
		 		
		 		winner=@board["a2"]
		 	elsif (@board["a3"] == @board["b3"] && @board["a3"] == @board["c3"] )
		 		gameOver = true
		 		
		 		winner=@board["a3"]
		 	else
		 		gameOver = false
		 		gamePlay
		 	end
		 	if winner == ' '
		 		gameOver = false
		 		gamePlay
		 	end
		 end

		 if  gameOver
		 		puts "Game Over"
		 		if winner == "X"
		 			puts "Player1 wins!"
		 		elsif winner == "Y"
		 			puts "Player2 wins!"
		 		end
		 	@turn = 10
		 end
	end
end

go=Game.new("a", "b")