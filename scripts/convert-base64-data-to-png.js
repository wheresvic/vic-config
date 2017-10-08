const fs = require('fs');

const data = fs.readFileSync('./base64-data.txt', {encoding: 'utf-8'});
const base64Data = data.replace(/^data:image\/png;base64,/, '');

fs.writeFileSync('out.png', base64Data, 'base64');
