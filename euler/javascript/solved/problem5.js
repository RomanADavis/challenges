// 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

// What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

function smallestMultiple(values){
  let result = values.reduce((total, value) => total * value);
  values = values.filter(value => value !== 1) // eliminates 1, since it's useless
  values.forEach(value => {
    while(values.every(v => (result / value) % v === 0)){ // eliminates extra multiples
      result = result / value;
    }
  });

  return result;
}

function upTo(max){
  var range = [];
  for(var i = 1; i < max; i++){
    range.push(i);
  }
  return range;
}

console.log(`The smallest multiple of 1 through 10 is ${smallestMultiple(upTo(10))}.`);
console.log(`The smallest multiple of 1 through 20 is ${smallestMultiple(upTo(20))}`);