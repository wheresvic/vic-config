var winston = require('winston');

var logger = new(winston.Logger)({
  transports: [
    // new (winston.transports.Console)({ level: 'debug', timestamp: function() { return '111111111'; }, colorize: true })
    new(winston.transports.Console)({ level: 'debug', timestamp: true, colorize: true })
    //
    // ,
    // new (winston.transports.File)({ filename: 'somefile.log', level: 'error' })
  ]
});

exports.logger = logger;
