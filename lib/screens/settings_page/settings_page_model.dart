import 'package:flutter/material.dart';

import '/components/main_logo/main_logo_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SettingsPageModel extends FlutterFlowModel {
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
