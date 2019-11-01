// Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:

// 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

// By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

function fibSequence(callback){
  let sequence = []
  let a = 0, b = 1;
  while(callback(b, sequence.length)){
    [a, b] = [b, a + b];
    sequence.push(a);
  }
  return sequence;
}

console.log(`The first ten fibonacci numbers are ${fibSequence((_, length) => length < 11)}.`);
var  fibs;
console.log(`The fibonacci sequence for numbers under 4 million is ${fibs = fibSequence(max => max < 4e6)}.`);
var result = fibs.filter(value => value % 2 === 0).reduce((total, next) => total + next);
console.log(`By adding up the even numbers in the sequence, we get ${result}.`);