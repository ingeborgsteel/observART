// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'observation_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ObservationRecord> _$observationRecordSerializer =
    new _$ObservationRecordSerializer();

class _$ObservationRecordSerializer
    implements StructuredSerializer<ObservationRecord> {
  @override
  final Iterable<Type> types = const [ObservationRecord, _$ObservationRecord];
  @override
  final String wireName = 'ObservationRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ObservationRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.locationName;
    if (value != null) {
      result
        ..add('locationName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.comment;
    if (value != null) {
      result
        ..add('comment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.accuracy;
    if (value != null) {
      result
        ..add('accuracy')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Float)));
    }
    value = object.startTime;
    if (value != null) {
      result
        ..add('startTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.endTime;
    if (value != null) {
      result
        ..add('endTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  ObservationRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ObservationRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'locationName':
          result.locationName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'comment':
          result.comment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'accuracy':
          result.accuracy = serializers.deserialize(value,
              specifiedType: const FullType(Float)) as Float?;
          break;
        case 'startTime':
          result.startTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'endTime':
          result.endTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$ObservationRecord extends ObservationRecord {
  @override
  final String? locationName;
  @override
  final String? comment;
  @override
  final Float? accuracy;
  @override
  final DateTime? startTime;
  @override
  final DateTime? endTime;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ObservationRecord(
          [void Function(ObservationRecordBuilder)? updates]) =>
      (new ObservationRecordBuilder()..update(updates))._build();

  _$ObservationRecord._(
      {this.locationName,
      this.comment,
      this.accuracy,
      this.startTime,
      this.endTime,
      this.ffRef})
      : super._();

  @override
  ObservationRecord rebuild(void Function(ObservationRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ObservationRecordBuilder toBuilder() =>
      new ObservationRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ObservationRecord &&
        locationName == other.locationName &&
        comment == other.comment &&
        accuracy == other.accuracy &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, locationName.hashCode), comment.hashCode),
                    accuracy.hashCode),
                startTime.hashCode),
            endTime.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ObservationRecord')
          ..add('locationName', locationName)
          ..add('comment', comment)
          ..add('accuracy', accuracy)
          ..add('startTime', startTime)
          ..add('endTime', endTime)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ObservationRecordBuilder
    implements Builder<ObservationRecord, ObservationRecordBuilder> {
  _$ObservationRecord? _$v;

  String? _locationName;
  String? get locationName => _$this._locationName;
  set locationName(String? locationName) => _$this._locationName = locationName;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  Float? _accuracy;
  Float? get accuracy => _$this._accuracy;
  set accuracy(Float? accuracy) => _$this._accuracy = accuracy;

  DateTime? _startTime;
  DateTime? get startTime => _$this._startTime;
  set startTime(DateTime? startTime) => _$this._startTime = startTime;

  DateTime? _endTime;
  DateTime? get endTime => _$this._endTime;
  set endTime(DateTime? endTime) => _$this._endTime = endTime;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ObservationRecordBuilder() {
    ObservationRecord._initializeBuilder(this);
  }

  ObservationRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _locationName = $v.locationName;
      _comment = $v.comment;
      _accuracy = $v.accuracy;
      _startTime = $v.startTime;
      _endTime = $v.endTime;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ObservationRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ObservationRecord;
  }

  @override
  void update(void Function(ObservationRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ObservationRecord build() => _build();

  _$ObservationRecord _build() {
    final _$result = _$v ??
        new _$ObservationRecord._(
            locationName: locationName,
            comment: comment,
            accuracy: accuracy,
            startTime: startTime,
            endTime: endTime,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
