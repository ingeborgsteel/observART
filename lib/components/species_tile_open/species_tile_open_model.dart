import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SpeciesTileOpenModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for count widget.
  TextEditingController? countController;
  String? Function(BuildContext, String?)? countControllerValidator;
  // State field(s) for sex widget.
  TextEditingController? sexController;
  String? Function(BuildContext, String?)? sexControllerValidator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    countController?.dispose();
    sexController?.dispose();
  }

  /// Additional helper methods are added here.

  String? get radioButtonValue => radioButtonController?.value;
}
