import '../backend/backend.dart';
import '../components/payment_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentsContainerWidget extends StatefulWidget {
  const PaymentsContainerWidget({
    Key key,
    this.invoice,
  }) : super(key: key);

  final InvoicesRecord invoice;

  @override
  _PaymentsContainerWidgetState createState() =>
      _PaymentsContainerWidgetState();
}

class _PaymentsContainerWidgetState extends State<PaymentsContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      constraints: BoxConstraints(
        maxWidth: 320,
      ),
      decoration: BoxDecoration(),
      child: Builder(
        builder: (context) {
          final payments = widget.invoice.paymentsList?.toList() ?? [];
          return ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemCount: payments.length,
            itemBuilder: (context, paymentsIndex) {
              final paymentsItem = payments[paymentsIndex];
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 4),
                child: StreamBuilder<PaymentsRecord>(
                  stream: PaymentsRecord.getDocument(paymentsItem),
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
                    return InkWell(
                      onTap: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: PaymentWidget(
                                paymentRef: containerPaymentsRecord,
                              ),
                            );
                          },
                        );
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.82,
                          height: 28,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.15,
                                height: 100,
                                constraints: BoxConstraints(
                                  maxWidth: 80,
                                ),
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 9, 5, 5),
                                  child: Text(
                                    dateTimeFormat('d/M/y',
                                        containerPaymentsRecord.createdDate),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Color(0xFF586B06),
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: 30,
                                constraints: BoxConstraints(
                                  maxWidth: 80,
                                ),
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      7, 9, 5, 5),
                                  child: Text(
                                    containerPaymentsRecord.transactionCode
                                        .maybeHandleOverflow(maxChars: 8),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.2,
                                height: 30,
                                constraints: BoxConstraints(
                                  maxWidth: 60,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      9, 9, 5, 5),
                                  child: Text(
                                    containerPaymentsRecord.type,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                height: 30,
                                constraints: BoxConstraints(
                                  maxWidth: 90,
                                ),
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 9, 5, 5),
                                  child: Text(
                                    formatNumber(
                                      containerPaymentsRecord.amount,
                                      formatType: FormatType.decimal,
                                      decimalType: DecimalType.periodDecimal,
                                      currency: 'Ksh ',
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Color(0xFF586B06),
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
