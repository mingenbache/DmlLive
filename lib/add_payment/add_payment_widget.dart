import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPaymentWidget extends StatefulWidget {
  const AddPaymentWidget({
    Key? key,
    this.invoiceRef,
  }) : super(key: key);

  final DocumentReference? invoiceRef;

  @override
  _AddPaymentWidgetState createState() => _AddPaymentWidgetState();
}

class _AddPaymentWidgetState extends State<AddPaymentWidget>
    with TickerProviderStateMixin {
  PaymentsRecord? paymentRef;
  String? paymentMethodValue;
  TextEditingController? firstNameController;
  TextEditingController? lastNameController;
  TextEditingController? textController1;
  TextEditingController? transactionReferenceController;
  TextEditingController? paymentNotesController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    textController1 = TextEditingController();
    transactionReferenceController = TextEditingController();
    paymentNotesController = TextEditingController();
  }

  @override
  void dispose() {
    firstNameController?.dispose();
    lastNameController?.dispose();
    textController1?.dispose();
    transactionReferenceController?.dispose();
    paymentNotesController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Material(
              color: Colors.transparent,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(49),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryColor,
                  borderRadius: BorderRadius.circular(49),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 44, 20, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ADD PAYMENT',
                              style:
                                  FlutterFlowTheme.of(context).title1.override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                            ),
                            InkWell(
                              onTap: () async {
                                context.pop();
                              },
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  buttonSize: 48,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  icon: Icon(
                                    Icons.close_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 30,
                                  ),
                                  onPressed: () async {
                                    context.pop();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextFormField(
                          controller: textController1,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context)
                                .title1
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w300,
                                ),
                            hintText: 'Transaction Amount',
                            hintStyle: GoogleFonts.getFont(
                              'Roboto',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontWeight: FontWeight.w500,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primaryText,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primaryText,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Color(0x34FFFFFF),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 24, 24, 24),
                            prefixIcon: Icon(
                              Icons.money_sharp,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 32,
                            ),
                          ),
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Please enter an amount';
                            }

                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                                child: TextFormField(
                                  controller: firstNameController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'First Name',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    hintText: 'Enter your name here...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: Color(0x2BFFFFFF),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16, 24, 0, 24),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  maxLines: null,
                                  keyboardType: TextInputType.name,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                                child: TextFormField(
                                  controller: lastNameController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Last Name',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    hintText: 'Enter your name here...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: Color(0x2BFFFFFF),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16, 24, 0, 24),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  maxLines: null,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextFormField(
                            controller: transactionReferenceController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Transaction Reference',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                              hintStyle: GoogleFonts.getFont(
                                'Roboto',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Color(0x33FFFFFF),
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20, 24, 24, 24),
                            ),
                            style: GoogleFonts.getFont(
                              'Roboto',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            maxLines: null,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: FlutterFlowDropDown(
                          options: ['MPESA', 'Bank Transfer', 'Online Payment'],
                          onChanged: (val) =>
                              setState(() => paymentMethodValue = val),
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 60,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                          hintText: 'Payment Method',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: 15,
                          ),
                          fillColor: FlutterFlowTheme.of(context).primaryText,
                          elevation: 2,
                          borderColor: Color(0x00FFFFFF),
                          borderWidth: 2,
                          borderRadius: 8,
                          margin:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 12, 20),
                          hidesUnderline: true,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0x2BEEEEEE),
                          ),
                          child: TextFormField(
                            controller: paymentNotesController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                              hintText: 'Note',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Color(0x33FFFFFF),
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(20, 40, 24, 0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Roboto',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                            textAlign: TextAlign.start,
                            maxLines: 4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          final paymentsCreateData = createPaymentsRecordData(
                            userRef: currentUserReference,
                            type: paymentMethodValue,
                            createdDate: getCurrentTimestamp,
                            isApproved: false,
                            transactionCode:
                                transactionReferenceController!.text,
                            amount: int.parse(textController1!.text),
                            firstName: firstNameController!.text,
                            lastName: lastNameController!.text,
                          );
                          var paymentsRecordReference =
                              PaymentsRecord.collection.doc();
                          await paymentsRecordReference.set(paymentsCreateData);
                          paymentRef = PaymentsRecord.getDocumentFromData(
                              paymentsCreateData, paymentsRecordReference);

                          context.pushNamed('PaymentsList');

                          setState(() {});
                        },
                        text: 'Add Payment',
                        options: FFButtonOptions(
                          width: 300,
                          height: 70,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                          elevation: 2,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              'Tap above to complete request',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Roboto',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
