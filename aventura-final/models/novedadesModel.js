var pool = require('./bd');

/*para listar novedades:*/
async function getNovedades(){
        var query = 'select * from novedades';
        var rows = await pool.query(query);
       return rows;
}

/*para borrar novedades por id:*/
async function deleteNovedadesById(id){
        var query = 'delete from novedades where id = ?';
        var rows = await pool.query(query, [id]);
       return rows;
}

async function insertNovedad(obj){
        try{
        var query = 'insert into novedades set ?';
        var rows = await pool.query(query, [obj]) /*es un array tiene varios datos */
       return rows;
} catch (error){
        console.log (error);
        throw error;
}       
}

/*para q me traiga la novedad por id*/
async function getNovedadById(id){
        var query = 'select * from novedades where id = ? ';
        var rows = await pool.query(query, [id]); 
       return rows [0];
}       
/* para modificarla */
async function modificarNovedadesById(obj, id){
        try{
        var query = 'update novedades set ? where id = ? ';
        var rows = await pool.query(query, [obj, id]); 
       return rows [0];
}  catch(error) {
        throw error;
}
}
/*para buscar en el administrador*/
async function buscarNovedades(busqueda){
        var query = 'select * from novedades where titulo like ? OR cuerpo like ?';
        var rows = await pool.query(query, ['% '+ busqueda + '%','% '+ busqueda + '%' ]); 
       return rows;
}  

module.exports = {getNovedades,deleteNovedadesById, insertNovedad, getNovedadById, modificarNovedadesById, buscarNovedades}