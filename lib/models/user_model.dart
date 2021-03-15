import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.nombre,
    this.apellido,
    this.nacimiento,
    this.usuario,
    this.nit,
    this.contacto,
    this.imagen,
    this.email,
    this.password,
    this.estado,
    this.tipo,
    this.genero,
    this.noti,
  });

  int id;
  String nombre;
  String apellido;
  dynamic nacimiento;
  String usuario;
  String nit;
  String contacto;
  dynamic imagen;
  dynamic email;
  String password;
  String estado;
  String tipo;
  String genero;
  List<Noti> noti;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        nacimiento: json["nacimiento"],
        usuario: json["usuario"],
        nit: json["nit"],
        contacto: json["contacto"],
        imagen: json["imagen"],
        email: json["email"],
        password: json["password"],
        estado: json["estado"],
        tipo: json["tipo"],
        genero: json["genero"],
        noti: List<Noti>.from(json["noti"].map((x) => Noti.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "nacimiento": nacimiento,
        "usuario": usuario,
        "nit": nit,
        "contacto": contacto,
        "imagen": imagen,
        "email": email,
        "password": password,
        "estado": estado,
        "tipo": tipo,
        "genero": genero,
        "noti": List<dynamic>.from(noti.map((x) => x.toJson())),
      };
}

class Noti {
  Noti({
    this.id,
    this.idsolicitud,
    this.idasignartrabajo,
    this.idusuarioenviado,
    this.idusuariorecibido,
    this.mensaje,
    this.tipo,
    this.estado,
    this.fecha,
    this.hora,
  });

  int id;
  int idsolicitud;
  int idasignartrabajo;
  int idusuarioenviado;
  int idusuariorecibido;
  String mensaje;
  String tipo;
  String estado;
  String fecha;
  String hora;

  factory Noti.fromJson(Map<String, dynamic> json) => Noti(
        id: json["id"],
        idsolicitud: json["idsolicitud"],
        idasignartrabajo: json["idasignartrabajo"],
        idusuarioenviado: json["idusuarioenviado"],
        idusuariorecibido: json["idusuariorecibido"],
        mensaje: json["mensaje"],
        tipo: json["tipo"],
        estado: json["estado"],
        fecha: json["fecha"],
        hora: json["hora"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idsolicitud": idsolicitud,
        "idasignartrabajo": idasignartrabajo,
        "idusuarioenviado": idusuarioenviado,
        "idusuariorecibido": idusuariorecibido,
        "mensaje": mensaje,
        "tipo": tipo,
        "estado": estado,
        "fecha": fecha,
        "hora": hora,
      };
}
