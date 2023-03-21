import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/screens/register_observation/register_observation_widget.dart';
import 'observation_form_model.dart';

export 'observation_form_model.dart';

class ObservationFormWidget extends StatefulWidget {
  const ObservationFormWidget({
    Key? key,
    //this.userProfile,
  }) : super(key: key);

  //final DocumentReference? userProfile;

  @override
  _ObservationFormWidgetState createState() => _ObservationFormWidgetState();
}

class _ObservationFormWidgetState extends State<ObservationFormWidget>
    with TickerProviderStateMixin {
  late ObservationFormModel _model;

  final animation = AnimationInfo(
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
        begin: const Offset(0.0, 9.0),
        end: const Offset(0.0, 0.0),
      ),
      ScaleEffect(
        curve: Curves.easeInOut,
        delay: 0.ms,
        duration: 600.ms,
        begin: 1.0,
        end: 1.0,
      ),
    ],
  );

  OutlineInputBorder inputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color(0x00000000),
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
  }

  InputDecoration inputDecoration(String name) {
    return InputDecoration(
      labelText: name,
      labelStyle: FlutterFlowTheme.of(context).bodyText2,
      enabledBorder: inputBorder(),
      focusedBorder: inputBorder(),
      errorBorder: inputBorder(),
      focusedErrorBorder: inputBorder(),
      filled: true,
      fillColor: FlutterFlowTheme.of(context).primaryBackground,
      contentPadding:
          const EdgeInsets.only(top: 24.0, bottom: 24.0, left: 20.0),
    );
  }

  BoxDecoration boxDecoration() {
    return BoxDecoration(
      color: FlutterFlowTheme.of(context).primaryBackground,
      borderRadius: BorderRadius.circular(8.0),
      border: Border.all(
        color: FlutterFlowTheme.of(context).primaryBackground,
        width: 2.0,
      ),
    );
  }

  InkWell dateTimeField(bool start) {
    DateTime? date = start ? _model.startDate : _model.endDate;
    return InkWell(
      onTap: () async {
        showDateTimePicker(start);
      },
      child: Material(
        color: Colors.transparent,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 60.0,
          decoration: boxDecoration(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        start ? 'Starttid' : 'Sluttid',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Outfit',
                              fontSize: 12.0,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 4.0),
                      child: Text(
                        '${dateTimeFormat('dd.MM.yyyy', date)} kl. ${dateTimeFormat('kk:mm', date)}',
                        style: FlutterFlowTheme.of(context).bodyText2.override(
                              fontFamily: 'Outfit',
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  buttonSize: 46.0,
                  icon: Icon(
                    Icons.date_range_outlined,
                    color: FlutterFlowTheme.of(context).grayLight,
                    size: 20.0,
                  ),
                  onPressed: () async {
                    showDateTimePicker(start);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showDateTimePicker(bool start) async {
    await DatePicker.showDateTimePicker(
      context,
      showTitleActions: true,
      onConfirm: (date) {
        setState(() {
          start ? _model.startDate = date : _model.endDate = date;
          if (date > _model.endDate!) _model.endDate = date;
        });
      },
      currentTime: start ? _model.startDate : _model.endDate,
      minTime: start ? DateTime(0, 0, 0) : _model.startDate,
    );
  }

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ObservationFormModel());

    _model.coObserverController ??= TextEditingController();
    _model.commentController ??= TextEditingController();
    createAnimation(
      animation,
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
          decoration: const BoxDecoration(
            color: Color(0xD60E151B),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 710.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: /*StreamBuilder<UsersRecord>(
                          stream:
                              UsersRecord.getDocument(currentUserReference!),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 40.0,
                                  height: 40.0,
                                  child: SpinKitPumpingHeart(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 40.0,
                                  ),
                                ),
                              );
                            }
                            final columnUsersRecord = snapshot.data!;
                            return */
                              SingleChildScrollView(
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
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    'Registrer ny observasjon',
                                    style: FlutterFlowTheme.of(context).title3,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: Text(
                                    'Observasjonen blir sendt til:',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    //TODO bruk mail fra brukerinfo
                                    'example@example.org', //currentUserEmail,
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle1
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: TextFormField(
                                    controller:
                                        _model.locationNameController ??=
                                            TextEditingController(),
                                    //TODO få inn lokasjonsnavn fra kart?? text: locationName
                                    obscureText: false,
                                    decoration:
                                        inputDecoration('Lokasjonsnavn'),
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                    validator: _model
                                        .locationNameControllerValidator
                                        .asValidator(context),
                                  ).animateOnPageLoad(animation),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: TextFormField(
                                    controller: _model.coObserverController,
                                    obscureText: false,
                                    decoration:
                                        inputDecoration('Medobservatør'),
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    validator: _model
                                        .coObserverControllerValidator
                                        .asValidator(context),
                                  ).animateOnPageLoad(animation),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: Container(
                                    height: 60.0,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: boxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20.0, top: 10.0),
                                          child: Text(
                                            'Nøyaktighet (m)',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  fontSize: 12.0,
                                                ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20.0, bottom: 5.0),
                                                child: Text(
                                                  _model.sliderValue.toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiaryColor,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Slider(
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryColor,
                                                  min: 0.0,
                                                  max: 200.0,
                                                  value: _model.sliderValue ??=
                                                      50.0,
                                                  label: _model.sliderValue
                                                      .toString(),
                                                  divisions: 20,
                                                  onChanged: (newValue) {
                                                    setState(() => _model
                                                            .sliderValue =
                                                        newValue
                                                            .roundToDouble());
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ).animateOnPageLoad(animation),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: dateTimeField(true)
                                        .animateOnPageLoad(animation)),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: dateTimeField(false)
                                      .animateOnPageLoad(animation),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: TextFormField(
                                    controller: _model.commentController,
                                    obscureText: false,
                                    decoration: inputDecoration('Kommentar'),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                    keyboardType: TextInputType.multiline,
                                    validator: _model.commentControllerValidator
                                        .asValidator(context),
                                  ).animateOnPageLoad(animation),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          Navigator.pop(context);
                                        },
                                        text: 'Avbryt',
                                        options: FFButtonOptions(
                                          width: 100.0,
                                          height: 50.0,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontWeight: FontWeight.w500,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                        ),
                                      ).animateOnPageLoad(animation),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const RegisterObservationWidget(),
                                            ),
                                          );
                                        },
                                        text: 'Gå videre',
                                        options: FFButtonOptions(
                                          width: 170.0,
                                          height: 50.0,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                        ),
                                      ).animateOnPageLoad(animation),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                          //},
                          //),
                          ),
                    ],
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
