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

    sum = play_game(moves, boards)
    if !sum 
        puts "no winner"
        puts ''
        boards.each do |board|
            board.print_board
            puts ''
        end
    end
    
end

def play_game(moves, boards)
    moves.each do |num|
        boards.each do |board|
            board.mark_num(num)
            if board.has_won
                sum = board.get_winning_sum
                puts "winning sum: #{sum}"
                puts "score: #{sum * num.to_i}"
                return true
            end
        end 
    end
    return false
end

def read_input
    File.open('input.txt', 'r') do |f|
        prep_game(f)
    end
end


read_input