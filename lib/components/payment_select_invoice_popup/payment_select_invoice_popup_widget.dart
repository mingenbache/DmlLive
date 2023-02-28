import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_payment_w_idget/add_payment_w_idget_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/invoice_list_item_widget/invoice_list_item_widget_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'payment_select_invoice_popup_model.dart';
export 'payment_select_invoice_popup_model.dart';

class PaymentSelectInvoicePopupWidget extends StatefulWidget {
  const PaymentSelectInvoicePopupWidget({Key? key}) : super(key: key);

  @override
  _PaymentSelectInvoicePopupWidgetState createState() =>
      _PaymentSelectInvoicePopupWidgetState();
}

class _PaymentSelectInvoicePopupWidgetState
    extends State<PaymentSelectInvoicePopupWidget> {
  late PaymentSelectInvoicePopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentSelectInvoicePopupModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      onTap: () async {
        FFAppState().update(() {
          FFAppState().lastBookingPage = false;
        });
      },
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.9),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Material(
              color: Colors.transparent,
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                constraints: BoxConstraints(
                  maxWidth: 340.0,
                  maxHeight: MediaQuery.of(context).size.height * 0.85,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryColor,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 34.0, 21.0, 10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'YOUR INVOICES',
                                style: FlutterFlowTheme.of(context)
                                    .title2
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              InkWell(
                                onTap: () async {
                                  context.pop();
                                },
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    buttonSize: 48.0,
                                    icon: Icon(
                                      Icons.close_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 30.0,
                                    ),
                                    onPressed: () async {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          constraints: BoxConstraints(
                            maxHeight: 350.0,
                          ),
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    decoration: BoxDecoration(
                                      color: Color(0x34FFFFFF),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: Text(
                                        'Please select an invoice below',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Unpaid Invoices',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 5.0),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.28,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 5.0),
                                            child: PagedListView<
                                                DocumentSnapshot<Object?>?,
                                                InvoicesRecord>(
                                              pagingController: () {
                                                final Query<Object?> Function(
                                                        Query<Object?>)
                                                    queryBuilder =
                                                    (invoicesRecord) =>
                                                        invoicesRecord
                                                            .where(
                                                                'bookingUser',
                                                                isEqualTo:
                                                                    currentUserReference)
                                                            .where(
                                                                'full_amount',
                                                                isEqualTo:
                                                                    false)
                                                            .orderBy(
                                                                'created_date',
                                                                descending:
                                                                    true);
                                                if (_model.pagingController !=
                                                    null) {
                                                  final query = queryBuilder(
                                                      InvoicesRecord
                                                          .collection);
                                                  if (query !=
                                                      _model.pagingQuery) {
                                                    // The query has changed
                                                    _model.pagingQuery = query;
                                                    _model.streamSubscriptions
                                                        .forEach(
                                                            (s) => s?.cancel());
                                                    _model.streamSubscriptions
                                                        .clear();
                                                    _model.pagingController!
                                                        .refresh();
                                                  }
                                                  return _model
                                                      .pagingController!;
                                                }

                                                _model.pagingController =
                                                    PagingController(
                                                        firstPageKey: null);
                                                _model.pagingQuery =
                                                    queryBuilder(InvoicesRecord
                                                        .collection);
                                                _model.pagingController!
                                                    .addPageRequestListener(
                                                        (nextPageMarker) {
                                                  queryInvoicesRecordPage(
                                                    queryBuilder: (invoicesRecord) =>
                                                        invoicesRecord
                                                            .where(
                                                                'bookingUser',
                                                                isEqualTo:
                                                                    currentUserReference)
                                                            .where(
                                                                'full_amount',
                                                                isEqualTo:
                                                                    false)
                                                            .orderBy(
                                                                'created_date',
                                                                descending:
                                                                    true),
                                                    nextPageMarker:
                                                        nextPageMarker,
                                                    pageSize: 25,
                                                    isStream: true,
                                                  ).then((page) {
                                                    _model.pagingController!
                                                        .appendPage(
                                                      page.data,
                                                      page.nextPageMarker,
                                                    );
                                                    final streamSubscription =
                                                        page.dataStream
                                                            ?.listen((data) {
                                                      data.forEach((item) {
                                                        final itemIndexes = _model
                                                            .pagingController!
                                                            .itemList!
                                                            .asMap()
                                                            .map((k, v) =>
                                                                MapEntry(
                                                                    v.reference
                                                                        .id,
                                                                    k));
                                                        final index =
                                                            itemIndexes[item
                                                                .reference.id];
                                                        final items = _model
                                                            .pagingController!
                                                            .itemList!;
                                                        if (index != null) {
                                                          items.replaceRange(
                                                              index,
                                                              index + 1,
                                                              [item]);
                                                          _model
                                                              .pagingController!
                                                              .itemList = {
                                                            for (var item
                                                                in items)
                                                              item.reference:
                                                                  item
                                                          }.values.toList();
                                                        }
                                                      });
                                                      setState(() {});
                                                    });
                                                    _model.streamSubscriptions
                                                        .add(
                                                            streamSubscription);
                                                  });
                                                });
                                                return _model.pagingController!;
                                              }(),
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              scrollDirection: Axis.vertical,
                                              builderDelegate:
                                                  PagedChildBuilderDelegate<
                                                      InvoicesRecord>(
                                                // Customize what your widget looks like when it's loading the first page.
                                                firstPageProgressIndicatorBuilder:
                                                    (_) => Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child: SpinKitRipple(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                ),
                                                noItemsFoundIndicatorBuilder:
                                                    (_) => EmptyListWidget(),
                                                itemBuilder: (context, _,
                                                    listViewIndex) {
                                                  final listViewInvoicesRecord =
                                                      _model.pagingController!
                                                              .itemList![
                                                          listViewIndex];
                                                  return InkWell(
                                                    onTap: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                            child:
                                                                AddPaymentWIdgetWidget(
                                                              invoiceRef:
                                                                  listViewInvoicesRecord
                                                                      .reference,
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    },
                                                    child:
                                                        InvoiceListItemWidgetWidget(
                                                      key: Key(
                                                          'Key1v4_${listViewIndex}_of_${_model.pagingController!.itemList!.length}'),
                                                      invoice:
                                                          listViewInvoicesRecord,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
