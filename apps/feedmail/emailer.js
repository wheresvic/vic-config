var nodemailer = require('nodemailer');
var validator = require('validator');

module.exports = function(logger, options) {

  var self = {};

  var transportUri = 'smtps://' + options.username + '%40gmail.com:' + options.password + '@smtp.gmail.com';
  var transporter = nodemailer.createTransport(transportUri);

  self.sendEmail = function(toAddress, subject, emailText, htmlText, callback) {

    logger.debug('sendEmail() toAddress %s ', toAddress);

    var isEmail = validator.isEmail(toAddress);

    if (!isEmail) {
      var err = {
        message: 'Provided email ' + toAddress + ' is not valid!',
        code: 1
      };
      callback(err, null);
      return;
    }

    var mailOptions = {
      from: 'xxx',
      to: toAddress,
      subject: subject,
      text: emailText,
      html: htmlText
    };

    transporter.sendMail(mailOptions, function(err, info) {

      if (err) {
        callback(err, null);
      } else {
        callback(null, info);
      }

      // if you don't want to use this transport object anymore, uncomment following line
      // smtpTransport.close(); // shut down the connection pool, no more messages
    });

  };

  return self;

};
