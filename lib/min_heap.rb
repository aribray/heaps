require 'pry'

class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(log n)
  # Space Complexity: O(n)
  def add(key, value = key)
    node = HeapNode.new(key, value)
    @store << node
    i = @store.length-1
    heap_up(i)

  end

  # This method removes and returns an element from the heap
  # maintaining the heap structure
  # Time Complexity: O(log n)
  # Space Complexity: O(n)
  def remove()
    swap(-1, 0)
     i = 0
    minimum = @store.pop

    heap_down(i)

     return minimum.value
  end


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: O(1)
  # Space complexity: O(1)
  def empty?
    return true if @store[0].nil?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n)
  # Space complexity: O(n)
  def heap_up(index)
    while index > 0
      j = (index-1)/2
      if @store[index].key < @store[j].key
        swap(index, j)
        index = j
      else
        break
      end
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(i)
    while i < @store.length
          j = i*2 + 1; k = i*2 + 2; index = nil
            if @store[j] && @store[k]
              index = @store[j].key < @store[k].key ? j : k
              if @store[i].key > @store[index].key
                swap(i, index)
                i = index
              else
                break
              end
            elsif @store[j] && !@store[k]
              if @store[i].key > @store[j].key
                swap(j, i)
                i = j
              else
                break
              end
            elsif !@store[j]
              break
            end
         end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end