import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class scanQR extends StatefulWidget {
  const scanQR({super.key});

  @override
  State<scanQR> createState() => _scanQRState();
}

class _scanQRState extends State<scanQR> {
  String qrcoderesult = "not yet Scanned";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('scan QR Code'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'result',
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            qrcoderesult,
            style: TextStyle(fontSize: 20.0),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () async {
              String barcodeScanRes;

              try {
                barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                    '#000000', 'Cancel', true, ScanMode.QR);
                print(barcodeScanRes);
              } on PlatformException {
                barcodeScanRes = 'Failed to get platform version.';
              }
              setState(() {
                qrcoderesult = barcodeScanRes;
              });
            },
            child: Text(
              'open scanner',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(shape: StadiumBorder()),
          )
        ],
      )),
    );
  }
}
