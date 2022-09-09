import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async {
        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancelar', false, ScanMode.QR);
        const barcodeScanRes = 'https://fernando-herrera.com';
        print(barcodeScanRes);
      }
      );
  }
}