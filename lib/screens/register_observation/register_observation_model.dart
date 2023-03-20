import 'package:flutter/material.dart';

import '/components/species_tile_closed/species_tile_closed_widget.dart';
import '/components/species_tile_open/species_tile_open_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RegisterObservationModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for speciesTileOpen component.
  late SpeciesTileOpenModel speciesTileOpenModel;

  // Model for speciesTileClosed component.
  late SpeciesTileClosedModel speciesTileClosedModel1;

  // Model for speciesTileClosed component.
  late SpeciesTileClosedModel speciesTileClosedModel2;

  // Model for speciesTileClosed component.
  late SpeciesTileClosedModel speciesTileClosedModel3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    speciesTileOpenModel = createModel(context, () => SpeciesTileOpenModel());
    speciesTileClosedModel1 =
        createModel(context, () => SpeciesTileClosedModel());
    speciesTileClosedModel2 =
        createModel(context, () => SpeciesTileClosedModel());
    speciesTileClosedModel3 =
        createModel(context, () => SpeciesTileClosedModel());
  }

  void dispose() {
    speciesTileOpenModel.dispose();
    speciesTileClosedModel1.dispose();
    speciesTileClosedModel2.dispose();
    speciesTileClosedModel3.dispose();
  }

  /// Additional helper methods are added here.

}
