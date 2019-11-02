// A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

// a^2 + b^2 = c^2
// For example, 3^2 + 4^2 = 9 + 16 = 25 = 52.

// There exists exactly one Pythagorean triplet for which a + b + c = 1000.
// Find the product abc.

function pythagoreanTriplet(total){
  for(let c = total / 2; c > 0; c--){
    for(let b = c - 1; b > 0; b--){
      let a = total - b - c;
      if(a * a + b * b === c * c){ // If pythagorean triple
        return [a, b, c]; // return triple
      }
    }
  }
  return -1; //  None found
}

console.log(`The only pythagorean triple where a + b + c = 1000 is ${pythagoreanTriplet(1000)}.`);
console.log(`Their product is ${pythagoreanTriplet(1000).reduce((total, side) => total * side)}`);