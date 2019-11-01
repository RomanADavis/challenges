// A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

// Find the largest palindrome made from the product of two 3-digit numbers.

function isPalindrome(number){
  let backwards = number.toString().split('').reverse().join('');
  return number.toString() === backwards;
}

function largestMultiple(xMax, yMax, condition){
  max = 0; // assumes x and y are positive
  for(var x = 1; x <= xMax; x++){
    for(var y = 1; y <= yMax; y++){
      if(x * y > max && condition(x * y)){
        max = x * y;
      }
    }
  }
  return max;
}

console.log(`The largest palindrome product of two 2-digit numbers is ${largestMultiple(99, 99, isPalindrome)}.`);
console.log(`The largest palindrome product of two 3-digit numbers is ${largestMultiple(999, 999, isPalindrome)}.`);