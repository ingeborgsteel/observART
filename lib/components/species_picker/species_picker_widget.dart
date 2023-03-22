import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hvart_har_du_sett/backend/api_models/species_search_result.dart';

import '../../backend/api/api.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'species_picker_model.dart';

export 'species_picker_model.dart';

class SpeciesPickerWidget extends StatefulWidget {
  final Function(Iterable<SpeciesSearchResult> newSpecies) addSpecies;

  const SpeciesPickerWidget(
      {Key? key, this.userProfile, required this.addSpecies})
      : super(key: key);

  final DocumentReference? userProfile;

  @override
  _SpeciesPickerWidgetState createState() => _SpeciesPickerWidgetState();
}

class _SpeciesPickerWidgetState extends State<SpeciesPickerWidget>
    with TickerProviderStateMixin {
  late SpeciesPickerModel _model;

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

  void _taxonSearch(String searchTerm) async {
    setState(() {
      _model.searchResult =
          _model.searchResult.where((species) => species.selected).toList();
      _model.loading = true;
    });
    final response = await api.taxon.searchForTaxons(searchTerm);
    if (response.statusCode != 200) {
      throw Exception('Failed to load search result');
    }
    final json = jsonDecode(response.body) as List;
    print(json);
    List<SpeciesSearchResult?> searchResult = json.map((taxon) {
      try {
        return SpeciesSearchResult.fromJson(taxon);
      } catch (e) {
        return null;
      }
    }).toList();

    setState(() {
      _model.searchResult.addAll(searchResult.withoutNulls);
      _model.loading = false;
    });
  }

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SpeciesPickerModel());

    _model.searchController ??= TextEditingController();
    createAnimation(
      animation,
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
        decoration: const BoxDecoration(
          color: Color(0xD60E151B),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 75,
              left: 0,
              right: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 710.0,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                        top: 70,
                        bottom: 100,
                        left: 0,
                        right: 0,
                        child: _model.loading
                            ? const Center(child: CircularProgressIndicator())
                            : _model.searchResult.isEmpty
                                ? Center(
                                    child: Text('Ingen søkeresultater',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2))
                                : ListView(
                                    children: _model.searchResult
                                        .map((SpeciesSearchResult species) =>
                                            Theme(
                                              data: ThemeData(
                                                unselectedWidgetColor:
                                                    const Color(0xFF95A1AC),
                                              ),
                                              child: CheckboxListTile(
                                                value: species.selected,
                                                onChanged: (newValue) async {
                                                  setState(() => _model
                                                      .searchResult
                                                      .firstWhere((element) =>
                                                          element == species)
                                                      .selected = newValue!);
                                                },
                                                title: Text(
                                                  species.name ?? '',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title3,
                                                ),
                                                subtitle: Text(
                                                  species.scientificName ?? '',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText2,
                                                ),
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                dense: false,
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                              ),
                                            ))
                                        .toList())),
                    Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(children: [
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
                                'Legg til arter',
                                style: FlutterFlowTheme.of(context).title3,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: TextFormField(
                                controller: _model.searchController,
                                obscureText: false,
                                decoration:
                                    inputDecoration('Søk etter arter...'),
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontWeight: FontWeight.normal,
                                    ),
                                validator: _model.searchControllerValidator
                                    .asValidator(context),
                                onChanged: (String value) {
                                  _taxonSearch(value);
                                },
                              ).animateOnPageLoad(animation),
                            ),
                          ]),
                        )),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                            ).animateOnPageLoad(animation),
                            FFButtonWidget(
                              onPressed: () async {
                                widget.addSpecies(_model.searchResult
                                    .where((element) => element.selected));
                                Navigator.pop(context);
                              },
                              text: 'Legg til',
                              options: FFButtonOptions(
                                width: 170.0,
                                height: 50.0,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
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
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                            ).animateOnPageLoad(animation),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
