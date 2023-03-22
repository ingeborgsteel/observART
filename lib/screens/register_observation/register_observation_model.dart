import 'package:hvart_har_du_sett/models/species.dart';

import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/components/species_picker/species_picker_widget.dart';
import '/components/species_tile_form/species_tile_form_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterObservationModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for speciesTileForm component.
  late SpeciesTileFormModel speciesTileFormModel;

  late List<Species> species;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    speciesTileFormModel = createModel(context, () => SpeciesTileFormModel());
    species = [];
  }

  void dispose() {
    speciesTileFormModel.dispose();
  }

  /// Additional helper methods are added here.

  void addSpecies(List<Species> newSpecies) {
    species.addAll(newSpecies);
  }
}
