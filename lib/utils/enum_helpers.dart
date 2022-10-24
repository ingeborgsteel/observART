import 'package:collection/collection.dart';

dynamic convertStringToEnum(String enumAsString, List<dynamic> enumValues) {
  final convertedString = enumValues
      .firstWhereOrNull((e) => convertEnumToString(e) == enumAsString);
  return convertedString;
}

dynamic convertEnumToString(dynamic enumValue) {
  return enumValue.toString().split('.').last;
}
