import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_actions_widget_model.dart';
export 'payment_actions_widget_model.dart';

class PaymentActionsWidgetWidget extends StatefulWidget {
  const PaymentActionsWidgetWidget({
    Key? key,
    this.paymentRef,
  }) : super(key: key);

  final DocumentReference? paymentRef;

  @override
  _PaymentActionsWidgetWidgetState createState() =>
      _PaymentActionsWidgetWidgetState();
}

class _PaymentActionsWidgetWidgetState
    extends State<PaymentActionsWidgetWidget> {
  late PaymentActionsWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentActionsWidgetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<PaymentsRecord>(
      stream: PaymentsRecord.getDocument(widget.paymentRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: SpinKitRipple(
                color: FlutterFlowTheme.of(context).primary,
                size: 50.0,
              ),
            ),
          );
        }
        final containerPaymentsRecord = snapshot.data!;
        return Material(
          color: Colors.transparent,
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            constraints: BoxConstraints(
              maxWidth: 300.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryText,
              boxShadow: [
                BoxShadow(
                  blurRadius: 1.0,
                  color: FlutterFlowTheme.of(context).secondary,
                  spreadRadius: 1.0,
                )
              ],
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(22.0, 22.0, 22.0, 22.0),
              child: StreamBuilder<BookingsRecord>(
                stream: BookingsRecord.getDocument(
                    containerPaymentsRecord.bookingRef!),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: SpinKitRipple(
                          color: FlutterFlowTheme.of(context).primary,
                          size: 50.0,
                        ),
                      ),
                    );
                  }
                  final rowBookingsRecord = snapshot.data!;
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        children: [
                          if (!containerPaymentsRecord.isApproved)
                            Container(
                              width: 110.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    7.0, 0.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.receipt,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 20.0,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 80.0,
                                          decoration: BoxDecoration(),
                                          child: Text(
                                            'Receipt',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
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
                                  containerPaymentsRecord.invoiceRef!),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitRipple(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                final verifyButtonInvoicesRecord =
                                    snapshot.data!;
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
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
                                                .toDouble()),
                                        amountDue: functions
                                            .returnInvoiceAmountDue(
                                                containerPaymentsRecord.amount
                                                    .toDouble(),
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
                                        .contains(widget.paymentRef)) {
                                      final bookingsUpdateData = {
                                        ...createBookingsRecordData(
                                          paymentBalance:
                                              functions.returnBookingBalance(
                                                  containerPaymentsRecord.amount
                                                      .toDouble(),
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
                                    width: 110.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          7.0, 0.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.verified_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            size: 20.0,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 80.0,
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  'Verify',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
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
                          if (containerPaymentsRecord.isApproved)
                            Container(
                              width: 110.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    7.0, 0.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.verified_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 18.0,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 80.0,
                                          decoration: BoxDecoration(),
                                          child: Text(
                                            'Verify',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
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
