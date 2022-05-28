import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController emailaddressController;
  TextEditingController passwordController;
  bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailaddressController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.65,
            decoration: BoxDecoration(),
            child: ClipRect(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: 1,
                  sigmaY: 1,
                ),
                child: Image.asset(
                  'assets/images/cdc-XLhDvfz0sUM-unsplash-reducedBW.jpg',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0x212F2F2F),
                    FlutterFlowTheme.of(context).tertiaryColor,
                    FlutterFlowTheme.of(context).primaryColor,
                    FlutterFlowTheme.of(context).alternate
                  ],
                  stops: [0, 0.55, 0.85, 1],
                  begin: AlignmentDirectional(0, -1),
                  end: AlignmentDirectional(0, 1),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 170, 0, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: 100,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                            child: Image.asset(
                              'assets/images/dml_logo.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 20),
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          constraints: BoxConstraints(
                            maxWidth: 500,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextFormField(
                            controller: emailaddressController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                              labelStyle: GoogleFonts.getFont(
                                'Roboto',
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                              hintText: 'Email Address',
                              hintStyle: GoogleFonts.getFont(
                                'Roboto',
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Color(0x34FFFFFF),
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                            ),
                            style: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 20),
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          constraints: BoxConstraints(
                            maxWidth: 500,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextFormField(
                            controller: passwordController,
                            autofocus: true,
                            obscureText: !passwordVisibility,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: GoogleFonts.getFont(
                                'Roboto',
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                              hintText: 'Password',
                              hintStyle: GoogleFonts.getFont(
                                'Roboto',
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Color(0x34FFFFFF),
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                  () =>
                                      passwordVisibility = !passwordVisibility,
                                ),
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  passwordVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                            style: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 20),
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          constraints: BoxConstraints(
                            maxWidth: 500,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0x00FFFFFF),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed('Signup');
                                },
                                text: 'Sign Up',
                                options: FFButtonOptions(
                                  width: 90,
                                  height: 40,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  elevation: 2,
                                  borderSide: BorderSide(
                                    color: Color(0x00FFFFFF),
                                  ),
                                  borderRadius: 12,
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  GoRouter.of(context).prepareAuthEvent();

                                  final user = await signInWithEmail(
                                    context,
                                    emailaddressController.text,
                                    passwordController.text,
                                  );
                                  if (user == null) {
                                    return;
                                  }

                                  context.pushNamedAuth('Home', mounted);
                                },
                                text: 'Sign In',
                                options: FFButtonOptions(
                                  width: 90,
                                  height: 40,
                                  color: Color(0xFF58595B),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 0,
                                  ),
                                  borderRadius: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 20),
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0x00FFFFFF),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Container(
                                  width: 230,
                                  height: 44,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            GoRouter.of(context)
                                                .prepareAuthEvent();
                                            final user =
                                                await signInWithGoogle(context);
                                            if (user == null) {
                                              return;
                                            }
                                            context.goNamedAuth(
                                                'Home', mounted);
                                          },
                                          text: 'Sign in with Google',
                                          icon: Icon(
                                            Icons.add,
                                            color: Colors.transparent,
                                            size: 20,
                                          ),
                                          options: FFButtonOptions(
                                            width: 230,
                                            height: 44,
                                            color: Colors.white,
                                            textStyle: GoogleFonts.getFont(
                                              'Roboto',
                                              color: Color(0xFF606060),
                                              fontSize: 17,
                                            ),
                                            elevation: 4,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 0,
                                            ),
                                            borderRadius: 12,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.83, 0),
                                        child: Container(
                                          width: 22,
                                          height: 22,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            'https://i0.wp.com/nanophorm.com/wp-content/uploads/2018/04/google-logo-icon-PNG-Transparent-Background.png?w=1000&ssl=1',
                                            fit: BoxFit.contain,
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
