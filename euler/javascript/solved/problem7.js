// By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

// What is the 10 001st prime number?

function getPrime(ordinal){
  let primes = [2];
  let candidate = 3;
  while(primes.length < ordinal){
    if(primes.every(prime => candidate % prime !== 0)){
      primes.push(candidate);
    }
    candidate += 2;
  }

  return primes[primes.length - 1];
}

console.log(`The 6th prime is ${getPrime(6)}.`);
console.log(`The 10,001st prime is ${getPrime(10001)}`);