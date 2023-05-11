import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  String? get role;

  @BuiltValueField(wireName: 'first_name')
  String? get firstName;

  @BuiltValueField(wireName: 'last_name')
  String? get lastName;

  String? get sex;

  @BuiltValueField(wireName: 'd_o_b')
  DateTime? get dOB;

  String? get password;

  @BuiltValueField(wireName: 'current_booking')
  DocumentReference? get currentBooking;

  @BuiltValueField(wireName: 'has_current_booking')
  bool? get hasCurrentBooking;

  bool? get isStaff;

  DateTime? get lastLogin;

  bool? get hasInitAccount;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..role = ''
    ..firstName = ''
    ..lastName = ''
    ..sex = ''
    ..password = ''
    ..hasCurrentBooking = false
    ..isStaff = false
    ..hasInitAccount = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => UsersRecord(
        (c) => c
          ..email = snapshot.data['email']
          ..displayName = snapshot.data['display_name']
          ..photoUrl = snapshot.data['photo_url']
          ..uid = snapshot.data['uid']
          ..createdTime = safeGet(() => DateTime.fromMillisecondsSinceEpoch(
              snapshot.data['created_time']))
          ..phoneNumber = snapshot.data['phone_number']
          ..role = snapshot.data['role']
          ..firstName = snapshot.data['first_name']
          ..lastName = snapshot.data['last_name']
          ..sex = snapshot.data['sex']
          ..dOB = safeGet(
              () => DateTime.fromMillisecondsSinceEpoch(snapshot.data['d_o_b']))
          ..password = snapshot.data['password']
          ..currentBooking =
              safeGet(() => toRef(snapshot.data['current_booking']))
          ..hasCurrentBooking = snapshot.data['has_current_booking']
          ..isStaff = snapshot.data['isStaff']
          ..lastLogin = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['lastLogin']))
          ..hasInitAccount = snapshot.data['hasInitAccount']
          ..ffRef = UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? role,
  String? firstName,
  String? lastName,
  String? sex,
  DateTime? dOB,
  String? password,
  DocumentReference? currentBooking,
  bool? hasCurrentBooking,
  bool? isStaff,
  DateTime? lastLogin,
  bool? hasInitAccount,
}) {
  final firestoreData = serializers.toFirestore(
    UsersRecord.serializer,
    UsersRecord(
      (u) => u
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..role = role
        ..firstName = firstName
        ..lastName = lastName
        ..sex = sex
        ..dOB = dOB
        ..password = password
        ..currentBooking = currentBooking
        ..hasCurrentBooking = hasCurrentBooking
        ..isStaff = isStaff
        ..lastLogin = lastLogin
        ..hasInitAccount = hasInitAccount,
    ),
  );

  return firestoreData;
}
