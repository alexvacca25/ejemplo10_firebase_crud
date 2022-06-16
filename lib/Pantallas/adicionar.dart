import 'package:ejemplo10_firebase_crud/peticiones/mensajeroshttp.dart';
import 'package:flutter/material.dart';

class AgregarMensajero extends StatefulWidget {
  @override
  _AgregarMensajeroState createState() => _AgregarMensajeroState();
}

class _AgregarMensajeroState extends State<AgregarMensajero> {
  TextEditingController controlNombre = TextEditingController();
  TextEditingController controlfoto = TextEditingController();
  TextEditingController controlplaca = TextEditingController();
  TextEditingController controltelefono = TextEditingController();
  TextEditingController controlwhatsapp = TextEditingController();
  TextEditingController controlmoto = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Mensajero"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              TextField(
                controller: controlNombre,
                decoration: InputDecoration(labelText: "Nombre"),
              ),
              TextField(
                controller: controlfoto,
                decoration: InputDecoration(labelText: "Foto"),
              ),
              TextField(
                controller: controlplaca,
                decoration: InputDecoration(labelText: "Apellido"),
              ),
              TextField(
                controller: controltelefono,
                decoration: InputDecoration(labelText: "direccion"),
              ),
              TextField(
                controller: controlwhatsapp,
                decoration: InputDecoration(labelText: "telefono"),
              ),
              TextField(
                controller: controlmoto,
                decoration: InputDecoration(labelText: "Ciudad"),
              ),
              ElevatedButton(
                child: Text("Modificar Mensajero"),
                onPressed: () {
                  var cliente = <String, dynamic>{
                    'nombrecliente': controlNombre.text,
                    'fotocliente': controlfoto.text,
                    'apellidocliente': controlplaca.text,
                    'direccioncliente': controltelefono.text,
                    'telefonocliente': controlwhatsapp.text,
                    'ciudadcliente': controlmoto.text,
                  };

                  Peticiones.crearcliente(cliente);

                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
