def sum_to(n)
  return 1 if n == 1
  n + sum_to(n-1)
end

def add_numbers(arr)
  return arr.first if arr.length <= 1
  arr.first + add_numbers(arr[1..-1])
end

def gamma_fnc(n)
  return 1 if n <= 2
  (n - 1) * gamma_fnc(n - 1)
end
