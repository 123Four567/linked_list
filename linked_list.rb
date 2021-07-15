class Node
    attr_accessor :value, :next_node

    def initialize(value=nil, next_node=nil)
        @value = value
        @next_node = next_node
    end

end

class LinkedList

    attr_accessor :head, :tail

    def initialize
        @head = nil
        @tail = nil
    end

    def append(value)
        current_node = Node.new(value)
        if @head == nil
            @head = current_node
        else
            tmp = @head
            while tmp.next_node != nil
                tmp = tmp.next_node
            end
            tmp.next_node = current_node
        end
        @tail = current_node
    end

    def prepend(value)
        current_node = Node.new(value, @head)
        @head = current_node
    end

    def size
        current_node = @head
        counter = 0
        until current_node == nil
            counter += 1 
            current_node = current_node.next_node
        end
        counter
    end

    def head
        "The head node is:#{@head.value}"
    end

    def tail
        "The tail node is:#{@tail.value}"
    end

    def at(index)
        current_node = @head
        index.times do
            current_node = current_node.next_node
        end
        current_node
    end

    def pop
        current_node = @head
        until current_node.next_node == @tail
            current_node = current_node.next_node
        end
        current_node.next_node = nil
        @tail = current_node
    end

    def contains?(value)
        current_node = @head
        exist = false
        until current_node == nil
            exist = true if current_node.value == value
            current_node = current_node.next_node
        end 
        exist
    end

    def find(value)
        index = 0
        current_node = @head
        found = false
        until current_node == nil
            found = true if current_node.value == value
            break if current_node.value == value
            index += 1 
            current_node = current_node.next_node
        end
    end

    def to_s
        current_node = @head
        until current_node == nil
            puts "{ #{current_node.value} } ->"
            current_node = current_node.next_node
        end
        puts "nil"
    end

end

list = LinkedList.new

list.append(67)

list.prepend(23)

list.append("kill all humans")

list.head

list.tail

list.at(2)

list.size

list.find(67)

list.contains?(100)

list.to_s

list.pop