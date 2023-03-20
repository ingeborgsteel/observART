import 'dart:async';

import 'package:built_value/built_value.dart';

import 'index.dart';
import 'serializers.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  String? get email;

  String? get password;

  String? get uid;

  int? get age;

  String? get ailments;

  FFLatLng? get location;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  String? get userSex;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;

  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..displayName = ''
    ..email = 'example@example.org'
    ..password = ''
    ..uid = ''
    ..age = 0
    ..ailments = ''
    ..phoneNumber = ''
    ..photoUrl = ''
    ..userSex = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UsersRecord._();

  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersRecordData({
  String? displayName,
  String? email,
  String? password,
  String? uid,
  int? age,
  String? ailments,
  FFLatLng? location,
  String? phoneNumber,
  String? photoUrl,
  DateTime? createdTime,
  String? userSex,
}) {
  final firestoreData = serializers.toFirestore(
    UsersRecord.serializer,
    UsersRecord(
      (u) => u
        ..displayName = displayName
        ..email = email
        ..password = password
        ..uid = uid
        ..age = age
        ..ailments = ailments
        ..location = location
        ..phoneNumber = phoneNumber
        ..photoUrl = photoUrl
        ..createdTime = createdTime
        ..userSex = userSex,
    ),
  );

  return firestoreData;
}
