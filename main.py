from flask import Flask, redirect, request, url_for, render_template, flash, session
from werkzeug.security import check_password_hash as checkph
from werkzeug.security import generate_password_hash as genph
import secrets
import base_datos

app = Flask(__name__)

secret_key = secrets.token_hex(24)
app.secret_key = secret_key

# @app.before_request
# def antes_de_acceso():
#   ruta = request.path
#   if not 'usuario' in session and ruta != '/inicio_sesion' and ruta != '/login' and ruta != '/salir' and ruta != '/registro_usuario' and ruta != "/registrar":
#     flash('Inicia sesión para continuar')
#     return redirect('/inicio_sesion')
  
@app.route('/')
@app.route('/inicio_sesion')
def inicio_sesion():
  return render_template('login.html')

@app.route('/login', methods=['POST'])
def login():
  correo_usuario = request.form['correo_usuario']
  contrasena_usuario = request.form['contrasena_usuario']
  try:
    usuario = base_datos.obtener_usuario(correo_usuario)
  except Exception as e:
    flash('Error al obtener el usuario')
  if usuario:
    if(checkph(usuario[3], contrasena_usuario)):
      session['usuario'] = correo_usuario
      return redirect('/eventos')
    else:
      flash('Acceso denegado')
      return redirect('/inicio_sesion')
  return redirect('/inicio_sesion')
        
@app.route('/salir')
def salir():
  session.pop('usuario', None)
  flash('Sesión cerrada')
  return redirect('/inicio_sesion')

@app.route('/registro_usuario')
def registro_usuario():
  return render_template('registro_usuario.html')

@app.route('/registrar_usuario', methods=['POST'])
def registrar_usuario():
    nombre_usuario = request.form['nombre_usuario']
    correo_usuario = request.form['correo_usuario']
    contrasena_usuario = request.form['contrasena_usuario']
    contrasena_usuario = genph(contrasena_usuario)
    try:
      base_datos.registrar_usuario(nombre_usuario, correo_usuario, contrasena_usuario)
      flash('Usuario registrado')
    except Exception as e:
      flash('Error al registrar usuario')
    finally:
      return redirect('/inicio_sesion')

@app.route('/agregar_evento')
def agregar_evento():
  return render_template('agregar_evento.html')

@app.route('/guardar_evento', methods=['POST'])
def guardar_evento():
  correo_usuario = session['usuario']
  nombre_evento = request.form['nombre_evento']
  fecha_evento = request.form['fecha_evento']
  lugar_evento = request.form['lugar_evento']
  modalidad_evento = request.form['modalidad_evento']
  usuario = base_datos.obtener_usuario(correo_usuario)
  id_usuario = usuario[0]
  base_datos.insertar_evento(nombre_evento, fecha_evento, lugar_evento, modalidad_evento,id_usuario)
  return redirect('/eventos')

@app.route('/eventos')
def eventos():
  correo_usuario = session['usuario']
  usuario = base_datos.obtener_usuario(correo_usuario)
  id_usuario = usuario[0]
  eventos = base_datos.listar_eventos(id_usuario)
  return render_template('eventos.html', eventos=eventos)

@app.route('/eliminar_evento', methods=['POST'])
def eliminar_evento():
  base_datos.eliminar_evento(request.form['id_evento'])
  return redirect('/eventos')

@app.route('/editar_evento/<int:id_evento>')
def editar_evento(id_evento):
  evento = base_datos.obtener_evento(id_evento)
  return render_template('editar_evento.html', evento=evento)

@app.route('/actualizar_evento', methods=['POST'])
def actualizar_evento():
  correo_usuario = session['usuario']
  id_evento = request.form['id_evento']
  nombre_evento = request.form['nombre_evento']
  fecha_evento = request.form['fecha_evento']
  lugar_evento = request.form['lugar_evento']
  modalidad_evento = request.form['modalidad_evento']
  usuario = base_datos.obtener_usuario(correo_usuario)
  id_usuario = usuario[0]
  base_datos.actualizar_evento(id_evento, nombre_evento, fecha_evento, lugar_evento, modalidad_evento, id_usuario)
  return redirect('/eventos')

if __name__ == '__main__':
  app.run(debug=True)