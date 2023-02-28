// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future pdfTestResults(
    String dmlLogo,
    String companyInfo,
    String ticketTitle,
    String vehicleReg,
    String scheduledDateString,
    String customerName,
    String customerAddress,
    String testInfo,
    String customerContact) async {
  testInfo = testInfo ?? ' ';
  customerContact = customerContact ?? ' ';
  customerName = customerName ?? ' ';
  customerAddress = customerAddress ?? ' ';
  scheduledDateString = scheduledDateString ?? ' ';
  final pdf = pw.Document();
  final image = await networkImage(dmlLogo);
  /*final image = pw.MemoryImage(
    File(cimTechLogo).readAsBytesSync(),
  );*/
  pw.PageTheme _buildTheme(
      PdfPageFormat pageFormat, pw.Font base, pw.Font bold, pw.Font italic) {
    return pw.PageTheme(
      pageFormat: pageFormat,
      theme: pw.ThemeData.withFont(
        base: base,
        bold: bold,
        italic: italic,
      ),
    );
  }

  pdf.addPage(pw.Page(
      pageTheme: _buildTheme(
        PdfPageFormat.a4,
        await PdfGoogleFonts.robotoRegular(),
        await PdfGoogleFonts.robotoBold(),
        await PdfGoogleFonts.robotoItalic(),
      ),
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(children: [
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              //pw.SizedBox(width: 10),
              pw.Image(image, width: 200),
              pw.Text(
                companyInfo,
                style: pw.TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          pw.Divider(thickness: 2),
          pw.Text("TEST RESULTS"),
          pw.SizedBox(height: 10),
          pw.Container(
            decoration: pw.BoxDecoration(
              borderRadius: const pw.BorderRadius.all(pw.Radius.circular(12)),
            ),
            padding: const pw.EdgeInsets.only(
                left: 0, top: 12, bottom: 12, right: 20),
            alignment: pw.Alignment.centerLeft,
            height: 70,
            child: pw.DefaultTextStyle(
              style: pw.TextStyle(
                fontSize: 12,
              ),
              child: pw.GridView(
                crossAxisCount: 1,
                children: [
                  pw.Text('Customer Name and Address'),
                  pw.Text(customerName),
                  pw.Text(customerAddress),
                ],
              ),
            ),
          ),
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              pw.Text('Contact Number  '),
              pw.Text('NUMBER HERE'),
            ],
          ),
          pw.Container(
            decoration: pw.BoxDecoration(),
            color: PdfColors.grey300,
            height: 50,
            alignment: pw.Alignment.centerLeft,
            child: pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text("Scheduled date"),
                pw.Text(scheduledDateString),
              ],
            ),
          ),
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text('todays date'),
              pw.Text('date '),
            ],
          ),
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              pw.Text('test Details  '),
              pw.Text(testInfo),
            ],
          ),
        ]);
      }));
  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save());
}
