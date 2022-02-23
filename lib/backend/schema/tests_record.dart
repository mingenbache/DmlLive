import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tests_record.g.dart';

abstract class TestsRecord implements Built<TestsRecord, TestsRecordBuilder> {
  static Serializer<TestsRecord> get serializer => _$testsRecordSerializer;

  @nullable
  int get price;

  @nullable
  String get name;

  @nullable
  @BuiltValueField(wireName: 'home_test')
  bool get homeTest;

  @nullable
  String get description;

  @nullable
  double get duration;

  @nullable
  @BuiltValueField(wireName: 'duration_results')
  double get durationResults;

  @nullable
  String get category;

  @nullable
  @BuiltValueField(wireName: 'is_available')
  bool get isAvailable;

  @nullable
  @BuiltValueField(wireName: 'Keywords')
  BuiltList<String> get keywords;

  @nullable
  @BuiltValueField(wireName: 'update_date')
  DateTime get updateDate;

  @nullable
  String get updateRole;

  @nullable
  String get varianceMale;

  @nullable
  String get varianceFemale;

  @nullable
  String get varianceUnitsMale;

  @nullable
  String get varianceUnitsFemale;

  @nullable
  String get equipmentInfo;

  @nullable
  BuiltList<String> get procedure;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TestsRecordBuilder builder) => builder
    ..price = 0
    ..name = ''
    ..homeTest = false
    ..description = ''
    ..duration = 0.0
    ..durationResults = 0.0
    ..category = ''
    ..isAvailable = false
    ..keywords = ListBuilder()
    ..updateRole = ''
    ..varianceMale = ''
    ..varianceFemale = ''
    ..varianceUnitsMale = ''
    ..varianceUnitsFemale = ''
    ..equipmentInfo = ''
    ..procedure = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tests');

  static Stream<TestsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TestsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static TestsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => TestsRecord(
        (c) => c
          ..price = snapshot.data['price']
          ..name = snapshot.data['name']
          ..homeTest = snapshot.data['home_test']
          ..description = snapshot.data['description']
          ..duration = snapshot.data['duration']
          ..durationResults = snapshot.data['duration_results']
          ..category = snapshot.data['category']
          ..isAvailable = snapshot.data['is_available']
          ..keywords = safeGet(() => ListBuilder(snapshot.data['Keywords']))
          ..updateDate = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['update_date']))
          ..updateRole = snapshot.data['updateRole']
          ..varianceMale = snapshot.data['varianceMale']
          ..varianceFemale = snapshot.data['varianceFemale']
          ..varianceUnitsMale = snapshot.data['varianceUnitsMale']
          ..varianceUnitsFemale = snapshot.data['varianceUnitsFemale']
          ..equipmentInfo = snapshot.data['equipmentInfo']
          ..procedure = safeGet(() => ListBuilder(snapshot.data['procedure']))
          ..reference = TestsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<TestsRecord>> search(
          {String term,
          FutureOr<LatLng> location,
          int maxResults,
          double searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'tests',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  TestsRecord._();
  factory TestsRecord([void Function(TestsRecordBuilder) updates]) =
      _$TestsRecord;

  static TestsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTestsRecordData({
  int price,
  String name,
  bool homeTest,
  String description,
  double duration,
  double durationResults,
  String category,
  bool isAvailable,
  DateTime updateDate,
  String updateRole,
  String varianceMale,
  String varianceFemale,
  String varianceUnitsMale,
  String varianceUnitsFemale,
  String equipmentInfo,
}) =>
    serializers.toFirestore(
        TestsRecord.serializer,
        TestsRecord((t) => t
          ..price = price
          ..name = name
          ..homeTest = homeTest
          ..description = description
          ..duration = duration
          ..durationResults = durationResults
          ..category = category
          ..isAvailable = isAvailable
          ..keywords = null
          ..updateDate = updateDate
          ..updateRole = updateRole
          ..varianceMale = varianceMale
          ..varianceFemale = varianceFemale
          ..varianceUnitsMale = varianceUnitsMale
          ..varianceUnitsFemale = varianceUnitsFemale
          ..equipmentInfo = equipmentInfo
          ..procedure = null));
