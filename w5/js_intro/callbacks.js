function makeTime() {
  window.setTimeout(() => alert('HAMMERTIME'), 5000);
}

function hammerTime(time) {
  window.setTimeout((time) => alert(`${time} is hammertime!`), time);
}

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.question("Would you like some tea?", function (answer) {
  console.log(`Yay`);
  reader.close();

});

console.log('wow end of file');
