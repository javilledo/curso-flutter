import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/direcciones_page.dart';
import 'package:qr_reader/pages/mapas_page.dart';
import 'package:qr_reader/providers/db_provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import 'package:qr_reader/widgets/custom_navigation_bar.dart';
import 'package:qr_reader/widgets/scan_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        actions: [
          IconButton(onPressed: () {
            Provider.of<ScanListProvider>(context, listen: false).borrarTodo();
          }, 
          icon: const Icon(Icons.delete_forever))
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _HomePageBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    final tempScan = ScanModel(valor: 'https://www.google.com');
    // DBProvider.db.nuevoScan(tempScan);
    // DBProvider.db.getScanById(1).then((res) => print(res?.valor));
    // DBProvider.db.getAllScans().then((res) => print(res));
    // DBProvider.db.updateScan(ScanModel(id: 5, valor: '88')).then((res) => print(res));
    // DBProvider.db.getScanById(1).then((res) => print(res?.valor));

    //Usar la scanListProvider
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

    switch(currentIndex){

      case 0: 
        scanListProvider.cargarScansPorTipo('geo');
        return const MapasPage();

      case 1: 
        scanListProvider.cargarScansPorTipo('http');
        return const DireccionesPage();

      default: return const MapasPage();
    }

  }
}
