import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'species_picker_model.dart';
export 'species_picker_model.dart';

class SpeciesPickerWidget extends StatefulWidget {
  const SpeciesPickerWidget({
    Key? key,
    this.userProfile,
  }) : super(key: key);

  final DocumentReference? userProfile;

  @override
  _SpeciesPickerWidgetState createState() => _SpeciesPickerWidgetState();
}

class _SpeciesPickerWidgetState extends State<SpeciesPickerWidget>
    with TickerProviderStateMixin {
  late SpeciesPickerModel _model;

  final animationsMap = {
    'textFieldOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 9.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 1.0,
          end: 1.0,
        ),
      ],
    ),
    'buttonOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.bounceOut,
          delay: 150.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 150.ms,
          duration: 600.ms,
          begin: Offset(0.0, 20.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 150.ms,
          duration: 600.ms,
          begin: 1.0,
          end: 1.0,
        ),
      ],
    ),
    'buttonOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.bounceOut,
          delay: 150.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 150.ms,
          duration: 600.ms,
          begin: Offset(0.0, 20.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 150.ms,
          duration: 600.ms,
          begin: 1.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SpeciesPickerModel());

    _model.locationNameController ??= TextEditingController();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 3.0,
          sigmaY: 3.0,
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xD60E151B),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1.0,
                height: 710.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: StreamBuilder<UsersRecord>(
                    stream: UsersRecord.getDocument(currentUserReference!),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 40.0,
                            height: 40.0,
                            child: SpinKitPumpingHeart(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 40.0,
                            ),
                          ),
                        );
                      }
                      final columnUsersRecord = snapshot.data!;
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(
                              thickness: 3.0,
                              indent: 150.0,
                              endIndent: 150.0,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                'Legg til arter',
                                style: FlutterFlowTheme.of(context).title3,
                              ),
                            ),
                            ListView(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: [
                                Theme(
                                  data: ThemeData(
                                    unselectedWidgetColor: Color(0xFF95A1AC),
                                  ),
                                  child: CheckboxListTile(
                                    value: _model.checkboxListTileValue1 ??=
                                        true,
                                    onChanged: (newValue) async {
                                      setState(() => _model
                                          .checkboxListTileValue1 = newValue!);
                                    },
                                    title: Text(
                                      '[Species name]',
                                      style:
                                          FlutterFlowTheme.of(context).title3,
                                    ),
                                    subtitle: Text(
                                      '[Scientific name]',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ),
                                    tileColor: Color(0xFFF5F5F5),
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                  ),
                                ),
                                Theme(
                                  data: ThemeData(
                                    unselectedWidgetColor: Color(0xFF95A1AC),
                                  ),
                                  child: CheckboxListTile(
                                    value: _model.checkboxListTileValue2 ??=
                                        true,
                                    onChanged: (newValue) async {
                                      setState(() => _model
                                          .checkboxListTileValue2 = newValue!);
                                    },
                                    title: Text(
                                      '[Species name]',
                                      style:
                                          FlutterFlowTheme.of(context).title3,
                                    ),
                                    subtitle: Text(
                                      '[Scientific name]',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ),
                                    tileColor: Color(0xFFF5F5F5),
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                  ),
                                ),
                                Theme(
                                  data: ThemeData(
                                    unselectedWidgetColor: Color(0xFF95A1AC),
                                  ),
                                  child: CheckboxListTile(
                                    value: _model.checkboxListTileValue3 ??=
                                        false,
                                    onChanged: (newValue) async {
                                      setState(() => _model
                                          .checkboxListTileValue3 = newValue!);
                                    },
                                    title: Text(
                                      '[Species name]',
                                      style:
                                          FlutterFlowTheme.of(context).title3,
                                    ),
                                    subtitle: Text(
                                      '[Scientific name]',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ),
                                    tileColor: Color(0xFFF5F5F5),
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                  ),
                                ),
                                Theme(
                                  data: ThemeData(
                                    unselectedWidgetColor: Color(0xFF95A1AC),
                                  ),
                                  child: CheckboxListTile(
                                    value: _model.checkboxListTileValue4 ??=
                                        false,
                                    onChanged: (newValue) async {
                                      setState(() => _model
                                          .checkboxListTileValue4 = newValue!);
                                    },
                                    title: Text(
                                      '[Species name]',
                                      style:
                                          FlutterFlowTheme.of(context).title3,
                                    ),
                                    subtitle: Text(
                                      '[Scientific name]',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ),
                                    tileColor: Color(0xFFF5F5F5),
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                  ),
                                ),
                                Theme(
                                  data: ThemeData(
                                    unselectedWidgetColor: Color(0xFF95A1AC),
                                  ),
                                  child: CheckboxListTile(
                                    value: _model.checkboxListTileValue5 ??=
                                        false,
                                    onChanged: (newValue) async {
                                      setState(() => _model
                                          .checkboxListTileValue5 = newValue!);
                                    },
                                    title: Text(
                                      '[Species name]',
                                      style:
                                          FlutterFlowTheme.of(context).title3,
                                    ),
                                    subtitle: Text(
                                      '[Scientific name]',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ),
                                    tileColor: Color(0xFFF5F5F5),
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.locationNameController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Søk etter arter...',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          20.0, 24.0, 0.0, 24.0),
                                  prefixIcon: Icon(
                                    Icons.search_sharp,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontWeight: FontWeight.normal,
                                    ),
                                validator: _model
                                    .locationNameControllerValidator
                                    .asValidator(context),
                              ).animateOnPageLoad(animationsMap[
                                  'textFieldOnPageLoadAnimation']!),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 20.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                    },
                                    text: 'Avbryt',
                                    options: FFButtonOptions(
                                      width: 100.0,
                                      height: 50.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'buttonOnPageLoadAnimation1']!),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                    },
                                    text: 'Legg til',
                                    options: FFButtonOptions(
                                      width: 170.0,
                                      height: 50.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'buttonOnPageLoadAnimation2']!),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
