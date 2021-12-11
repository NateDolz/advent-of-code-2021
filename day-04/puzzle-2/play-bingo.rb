require_relative 'bingo-board'

def prep_game(game_input)
    moves = []
    boards = []
    current_board = nil
    game_input.each do |line|
        if game_input.lineno == 1
            moves = line.strip.split(',')
            next
        end        

        if line.strip == ''
            current_board = BingoBoard.new()
            boards.push(current_board)
            next
        endef method_name
            
        end
        current_board.add_row(line)
    end

    winning_boards = play_game(moves, boards)
    if winning_boards.count == 0 
        puts "no winner"
        puts ''
        boards.each do |board|
            board.print_board
            puts ''
        end
    else
        winner = winning_boards.reverse[0]
        puts "winning sum: #{winner.sum}"
        puts "score: #{winner.score}"
    end

    
end

def play_game(moves, boards)
    winning_boards = []
    moves.each do |num|
        boards.each do |board|
            if board.won 
                next
            end
            board.mark_num(num)
            if board.has_won
                sum = board.get_winning_sum(num)
                winning_boards.push(board)
            end
        end 
    end
    return winning_boards
end

def read_input
    File.open('input.txt', 'r') do |f|
        prep_game(f)
    end
end


read_input