// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
/*
class LePdf extends StatefulWidget {
  const LePdf({
    Key key,
    this.width,
    this.height,
    this.report,
    this.dMLInfo,
  }) : super(key: key);

  final double width;
  final double height;
  final ReportsRecord report;
  final DMLInfoRecord dMLInfo;
	//final image = (await rootBundle.load(dMLInfo.dMLLogo)).buffer.asUint8List();
  @override
  _LePdfState createState() => _LePdfState();
}

class _LePdfState extends State<LePdf> {
  static Future<File> generate(report,dMLInfo) async {
  final image = pw.MemoryImage(File(dMLInfo.dMLLogo).readAsBytesSync(),); 
  final pdf = pw.Document();
  pdf.addPage(MultiPage(
  	build: (context) => [
    	buildHeader(report,dMLInfo),
    ],
      footer: (context) => buildFooter(report),
    ));
    return saveDocument(name: 'my_report.pdf', pdf: pdf);
  }
  static Widget buildHeader(image, dMLInfo) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildDmlHeader(dMLInfo,image),
              
            ],
          ),
          SizedBox(height: 1 * PdfPageFormat.cm),
        ],
      );
  static Widget buildDmlHeader(DMLInfoRecord dMLInfo,MemoryImage image) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pw.Image(pw.MemoryImage(image), width: 150, height: 150, fit: pw.BoxFit.cover),
          Text('DMLaboratories', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text(dMLInfo.url.toString(),style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      );
  static Widget buildFooter(DMLInfoRecord dMLInfo) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(),
          SizedBox(height: 2 * PdfPageFormat.mm),
          Text(dMLInfo.footerReferences.join(' '), style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      );
	static Future<File> saveDocument({
    String name,
    Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
*/
