import pymysql

def conexion():
  # GENERANDO CONEXIÓN
  return pymysql.connect(
    host='db', 
    user='root',
    password='password',
    database='bd_agenda_eventos'
  ) 
  
# FUNCIÓN REGISTRAR USUARIO
def registrar_usuario(nombre_usuario, correo_usuario, contrasena_usuario):
    conex = conexion()
    with conex.cursor() as cursor:
      cursor.execute("INSERT INTO usuarios(nombre_usuario, correo_usuario, contrasena_usuario) VALUES (%s, %s, %s)", (nombre_usuario, correo_usuario, contrasena_usuario))
      conex.commit()
      conex.close()

# FUNCIÓN OBTENER UN USUARIO
def obtener_usuario(correo_usuario):
  conex = conexion()
  usuario = None
  with conex.cursor() as cursor:
    cursor.execute("SELECT id_usuario, nombre_usuario, correo_usuario, contrasena_usuario FROM usuarios WHERE correo_usuario = %s",(correo_usuario))
    usuario = cursor.fetchone()
    conex.close()
    return usuario   

# FUNCIÓN GUARDAR EVENTO
def insertar_evento(nombre_evento, fecha_evento, lugar_evento, modalidad_evento, id_usuario):
  conex = conexion()
  with conex.cursor() as cursor:
    cursor.execute("INSERT INTO eventos(nombre_evento, fecha_evento, lugar_evento, modalidad_evento, id_usuario) VALUES (%s, %s, %s, %s, %s)", (nombre_evento, fecha_evento, lugar_evento, modalidad_evento, id_usuario))
    conex.commit()
    conex.close()

# FUNCIÓN LISTAR EVENTO
def listar_eventos(id_usuario):
  conex = conexion()
  eventos = []
  with conex.cursor() as cursor:
    cursor.execute("SELECT id_evento, nombre_evento, fecha_evento, lugar_evento, modalidad_evento FROM eventos WHERE id_usuario = %s ORDER BY fecha_evento ASC",(id_usuario))
    eventos = cursor.fetchall()
    conex.close()
    return eventos

# FUNCIÓN ELIMINAR EVENTO    
def eliminar_evento(id_evento):
  conex = conexion()
  with conex.cursor() as cursor:
    cursor.execute("DELETE FROM eventos WHERE id_evento = %s",(id_evento))
    conex.commit()
    conex.close()

# FUNCIÓN OBTENER UN EVENTO
def obtener_evento(id_evento):
  conex = conexion()
  evento = None
  with conex.cursor() as cursor:
    cursor.execute("SELECT id_evento, nombre_evento, fecha_evento, lugar_evento, modalidad_evento FROM eventos WHERE id_evento = %s",(id_evento))
    evento = cursor.fetchone()
    conex.close()
    return evento

# FUNCIÓN ACTUALIZAR EVENTO
def actualizar_evento(id_evento, nombre_evento, fecha_evento, lugar_evento, modalidad_evento, id_usuario):
  conex = conexion()
  with conex.cursor() as cursor:
    cursor.execute("UPDATE eventos SET nombre_evento = %s, fecha_evento = %s, lugar_evento = %s, modalidad_evento = %s, id_usuario = %s WHERE id_evento = %s",(nombre_evento, fecha_evento, lugar_evento, modalidad_evento, id_usuario, id_evento))
    conex.commit()
    conex.close()
   
