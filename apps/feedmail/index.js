#!/usr/bin/env /home/victor/.nvm/versions/node/v6.9.0/bin/node

var feedparser = require('feedparser-promised');
var program = require('commander');

var logger = require('./logger.js').logger;

program
  .version('1.0.0')
  .option('-u, --email-username [username]', 'Email username')
  .option('-p, --email-password [password]', 'Email password')
  .option('-t, --to-email [to]', 'To email')
  // .option('-c, --cheese [type]', 'Add the specified type of cheese [marble]', 'marble')
  .parse(process.argv);

var url = program.args[0];
var toEmailAddress = program.toEmail;

var emailerOptions = {
  username: program.emailUsername,
  password: program.emailPassword
};

var emailer = require('./emailer')(logger, emailerOptions);

feedparser.parse(url).then(items => {
    if (items.length) {
      var title = items[0].title;
      var htmlContent = items[0].description;

      logger.debug(title);

      if (toEmailAddress) {
        emailer.sendEmail(toEmailAddress, title, '', htmlContent, function(err, info) {
          if (err) {
            logger.error(err);
            return;
          }

          logger.info(info);
        });
      }
    }
  })
  .catch(err => {
    logger.error(err);
  });

// console.log(url);
