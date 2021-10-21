import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:parcial3_flutter/UI/InformationView.dart';
import 'package:parcial3_flutter/UI/Screen.dart';
import 'package:parcial3_flutter/models/Equipo.dart';

class ListViewEquipo extends StatefulWidget {
  @override
  _ListViewEquipoState createState() => _ListViewEquipoState();
}

final equipoReference = FirebaseDatabase.instance.reference().child('Equipo');

class _ListViewEquipoState extends State<ListViewEquipo> {
  List<Equipo> items = [];
  StreamSubscription<Event> _onEquipoAddedSubscription;
  StreamSubscription<Event> _onEquipoChangedSubscription;

  @override
  void initState() {
    super.initState();
    items = new List();
    _onEquipoAddedSubscription =
        equipoReference.onChildAdded.listen(_onEquipoAddedSubscription);
    _onEquipoChangedSubscription =
        equipoReference.onChildChanged.listen(_onEquipoChangedSubscription);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _onEquipoAddedSubscription.cancel();
    _onEquipoChangedSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Datos de Equipos',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Datos de Equipos'),
              centerTitle: true,
            ),
            body: Center(
              child: ListView.builder(
                  itemCount: items.length,
                  padding: EdgeInsets.only(top: 12),
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget> [
                        Divider(height: 7),
                        Row(
                          children: <Widget> [
                            Expanded(child: ListTile(title: Text('${items[index].getNombre()}', style: TextStyle(fontSize: 20)), subtitle: Text('${items[index].getNombreEstadio()}', style: TextStyle(fontSize: 14)),))
                          ],
                        )
                      ],
                    )
                  }),
            )));
  }
}
