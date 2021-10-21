import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Capitanes {
  String _Nombre;

  Capitanes(this._Nombre);

  getNombre() {
    return _Nombre;
  }
}
