function madLib(verb, adjective, noun) {
  return `We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}`;
}

// console.log(madLib('make', 'best', 'guac'));

function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}

// console.log(isSubstring('time to program','time'));
// console.log(isSubstring('time to program', 'goof off'));

function fizzBuzz(array) {
  var goodNums = [];
  function divs(num) {
    if (num % 3 === 0 && num % 5 !== 0) {
      goodNums.push(num);
    }
    else if (num % 5 === 0 && num % 3 !== 0) {
      goodNums.push(num);
    }
  }
  array.forEach(function(num) {
    divs(num);
  });
  console.log(goodNums);
}

// fizzBuzz([1,2,3,4,5,6,7,15]);

function isPrime(num) {
  for (var i = 2; i <= num / 2; i ++) {
    if (num % i === 0) {
      return false;
    }
  }
  return true;
}

// console.log(isPrime(17));
// console.log(isPrime(50));
// console.log(isPrime(2));


function sumOfNPrimes(n) {
  var sum = 0;
  var count = 1;
  var i = 2;
  while (count <= n) {
    if (isPrime(i)) {
      sum += i;
      count ++;
    }
    i ++;
  }
  return sum;
}

// console.log(sumOfNPrimes(0));
// console.log(sumOfNPrimes(4));
// console.log(sumOfNPrimes(1));

function allOrNothing(mod, ...nums) {
  for (var i = 0; i < nums.length; i++) {
    if (nums[i] % mod !== 0) {
      return false;
    }
  }
  return true;
}

console.log(allOrNothing(3,9,12,6));
console.log(allOrNothing(5,1,2,10));
