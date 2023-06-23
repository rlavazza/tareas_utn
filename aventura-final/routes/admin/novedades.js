var express = require('express');
var router = express.Router();
var novedadesModel= require('../../models/novedadesModel');

var util = require ('util');   
const { isUndefined } = require('util');
var cloudinary = require ('cloudinary').v2; 

const uploader = util.promisify(cloudinary.uploader.upload); 
const destroy = util.promisify(cloudinary.uploader.destroy); 

router.get('/', async function(req, res, next) {
  /*var novedades = await novedadesModel.getNovedades();-  reemplazado por la busqueda: */
 var novedades
 if (req.query.q === undefined) {
  novedades = await novedadesModel.getNovedades();
   } else {
    novedades = await novedadesModel.buscarNovedades(req.query.q);
   }  /*cierre if de  busqueda*/
 
  novedades = novedades.map ( novedad =>{  /*agrega array */
if (novedad.img_id) {
  const imagen = cloudinary.image ( novedad.img_id, {
width: 80,
height: 53,
crop: 'fill'
});
return {
 ... novedad, /*retorna titulo, cuerpo, precio */
  imagen
}
}else{
  return{
    ...novedad,
    imagen: ''
 }
}
 });
 res.render('admin/novedades',{
    layout:'admin/layout',
    empleado: req.session.nombre,
    novedades,
    is_search: req.query.q !== undefined,  
    q: req.query.q
  });
});


/*para eliminar una novedad de la base de datos:*/

router.get('/eliminar/:id', async(req, res, next) =>{
 const id = req.params.id;
 let novedad = await novedadesModel.getNovedadById(id); /*para eliminar img*/
 if (novedad.img_id){
  await (destroy(novedad.img_id));
 }
 await novedadesModel.deleteNovedadesById(id); /*elimina item completo*/
res.redirect('/admin/novedades')
});

/* para que aparesca el formulario agregar novedades*/

router.get ('/agregar', (req, res, next) =>{
  res.render('admin/agregar',{
    layout: 'admin/layout'
  });
});

/* para que guarde en la base de datos */

router.post('/agregar', async (req, res, next) =>{
  try{
    var img_id = "";
    if (req.files && Object.keys(req.files).length > 0){
      imagen = req.files.imagen;
      img_id = (await uploader (imagen.tempFilePath)).public_id;
       }

    if (req.body.titulo != "" && req.body.cuerpo != "" &&
     req.body.precio != "") {
    
      await novedadesModel.insertNovedad ({
       ...req.body,  /*los tres puntitos corresponden a tit,cuerpo,precio*/
        img_id
       }); 
      res.redirect('/admin/novedades')
        } else { 
      res.render('admin/agregar', {
        layout: 'admin/layout',
        error: true, 
        message: 'Debe completar los tres primeros campos'
      })
    }
  } catch (error) {
    console.log (error)
    res.render ('admin/agregar' ,{
      layout: 'admin/layout',
      error: true, 
      message: 'No se cargó la novedad'
       });
  }
      });

/*para  q muestre la novedad seleccionada*/
router.get('/modificar/:id' , async (req, res, next) =>{
var id = req.params.id;
var novedad = await novedadesModel.getNovedadById(id);
res.render ('admin/modificar',{
  layout: 'admin/layout',
  novedad
});
});

/*modificar la novedad*/

router.post ('/modificar', async (req, res, next) => {
    try {
      let img_id = req.body.img_original; /*agregado para modificar imagenes*/
      let borrar_img_vieja = false;
      if (req.body.img_delete === "1"){  
        img_id = null;                         
        borrar_img_vieja = true;
      }else{
        if (req.files && Object.keys(req.files).length > 0){
          imagen= req.files.imagen;    
          img_id = (await                    
            uploader (imagen.tempFilePath)).public_id;
            borrar_img_vieja=true;
        }
      } if (borrar_img_vieja && req.body.img_original){
        await (destroy(req.body.img_original));
      }
    var obj = {  /*modifica titulo, cuerpo, precio*/
  titulo:  req.body.titulo,
  cuerpo:  req.body.cuerpo,
  precio:  req.body.precio,
img_id
    }
   console.log (obj)
   await novedadesModel.modificarNovedadesById (obj, req.body.id);
   res.redirect ('/admin/novedades');
  }
  catch (error) {
    console.log (error)
     res.render('admin/modificar', {
    layout: 'admin/layout ',
    error: true,
     message : 'El item No fue modificado'
   })
  }
  });

module.exports = router;