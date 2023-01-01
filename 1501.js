let fs = require('fs')
let input = fs.readFileSync('_inputs_/1501.1').toString().trim().split('')
let res = input.reduce((flr, c) => c == '(' ? ++flr : --flr, 0)
let flr = 0
let res2 = input.map(c => c == '(' ? ++flr : --flr).indexOf(-1) + 1
console.log(res, res2)
