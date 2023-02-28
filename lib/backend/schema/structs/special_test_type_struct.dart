import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'special_test_type_struct.g.dart';

abstract class SpecialTestTypeStruct
    implements Built<SpecialTestTypeStruct, SpecialTestTypeStructBuilder> {
  static Serializer<SpecialTestTypeStruct> get serializer =>
      _$specialTestTypeStructSerializer;

  String? get name;

  String? get description;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(SpecialTestTypeStructBuilder builder) =>
      builder
        ..name = ''
        ..description = ''
        ..firestoreUtilData = FirestoreUtilData();

  SpecialTestTypeStruct._();
  factory SpecialTestTypeStruct(
          [void Function(SpecialTestTypeStructBuilder) updates]) =
      _$SpecialTestTypeStruct;
}

SpecialTestTypeStruct createSpecialTestTypeStruct({
  String? name,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SpecialTestTypeStruct(
      (s) => s
        ..name = name
        ..description = description
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

SpecialTestTypeStruct? updateSpecialTestTypeStruct(
  SpecialTestTypeStruct? specialTestType, {
  bool clearUnsetFields = true,
}) =>
    specialTestType != null
        ? (specialTestType.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addSpecialTestTypeStructData(
  Map<String, dynamic> firestoreData,
  SpecialTestTypeStruct? specialTestType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (specialTestType == null) {
    return;
  }
  if (specialTestType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && specialTestType.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final specialTestTypeData =
      getSpecialTestTypeFirestoreData(specialTestType, forFieldValue);
  final nestedData =
      specialTestTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = specialTestType.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getSpecialTestTypeFirestoreData(
  SpecialTestTypeStruct? specialTestType, [
  bool forFieldValue = false,
]) {
  if (specialTestType == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(
      SpecialTestTypeStruct.serializer, specialTestType);

  // Add any Firestore field values
  specialTestType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSpecialTestTypeListFirestoreData(
  List<SpecialTestTypeStruct>? specialTestTypes,
) =>
    specialTestTypes
        ?.map((s) => getSpecialTestTypeFirestoreData(s, true))
        .toList() ??
    [];
