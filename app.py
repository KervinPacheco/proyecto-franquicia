from flask import Flask, render_template
from flask_mysqldb import MySQL
from flask import jsonify, request
from config import config

app= Flask(__name__)


conexion=MySQL(app)
#------------Consultar todos los datos de la tabla cargos
@app.route("/cliente", methods=['GET'])
def cliente_consulta():
    try:
        cursor=conexion.connection.cursor()
        sql="SELECT id, cargo, salario FROM cargos"
        cursor.execute(sql)
        datos=cursor.fetchall()
        cargos= []
        for fila in datos:
            cargo={'id':fila[0],'cargo':fila[1],'salario':fila[2]}
            cargos.append(cargo)
        return jsonify({'cargos':cargos,'message':"Cargos encontrados"})
    except Exception as ex:
        return jsonify({'message':"No se ha encontrado los cargos"})

#-------------Filtrar la consulta por su llave primaria
@app.route('/cliente/<id>')
def ver_cargos(id):
    try:
        cursor = conexion.connection.cursor()
        sql= "SELECT id, cargo, salario FROM cargos WHERE id='{0}'".format(id)
        cursor.execute(sql)
        datos=cursor.fetchone()
        if datos != None:
            cargo={'id':datos[0],'cargo':datos[1],'salario':datos[2]}
            return jsonify({'cargo':cargo, 'message':"Cargo encontrado"})
        else:
            return jsonify({'message':"No se ha encontrado el cargo"}) 
    except Exception as ex:
            return jsonify({"message": "Product not found"}), 404

#----------------Agregar datos en la tabla cargos
@app.route("/cliente", methods = ['POST'])
def regis_cargos():
    try:
        cursor=conexion.connection.cursor()
        sql="INSERT INTO cargos (id,cargo,salario) VALUES ('{0}','{1}','{2}')".format(request.json['id'],request.json['cargo'],request.json['salario'])
        cursor.execute(sql)
        conexion.connection.commit()#
        return jsonify({"message":"Agregado exitosamente !)"})
    except Exception as ex:
        return jsonify({"message": "Product not found"}), 404

#-----------------Eliminar una fila de la tabla cargos
@app.route('/cliente/<id>', methods=['DELETE'])
def del_cargo(id):
    try:
        cursor = conexion.connection.cursor()
        sql= "DELETE FROM cargos WHERE id = '{0}'".format(id)
        cursor.execute(sql)
        conexion.connection.commit()
        return jsonify({'message':"cargo eliminado"}) 
    except Exception as ex:
            return jsonify({"message": "Product not found"}), 404

if __name__ == "__main__":
    app.config.from_object(config['development'])
    app.run()

