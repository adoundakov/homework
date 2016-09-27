class LRUArray
  def initialize(cache_size)
    @cache_size = cache_size
    @cache = []
  end

  def count
    @cache.size
  end

  def add(el)
    return el if @cache.last == el
    if @cache.include?(el)
      @cache.delete(el)
      @cache << el
    elsif count >= @cache_size
      @cache.shift
      @cache << el
    else
      @cache << el
    end
  end

  def show
    print @cache
  end
end

# array method works, but we need to make this better using LLists and Hash

class LList
  def initialize
    @head = LLNode.new('head','head', nil, nil)
    @tail = LLNode.new('tail','tail', @head, nil)
    @head.child = @tail
  end
end

class LLNode
  attr_accessor :key, :value, :parent, :child

  def initialize(key, value, parent = nil, child = nil)
    @key, @value = key, value
    @parent = parent
    @child = child
  end
end

# can use hash map where each key points to a node class, each node has a parent and a child.
# node has value, parent, child, key
# deleting things from cache is easy, just reassign nodes's parent's child
# to self.child, then child's parent to self.parent. Self will get garbage
# collected.delete key from hash.
# inserting is as simple as appending to tail of linked list
# looking up is easy as well, only thing is show would still be O(n)
# operation since you need to iterate through the whole linked list
