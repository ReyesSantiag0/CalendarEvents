import pymysql

def conexion():
  return pymysql.connect(
    host='localhost',
    user='root',
    password='',
    database='bd_agenda_eventos'
  )
  
def registrar_usuario(nombre_usuario, correo_usuario, contrasena_usuario):
    conex = conexion()
    with conex.cursor() as cursor:
      cursor.execute("INSERT INTO usuarios(nombre_usuario, correo_usuario, contrasena_usuario) VALUES (%s, %s, %s)", (nombre_usuario, correo_usuario, contrasena_usuario))
      conex.commit()
      conex.close()

def obtener_usuario(correo_usuario):
  conex = conexion()
  usuario = None
  with conex.cursor() as cursor:
    cursor.execute("SELECT id_usuario, nombre_usuario, correo_usuario, contrasena_usuario FROM usuarios WHERE correo_usuario = %s",(correo_usuario))
    usuario = cursor.fetchone()
    conex.close()
    return usuario   
  
def insertar_evento(nombre_evento, fecha_evento, lugar_evento, modalidad_evento, id_usuario):
  conex = conexion()
  with conex.cursor() as cursor:
    cursor.execute("INSERT INTO eventos(nombre_evento, fecha_evento, lugar_evento, modalidad_evento, id_usuario) VALUES (%s, %s, %s, %s, %s)", (nombre_evento, fecha_evento, lugar_evento, modalidad_evento, id_usuario))
    conex.commit()
    conex.close()

def listar_eventos(id_usuario):
  conex = conexion()
  eventos = []
  with conex.cursor() as cursor:
    cursor.execute("SELECT id_evento, nombre_evento, fecha_evento, lugar_evento, modalidad_evento FROM eventos WHERE id_usuario = %s ORDER BY fecha_evento ASC",(id_usuario))
    eventos = cursor.fetchall()
    conex.close()
    return eventos
    
def eliminar_evento(id_evento):
  conex = conexion()
  with conex.cursor() as cursor:
    cursor.execute("DELETE FROM eventos WHERE id_evento = %s",(id_evento))
    conex.commit()
    conex.close()
   
def obtener_evento(id_evento):
  conex = conexion()
  evento = None
  with conex.cursor() as cursor:
    cursor.execute("SELECT id_evento, nombre_evento, fecha_evento, lugar_evento, modalidad_evento FROM eventos WHERE id_evento = %s",(id_evento))
    evento = cursor.fetchone()
    conex.close()
    return evento

def actualizar_evento(id_evento, nombre_evento, fecha_evento, lugar_evento, modalidad_evento, id_usuario):
  conex = conexion()
  with conex.cursor() as cursor:
    cursor.execute("UPDATE eventos SET nombre_evento = %s, fecha_evento = %s, lugar_evento = %s, modalidad_evento = %s, id_usuario = %s WHERE id_evento = %s",(nombre_evento, fecha_evento, lugar_evento, modalidad_evento, id_usuario, id_evento))
    conex.commit()
    conex.close()
   
