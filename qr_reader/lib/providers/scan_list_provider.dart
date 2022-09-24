
import 'package:flutter/material.dart';
import 'package:qr_reader/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {

  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  Future<ScanModel> nuevoScan(String valor) async {

    final nuevoScan = ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    nuevoScan.id = id;

    if(tipoSeleccionado == nuevoScan.tipo){
      scans.add(nuevoScan);
      notifyListeners();
    }

    return nuevoScan;

  }

  cargarScans() async {
    scans = (await DBProvider.db.getAllScans())!;
    // scans = [...?scans];
    notifyListeners();
  }

  cargarScansPorTipo(String tipo) async {
    scans = (await DBProvider.db.getScansByType(tipo))!;
    // scans = [...scans];
    tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodo() async {
    await DBProvider.db.deleteAllScan();
    scans = [];
    notifyListeners();
  }

  borrarScansPorId(int id) async {
    await DBProvider.db.deleteScan(id);
  }

}