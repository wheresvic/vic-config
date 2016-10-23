const feedparser = require('feedparser-promised');
const program = require('commander');

program
  .version('1.0.0')
  // .option('-u, --peppers', 'Add peppers')
  // .option('-P, --pineapple', 'Add pineapple')
  // .option('-b, --bbq-sauce', 'Add bbq sauce')
  // .option('-c, --cheese [type]', 'Add the specified type of cheese [marble]', 'marble')
  .parse(process.argv);

const url = process.argv[2];

feedparser.parse(url).then((items) => {
    if (items.length) {
      console.log(items[0].description);
    }
  })
  .catch((error) => {
    console.log(error);
  });

// console.log(url);
