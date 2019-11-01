// The prime factors of 13195 are 5, 7, 13 and 29.

// What is the largest prime factor of the number 600851475143 ?

function primeFactors(number){
  var factor = 2, factors = [];
  while(number !== 1){
    if(number % factor === 0){
      factors.push(factor);
      while(number % factor === 0){
        number /= factor;
      }
    }
    factor = factor === 2 ? 3 : factor + 2;
  }
  return factors;
}

console.log(`The prime factors of 13195 are ${primeFactors(13195)}`);
console.log(`The largest prime factor of 600851475143 is ${primeFactors(600851475143).pop()}`);