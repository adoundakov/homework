function madLib(verb, adjective, noun) {
  return `We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}`;
}

console.log(madLib('make', 'best', 'guac'));

function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}

console.log(isSubstring('time to program','time'));
console.log(isSubstring('time to program', 'goof off'));

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

fizzBuzz([1,2,3,4,5,6,7,15]);
