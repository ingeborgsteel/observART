import 'dart:ffi';

import 'package:hvart_har_du_sett/backend/api_models/species_observation.dart';

class ObservationRecordImpl {
  String? locationName;

  String? coObserver;

  double? accuracy;

  DateTime? startTime;

  DateTime? endTime;

  String? comment;

  List<SpeciesObservation> species = [];

  ObservationRecordImpl(this.locationName, this.coObserver, this.accuracy,
      this.startTime, this.endTime, this.comment);
}
