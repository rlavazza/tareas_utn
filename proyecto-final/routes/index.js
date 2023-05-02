var express = require('express');
var router = express.Router();
var nodemailer = require('nodemailer');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index',);
});

router.post('/', async(req, res, next) => {
  console.log(req.body)
  var nombre = req.body.nombre;
  var email = req.body.email;
  var tel = req.body.tel;
  var mensaje = req.body.mensaje;

  var obj ={
    to: 'rlavazza@gmail.com', 
    subject: 'Contacto desde la web',
    html: nombre + "se contactó a través de la web y requiere información  a este correo: " + email + ". <br> Dejó el siguiente comentario: " + mensaje + " <br>Su teléfono es: " + tel
  } 

  var transport = nodemailer.createTransport({
    host: process.env.SMTP_HOST,
    port: process.env.SMTP_PORT,
auth:{
  user: process.env.SMTP_USER,
  pass: process.env.SMTP_PASS
}

});
var info = await transport.sendMail(obj);
res.render('/',{
  message: 'Mensaje enviado'
});
});

module.exports = router;
