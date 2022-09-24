import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/utils/utils.dart';

import '../providers/scan_list_provider.dart';

class ScanTiles extends StatelessWidget {
  const ScanTiles({super.key, required this.tipo});

  final String tipo;

  @override
  Widget build(BuildContext context) {
    
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (BuildContext context, int index) => Dismissible(
        key: UniqueKey(),
        background: Container(color: Colors.red),
        onDismissed: (DismissDirection direction){
          scanListProvider.borrarScansPorId(scans[index].id!);
        },
        child: ListTile(
          leading: Icon(
            tipo == 'http' ? Icons.home : Icons.map_outlined, 
            color: Theme.of(context).primaryColor),
          title: Text(scans[index].valor),
          subtitle: Text('Id: ${scans[index].id}, Tipo: ${scans[index].tipo}'),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
          onTap: () => launchURL(context, scans[index]),
        ),
      )
    );
  }
}
