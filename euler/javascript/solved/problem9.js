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

function integer(number){
  return Math.floor(number) === number;
}

function whole(number){
  return integer(number) && number >= 0;
}

function euclidsTriplet(total){ // TODO: Add k
  // by Euclid's Formula (a + b + c / 2) = m (m + n)
  // m must be greater than n because a = m^2 - n^2, and a can't be negative
  for(let m = Math.ceil(Math.sqrt(total / 2) / 2); m * m < (total / 2); m++){
    let n = (total / 2 / m) - m;
    let a = m * m - n * n, b = 2 * m * n, c = m * m + n * n;
    if(whole(a) && whole(b) && whole(c)){
      return [a, b, c];
    }
  }
  return -1; // None found.
}
console.log(`The only pythagorean triple where a + b + c = 1000 is ${pythagoreanTriplet(1000)}.`);
console.log(`Their product is ${pythagoreanTriplet(1000).reduce((total, side) => total * side)}`);
console.log(`You can also use Euclid's Formula to make this faster: ${euclidsTriplet(1000)}`);