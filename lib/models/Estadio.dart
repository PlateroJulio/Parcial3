import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:parcial3_flutter/models/Coordenadas.dart';

class Estadio {
  String _Nombre;
  int _Capacidad;
  Coordinadas _coordinadas;

  Estadio(this._Nombre, this._Capacidad, this._coordinadas);
}
