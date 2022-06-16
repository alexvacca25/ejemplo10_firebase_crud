import 'package:ejemplo10_firebase_crud/controller/firestore.dart';
import 'package:ejemplo10_firebase_crud/peticiones/mensajeroshttp.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'adicionar.dart';
import 'editar.dart';

class ListaMensajeros2 extends StatefulWidget {
  ListaMensajeros2({required this.title});
  final String title;

  @override
  _ListaMensajeros2State createState() => _ListaMensajeros2State();
}

class _ListaMensajeros2State extends State<ListaMensajeros2> {
  Peticiones2 controlp = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listados Mensajeros'),
        actions: [
          IconButton(
              tooltip: 'Adicionar Mensajero',
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AgregarMensajero()));
              })
        ],
      ),

      body: getInfo(context, controlp.readItems()),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            getInfo(context, controlp.readItems());
          });
        },
        tooltip: 'Refrescar',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

@override
Widget getInfo(BuildContext context, Stream<QuerySnapshot> ct) {
  return StreamBuilder(
    stream: ct,
    /*FirebaseFirestore.instance
        .collection('clientes')
        .snapshots(),*/ //En esta línea colocamos el el objeto Future que estará esperando una respuesta
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      print(snapshot.connectionState);
      switch (snapshot.connectionState) {

        //En este case estamos a la espera de la respuesta, mientras tanto mostraremos el loader
        case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());

        case ConnectionState.active:
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          // print(snapshot.data);
          return snapshot.data != null
              ? Vistamensajeros(mensajeros: snapshot.data!.docs)
              : Text('Sin Datos');

        /*
             Text(
              snapshot.data != null ?'ID: ${snapshot.data['id']}\nTitle: ${snapshot.data['title']}' : 'Vuelve a intentar', 
              style: TextStyle(color: Colors.black, fontSize: 20),);
            */

        default:
          return Text('Presiona el boton para recargar');
      }
    },
  );
}

class Vistamensajeros extends StatelessWidget {
  final List mensajeros;

  const Vistamensajeros({required this.mensajeros});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: mensajeros.length == 0 ? 0 : mensajeros.length,
        itemBuilder: (context, posicion) {
          print(mensajeros[posicion].id);
          return Card(
            elevation: 2,
            child: Container(
              padding: const EdgeInsets.only(
                  top: 4.0, bottom: 16.0, left: 8.0, right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(mensajeros[posicion]['fotocliente']),
                      ),
                      const SizedBox(
                        width: 14.0,
                      ),
                      Expanded(
                        child: Text(
                          'Alexander Vacca ',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      SizedBox(
                        width: 48.0,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text('Titulo'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Text('Detalle'),
                  ),
                ],
              ),
            ),
          );
          /* ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ModificarMensajero(
                          perfil: mensajeros,
                          pos: posicion,
                          iddoc: mensajeros[posicion].id)));
            },
            leading: Container(
              padding: EdgeInsets.all(5.0),
              width: 50,
              height: 50,
              child: Image.network(mensajeros[posicion]['fotocliente']),
            ),
            title: Text(mensajeros[posicion]['nombrecliente']),
            subtitle: Text(mensajeros[posicion]['apellidocliente']),
            trailing: Container(
              width: 80,
              height: 40,
              color: Colors.yellowAccent,
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(mensajeros[posicion]['telefonocliente']),
            ),
          );*/
        });
  }
}
