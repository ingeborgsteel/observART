import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hvart_har_du_sett/backend/api_models/observation_record_impl.dart';
import 'package:hvart_har_du_sett/backend/api_models/species_observation.dart';

import '../../components/species_tile_form/species_tile_form_widget.dart';
import '../../backend/api_models/species_search_result.dart';
import '/backend/backend.dart';
import '/components/species_picker/species_picker_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'register_observation_model.dart';

export 'register_observation_model.dart';

class RegisterObservationWidget extends StatefulWidget {
  final ObservationRecordImpl observation;

  const RegisterObservationWidget(
      {Key? key, this.userProfile, required this.observation})
      : super(key: key);

  final DocumentReference? userProfile;

  @override
  _RegisterObservationWidgetState createState() =>
      _RegisterObservationWidgetState();
}

class _RegisterObservationWidgetState extends State<RegisterObservationWidget>
    with TickerProviderStateMixin {
  late RegisterObservationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

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

  void addSpecies(Iterable<SpeciesSearchResult> newSpecies) {
    setState(() {
      _model.observation.species.addAll(newSpecies.map((species) =>
          SpeciesObservation(species.id, species.taxonGroup,
              species.scientificName, species.name)));
    });
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(
        context, () => RegisterObservationModel(widget.observation));

    createAnimation(animation, this);
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  String parseTimeString() {
    DateTime? startTime = _model.observation.startTime;
    DateTime? endTime = _model.observation.endTime;

    String parsedStartTime =
        '${dateTimeFormat('dd.MM', startTime)} kl. ${dateTimeFormat('kk:mm', startTime)}';
    String parsedEndTime = endTime?.day != startTime?.day
        ? '${dateTimeFormat('dd.MM', endTime)} kl. ${dateTimeFormat('kk:mm', endTime)}'
        : dateTimeFormat('kk:mm', endTime);

    print(endTime?.day == startTime?.day);

    return '$parsedStartTime - $parsedEndTime';
  }

  @override
  Widget build(BuildContext context) {
    /*return StreamBuilder<UsersRecord>(
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
        final registerObservationUsersRecord = snapshot.data!;*/
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: FlutterFlowTheme.of(context).grayLight,
            size: 32.0,
          ),
        ),
        title: Text(
          'Oppdater observasjon',
          style: FlutterFlowTheme.of(context).title3,
        ),
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: /*StreamBuilder<UsersRecord>(
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
              return */
                SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Text(
                              _model.observation.locationName ?? 'Uten navn',
                              style: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 4.0, bottom: 12.0),
                            child: Text(
                              parseTimeString(),
                              style: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        buttonSize: 50.0,
                        fillColor: FlutterFlowTheme.of(context).primaryColor,
                        icon: Icon(
                          Icons.search,
                          color: FlutterFlowTheme.of(context).alternate,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child:
                                    SpeciesPickerWidget(addSpecies: addSpecies),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                      ),
                    ],
                  ),
                  ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: _model.observation.species.map((species) {
                        return ExpandableNotifier(
                          initialExpanded: false,
                          child: ExpandablePanel(
                            header: ListTile(
                              leading: IconButton(
                                icon: Icon(Icons.delete_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor),
                                onPressed: () => setState(() {
                                  _model.observation.species.remove(species);
                                }),
                              ),
                              title: Text(
                                species.name ?? '',
                                style: FlutterFlowTheme.of(context).title3,
                              ),
                              subtitle: Text(
                                species.scientificName ?? '',
                                style: FlutterFlowTheme.of(context).bodyText2,
                              ),
                              dense: false,
                            ),
                            collapsed: Container(),
                            expanded: Container(
                              child: wrapWithModel(
                                model: _model.speciesTileFormModel,
                                updateCallback: () => setState(() {}),
                                child: const SpeciesTileFormWidget(),
                              ),
                            ),
                            theme: const ExpandableThemeData(
                              tapHeaderToExpand: true,
                              tapBodyToExpand: false,
                              tapBodyToCollapse: false,
                              headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
                              hasIcon: true,
                            ),
                          ),
                        );
                      }).toList()),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            //TODO fix navigering
                            Navigator.pop(context);
                          },
                          text: 'Avbryt',
                          options: FFButtonOptions(
                            width: 100.0,
                            height: 50.0,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Outfit',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                        ).animateOnPageLoad(animation),
                        FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: 'Lagre',
                          options: FFButtonOptions(
                            width: 170.0,
                            height: 50.0,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Outfit',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                            elevation: 3.0,
                            borderRadius: BorderRadius.circular(40.0),
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
      ),
    );
    //},
    //);
  }
}
