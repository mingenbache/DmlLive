import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/add_payment_w_idget_widget.dart';
import '../components/empty_list_widget.dart';
import '../components/invoice_list_item_widget_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PaymentSelectInvoicePopupWidget extends StatefulWidget {
  const PaymentSelectInvoicePopupWidget({Key? key}) : super(key: key);

  @override
  _PaymentSelectInvoicePopupWidgetState createState() =>
      _PaymentSelectInvoicePopupWidgetState();
}

class _PaymentSelectInvoicePopupWidgetState
    extends State<PaymentSelectInvoicePopupWidget> {
  PagingController<DocumentSnapshot?, InvoicesRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        setState(() => FFAppState().lastBookingPage = false);
      },
      child: Align(
        alignment: AlignmentDirectional(0, 0.9),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Material(
              color: Colors.transparent,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                constraints: BoxConstraints(
                  maxWidth: 340,
                  maxHeight: MediaQuery.of(context).size.height * 0.85,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 34, 21, 10),
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
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 30,
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
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    buttonSize: 48,
                                    icon: Icon(
                                      Icons.close_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 30,
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
                            maxHeight: 350,
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
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 10, 10),
                                      child: Text(
                                        'Please select an invoice below',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Montserrat',
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
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 5),
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
                                                BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 5),
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
                                                if (_pagingController != null) {
                                                  final query = queryBuilder(
                                                      InvoicesRecord
                                                          .collection);
                                                  if (query != _pagingQuery) {
                                                    // The query has changed
                                                    _pagingQuery = query;
                                                    _streamSubscriptions
                                                        .forEach(
                                                            (s) => s?.cancel());
                                                    _streamSubscriptions
                                                        .clear();
                                                    _pagingController!
                                                        .refresh();
                                                  }
                                                  return _pagingController!;
                                                }

                                                _pagingController =
                                                    PagingController(
                                                        firstPageKey: null);
                                                _pagingQuery = queryBuilder(
                                                    InvoicesRecord.collection);
                                                _pagingController!
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
                                                    _pagingController!
                                                        .appendPage(
                                                      page.data,
                                                      page.nextPageMarker,
                                                    );
                                                    final streamSubscription =
                                                        page.dataStream
                                                            ?.listen((data) {
                                                      final itemIndexes =
                                                          _pagingController!
                                                              .itemList!
                                                              .asMap()
                                                              .map((k, v) =>
                                                                  MapEntry(
                                                                      v.reference
                                                                          .id,
                                                                      k));
                                                      data.forEach((item) {
                                                        final index =
                                                            itemIndexes[item
                                                                .reference.id];
                                                        final items =
                                                            _pagingController!
                                                                .itemList!;
                                                        if (index != null) {
                                                          items.replaceRange(
                                                              index,
                                                              index + 1,
                                                              [item]);
                                                          _pagingController!
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
                                                    _streamSubscriptions.add(
                                                        streamSubscription);
                                                  });
                                                });
                                                return _pagingController!;
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
                                                    width: 50,
                                                    height: 50,
                                                    child: SpinKitRipple(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 50,
                                                    ),
                                                  ),
                                                ),
                                                noItemsFoundIndicatorBuilder:
                                                    (_) => EmptyListWidget(),
                                                itemBuilder: (context, _,
                                                    listViewIndex) {
                                                  final listViewInvoicesRecord =
                                                      _pagingController!
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
