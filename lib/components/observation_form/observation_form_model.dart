import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ObservationFormModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for locationName widget.
  TextEditingController? locationNameController;
  String? Function(BuildContext, String?)? locationNameControllerValidator;

  // State field(s) for coObserver widget.
  TextEditingController? coObserverController;
  String? Function(BuildContext, String?)? coObserverControllerValidator;
  DateTime? datePicked1;

  // State field(s) for Slider widget.
  double? sliderValue;
  DateTime? startDate;
  DateTime? endDate;

  // State field(s) for comment widget.
  TextEditingController? commentController;
  String? Function(BuildContext, String?)? commentControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    startDate = getCurrentTimestamp;
    endDate = getCurrentTimestamp.add(const Duration(minutes: 30));
  }

  void dispose() {
    locationNameController?.dispose();
    coObserverController?.dispose();
    commentController?.dispose();
  }

  /// Additional helper methods are added here.

}
