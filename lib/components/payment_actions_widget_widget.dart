import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentActionsWidgetWidget extends StatefulWidget {
  const PaymentActionsWidgetWidget({
    Key key,
    this.paymentRef,
  }) : super(key: key);

  final DocumentReference paymentRef;

  @override
  _PaymentActionsWidgetWidgetState createState() =>
      _PaymentActionsWidgetWidgetState();
}

class _PaymentActionsWidgetWidgetState
    extends State<PaymentActionsWidgetWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PaymentsRecord>(
      stream: PaymentsRecord.getDocument(widget.paymentRef),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitRipple(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 50,
              ),
            ),
          );
        }
        final containerPaymentsRecord = snapshot.data;
        return Material(
          color: Colors.transparent,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            constraints: BoxConstraints(
              maxWidth: 300,
            ),
            decoration: BoxDecoration(
              color: Color(0xFF58585C),
              boxShadow: [
                BoxShadow(
                  blurRadius: 1,
                  color: FlutterFlowTheme.of(context).secondaryColor,
                  spreadRadius: 1,
                )
              ],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(22, 22, 22, 22),
              child: StreamBuilder<BookingsRecord>(
                stream: BookingsRecord.getDocument(
                    containerPaymentsRecord.bookingRef),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: SpinKitRipple(
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 50,
                        ),
                      ),
                    );
                  }
                  final rowBookingsRecord = snapshot.data;
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        children: [
                          if (!containerPaymentsRecord.isApproved)
                            Container(
                              width: 110,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(7, 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.receipt,
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      size: 20,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 80,
                                          decoration: BoxDecoration(),
                                          child: Text(
                                            'Receipt',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiaryColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                      Stack(
                        children: [
                          if (!containerPaymentsRecord.isApproved)
                            StreamBuilder<InvoicesRecord>(
                              stream: InvoicesRecord.getDocument(
                                  containerPaymentsRecord.invoiceRef),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: SpinKitRipple(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 50,
                                      ),
                                    ),
                                  );
                                }
                                final verifyButtonInvoicesRecord =
                                    snapshot.data;
                                return InkWell(
                                  onTap: () async {
                                    final paymentsUpdateData =
                                        createPaymentsRecordData(
                                      isApproved: true,
                                      updatedDate: getCurrentTimestamp,
                                      updateRole: valueOrDefault(
                                          currentUserDocument?.role, ''),
                                    );
                                    await containerPaymentsRecord.reference
                                        .update(paymentsUpdateData);

                                    final invoicesUpdateData = {
                                      ...createInvoicesRecordData(
                                        isPaid: true,
                                        fullAmount: functions.invoiceFullAmount(
                                            verifyButtonInvoicesRecord
                                                .invoiceAmount,
                                            containerPaymentsRecord.amount
                                                ?.toDouble()),
                                        amountDue: functions
                                            .returnInvoiceAmountDue(
                                                containerPaymentsRecord.amount
                                                    ?.toDouble(),
                                                verifyButtonInvoicesRecord
                                                    .amountDue),
                                        updateDate: getCurrentTimestamp,
                                        updateRole: valueOrDefault(
                                            currentUserDocument?.role, ''),
                                      ),
                                      'payments_list': FieldValue.arrayUnion(
                                          [widget.paymentRef]),
                                    };
                                    await verifyButtonInvoicesRecord.reference
                                        .update(invoicesUpdateData);
                                    if (!rowBookingsRecord.payments
                                        .toList()
                                        .contains(widget.paymentRef)) {
                                      final bookingsUpdateData = {
                                        ...createBookingsRecordData(
                                          paymentBalance:
                                              functions.returnBookingBalance(
                                                  containerPaymentsRecord.amount
                                                      ?.toDouble(),
                                                  rowBookingsRecord
                                                      .paymentBalance),
                                          updatedDate: getCurrentTimestamp,
                                          updateRole: valueOrDefault(
                                              currentUserDocument?.role, ''),
                                        ),
                                        'payments': FieldValue.arrayUnion(
                                            [widget.paymentRef]),
                                      };
                                      await rowBookingsRecord.reference
                                          .update(bookingsUpdateData);
                                    }
                                  },
                                  child: Container(
                                    width: 110,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          7, 0, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.verified_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            size: 20,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 80,
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  'Verify',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiaryColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          if (containerPaymentsRecord.isApproved ?? true)
                            Container(
                              width: 110,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(7, 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.verified_sharp,
                                      color: Color(0x74BACA68),
                                      size: 18,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 80,
                                          decoration: BoxDecoration(),
                                          child: Text(
                                            'Verify',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: Color(0x73BACA68),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
