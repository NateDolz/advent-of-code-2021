
def check_depths(depths)
    coll_1 = []
    coll_2 = []
    increases = 0
    depths.each do |depth|
        num = depth.to_i          
        if depths.lineno == 1
            coll_1.push(num)
            next
        elsif depths.lineno <= 3
            coll_1.push(num)
            coll_2.push(num)
            next        
        end

        coll_2.push(num)
      
        sum_2 = 0
        coll_2.each {|depth| sum_2 = sum_2 + depth}
        sum_1 = 0
        coll_1.each {|depth| sum_1 = sum_1 + depth}

        puts "sum 2: #{sum_2}, sum 1: #{sum_1}"

        increases = increases + (sum_2 > sum_1 ? 1 : 0)

        coll_1 = coll_2.clone
        coll_2.shift
    end
    puts "#{increases} increases"
end

def read_input
    File.open('input.txt', 'r') do |f|
       check_depths(f)
    end
end


read_input