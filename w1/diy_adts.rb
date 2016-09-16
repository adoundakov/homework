# Exercise 1: Stack
class Stack
  def initialize
    @store = {}
  end

  def add(el)
    @store[el] = true unless @store[el]
  end

  def remove(el)
    @store.delete(el)
  end

  def show
    @store.keys
  end
end

# Exercise 2: Queue

class Queue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store.unshift(el)
  end

  def dequeue
    @store.pop
  end

  def show
    @store
  end
end

# Exercise 3: Map

class Map
  def initialize
    @store = []
  end

  def assign(key, value)
    remove(key) if exists?(key)
    @store << [key, value]
  end

  def lookup(key)
    @store.each do |pair|
      k, v = pair
      return v if k == key
    end
  end

  def remove(key)
    tgt = nil
    @store.each_with_index do |pair, index|
      k, v = pair
      tgt = index if k == key
    end

    @store.delete_at(tgt) if tgt
  end

  def show
    @store
  end

  def exists?(key)
    @store.any? { |pair| pair[0] == key }
  end
end
