require_relative 'min_heap.rb'

# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heapsort(list)
  min_heap = MinHeap.new()
  until list.empty?
    min_heap.add(list.pop)
  end

  while !min_heap.empty?
    list << min_heap.remove()
  end

  return list
end
