import 'dart:async';
import 'dart:ffi';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'observation_record.g.dart';

abstract class ObservationRecord
    implements Built<ObservationRecord, ObservationRecordBuilder> {
  static Serializer<ObservationRecord> get serializer =>
      _$observationRecordSerializer;

  String? get locationName;

  Float? get accuracy;

  DateTime? get startTime;

  DateTime? get endTime;

  String? get comment;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;

  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ObservationRecordBuilder builder) => builder
    ..locationName = ''
    ..comment = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('observations');

  static Stream<ObservationRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ObservationRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ObservationRecord._();

  factory ObservationRecord([void Function(ObservationRecordBuilder) updates]) =
      _$ObservationRecord;

  static ObservationRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createObservationRecordData({
  String? locationName,
  String? comment,
  Float? accuracy,
  DateTime? startTime,
  DateTime? endTime,
  String? appointmentEmail,
}) {
  final firestoreData = serializers.toFirestore(
    ObservationRecord.serializer,
    ObservationRecord((a) => a
      ..locationName = locationName
      ..comment = comment
      ..accuracy = accuracy
      ..startTime = startTime
      ..endTime = endTime),
  );

  return firestoreData;
}
