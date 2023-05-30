import '/backend/backend.dart';
import '/components/booking_test_list_item/booking_test_list_item_widget.dart';
import '/components/date_widget_small/date_widget_small_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookingViewWidgetCopyModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  bool isExpanded = false;

  ///  State fields for stateful widgets in this component.

  // Model for dateWidgetSmall component.
  late DateWidgetSmallModel dateWidgetSmallModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dateWidgetSmallModel = createModel(context, () => DateWidgetSmallModel());
  }

  void dispose() {
    dateWidgetSmallModel.dispose();
  }

  /// Additional helper methods are added here.

}
