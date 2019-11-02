// The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

// Find the sum of all the primes below two million.

function sumOfPrimesUnder(max){
  let total = 2; // Slightly sloppy, assumes numbers over 2.
  let primes = [2]
  let candidate = 3;
  while(candidate < max){
    let isPrime = true;
    for(let i = 0, prime = primes[0]; i < primes.length && prime * prime <= candidate; i++, prime = primes[i]){
      if(candidate % prime === 0){
        isPrime = false;
        break;
      }
    }
    if(isPrime){
      total += candidate;
      if(candidate * candidate < max){
        primes.push(candidate);
      }
    }
    candidate += 2;
  }
  return total;
}

console.log(`The sum of primes under 10 is ${sumOfPrimesUnder(10)}.`);
console.log(`The sum of primes under 2 million is ${sumOfPrimesUnder(2000000)}.`);