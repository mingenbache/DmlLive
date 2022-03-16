// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:accordion/accordion.dart';
//import '../flutter_flow/custom_functions.dart' as functions;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

//import '../components/user_activity_widget.dart';
class AccordionList extends StatefulWidget {
  const AccordionList({
    Key key,
    this.width,
    this.height,
    this.users,
  }) : super(key: key);

  final double width;
  final double height;
  final List<UsersRecord> users;

  @override
  _AccordionListState createState() => _AccordionListState();
}

class _AccordionListState extends State<AccordionList> {
  @override
  Widget build(BuildContext context) {
    final _headerStyle = const TextStyle(
        color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
    final _contentStyleHeader = const TextStyle(
        color: Color(0xff58595b), fontSize: 14, fontWeight: FontWeight.w700);
    final _contentStyle = const TextStyle(
        color: Color(0xff58595b), fontSize: 14, fontWeight: FontWeight.normal);
    final _loremIpsum = '''Lorem Latin.''';
    final users = this.widget.users;
    return Accordion(
      maxOpenSections: 2,
      headerBackgroundColorOpened: Colors.green,
      headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      children: [
        for (var user in users)
          AccordionSection(
            isOpen: false,
            //leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
            headerBackgroundColor: Color(0xFF88993a),
            headerBackgroundColorOpened: Color(0xFF88993a),
            header:
                Text(user.firstName + ' ' + user.lastName, style: _headerStyle),
            //user.firstName + ' ' + user.lastName, style: _headerStyle),
            content: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 30,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.email_outlined,
                              color: Color(0xFF586b06),
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        user.email,
                        style: _contentStyle,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 30,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.userPlus,
                                  color: Color(0xFF586b06),
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 80,
                            decoration: BoxDecoration(),
                            child: Text(
                                DateFormat('yMMMd').format(user.createdTime),
                                style: _contentStyle),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 30,
                            decoration: BoxDecoration(),
                            child: FaIcon(
                              FontAwesomeIcons.userClock,
                              color: Color(0xFF586b06),
                              size: 20,
                            ),
                          ),
                          Container(
                            width: 75,
                            decoration: BoxDecoration(),
                            child: Text(
                              DateFormat('yMMMd').format(user.lastLogin),
                              style: _contentStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(0.8, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 32,
                      constraints: BoxConstraints(
                        maxWidth: 130,
                        maxHeight: 32,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0x4CFFFFFF),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x32171717),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.verified_user_sharp,
                            color: Color(0xFF586b06),
                            size: 20,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                            child: Text(
                              user.role,
                              textAlign: TextAlign.center,
                              style: _contentStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            contentHorizontalPadding: 20,
            contentBorderWidth: 1,
            // sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
            // sectionClosingHapticFeedback: SectionHapticFeedback.vibrate,
          ),
      ],
    );
  }
}
