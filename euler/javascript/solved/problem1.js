// If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
// Find the sum of all the multiples of 3 or 5 below 1000.

function sumOfMultiples(limit, multiples){
  let sum = 0;
  
  for(let i = 0; i < limit; i++){
    if(multiples.some(multiple => i % multiple === 0)){
      sum += i;
    }
  }
  
  return sum;
}

console.log(`The sum of multiple of 3 and 5 under 10 is ${sumOfMultiples(10, [5, 3])}.`);
console.log(`The sum of multiple of 3 and 5 under 1000 is ${sumOfMultiples(1000, [5, 3])}.`);