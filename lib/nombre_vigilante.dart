

// ignore: camel_case_types
class Nombres_api {
  dynamic? cedula;
  dynamic? nombre;
  dynamic? apellido;
  dynamic? correo;
  dynamic? avatar;
  dynamic? fecha;
 /** bool activo;
  String createdAt;
  String updatedAt;
  String? accessToken;
  String? refreshToken;*/
  
  Nombres_api(cedula, nombre, apellido, correo, avatar, fecha)  {
    this.cedula = cedula;
    this.nombre = nombre;
    this.apellido = apellido;
    this.correo = correo;
    this.avatar = avatar;
    this.fecha = fecha;
  //  required this.activo,
   //   required this.createdAt,
   //   required this.updatedAt,
   //   this.accessToken,
   //   this.refreshToken
  }
  Nombres_api.fromJson(Map<String, dynamic> json) {
    cedula = json['cedula'];
    nombre = json['nombre'];
    apellido = json['apellido'];
    correo = json['correo'];
    avatar = json['avatar'];
    fecha = json['fecha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cedula'] = this.cedula;
    data['nombre'] = this.nombre;
    data['apellido'] = this.apellido;
    data['correo'] = this.correo;
    data['avatar'] = this.avatar;
    data['fecha'] = this.fecha;
    return data;
  }

 /** factory Nombres_api.fromJson(Map json) {
    return Nombres_api(
        cedula: json["cedula"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        correo: json["correo"],
        avatar: json["avatar"],
        fecha: json["fecha"],
   //    
    );
  }*/

}

