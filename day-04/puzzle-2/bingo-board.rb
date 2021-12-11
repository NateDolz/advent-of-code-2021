class BingoBoard

    attr_reader :numbers, :board, :won, :sum, :score

    def initialize
        @numbers = []
        @board = Array.new(5) {Array.new(5, false)}
    end

    def add_row(row)
        @numbers.push(row.strip.split(/\s+/))
    end
    
    def mark_num(num)
        @numbers.each_with_index do |row, idx|     
            row.each_with_index do |val, jdx|
                if val == num
                    @board[idx][jdx] = true
                end                
            end
        end
    end

    def has_won
        @board.each_with_index do |row, idx|
            won = true
            row.each {|val| won = won && val}
            if won 
                @won = true
                return won
            end 
        end
        
        
        (0..4).to_a.each do |col| 
            won = true
            @board.each {|row| won = won && row[col]}
            if won 
                @won = true
                return won
            end
        end
        
        return false
    end

    def get_winning_sum(num)
        @sum = 0
        @numbers.each_with_index do |row, rdx| 
            row.each_with_index do |val, cdx| 
                @sum = @sum + (@board[rdx][cdx] ? 0 : val.to_i)
            end
        end
        @score = @sum * num.to_i
    end

    def print_board
        @numbers.each_with_index do |row, rdx|
            line = ''
            row.each_with_index do |val, cdx|
                line = line + "#{@numbers[rdx][cdx]}-#{@board[rdx][cdx] ? 'x': 'o'} "                
            end
            puts line
        end
    end
    
end