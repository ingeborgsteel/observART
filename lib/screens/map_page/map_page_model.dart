import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_search/mapbox_search.dart';
import 'package:provider/provider.dart';

import '/components/main_logo/main_logo_widget.dart';
import '/components/observation_form/observation_form_widget.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/lat_lng.dart';

class MapPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for main_Logo component.
  late MainLogoModel mainLogoModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mainLogoModel = createModel(context, () => MainLogoModel());
  }

  void dispose() {
    mainLogoModel.dispose();
  }

  /// Additional helper methods are added here.

}
