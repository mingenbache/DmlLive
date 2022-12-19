import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _isPatient = prefs.getBool('ff_isPatient') ?? _isPatient;
    _numTests = prefs.getInt('ff_numTests') ?? _numTests;
    _numTestDone = prefs.getInt('ff_numTestDone') ?? _numTestDone;
    _notifHeight = prefs.getDouble('ff_notifHeight') ?? _notifHeight;
    _proceedconfirmation =
        prefs.getBool('ff_proceedconfirmation') ?? _proceedconfirmation;
    _testPackTests = prefs
            .getStringList('ff_testPackTests')
            ?.map((path) => path.ref)
            .toList() ??
        _testPackTests;
    _testPackSubmit = prefs.getBool('ff_testPackSubmit') ?? _testPackSubmit;
    _firstTime = prefs.getBool('ff_firstTime') ?? _firstTime;
  }

  late SharedPreferences prefs;

  String _labRef = '';
  String get labRef => _labRef;
  set labRef(String _value) {
    notifyListeners();

    _labRef = _value;
  }

  DateTime? _datepicked;
  DateTime? get datepicked => _datepicked;
  set datepicked(DateTime? _value) {
    notifyListeners();
    if (_value == null) {
      return;
    }
    _datepicked = _value;
  }

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? _value) {
    notifyListeners();
    if (_value == null) {
      return;
    }
    _selectedDate = _value;
  }

  String _categorypicked = 'all';
  String get categorypicked => _categorypicked;
  set categorypicked(String _value) {
    notifyListeners();

    _categorypicked = _value;
  }

  bool _isPatient = false;
  bool get isPatient => _isPatient;
  set isPatient(bool _value) {
    notifyListeners();

    _isPatient = _value;
    prefs.setBool('ff_isPatient', _value);
  }

  bool _lastBookingPage = false;
  bool get lastBookingPage => _lastBookingPage;
  set lastBookingPage(bool _value) {
    notifyListeners();

    _lastBookingPage = _value;
  }

  DateTime? _calendarDate;
  DateTime? get calendarDate => _calendarDate;
  set calendarDate(DateTime? _value) {
    notifyListeners();
    if (_value == null) {
      return;
    }
    _calendarDate = _value;
  }

  bool _isSubmitted = false;
  bool get isSubmitted => _isSubmitted;
  set isSubmitted(bool _value) {
    notifyListeners();

    _isSubmitted = _value;
  }

  DateTime? _dob;
  DateTime? get dob => _dob;
  set dob(DateTime? _value) {
    notifyListeners();
    if (_value == null) {
      return;
    }
    _dob = _value;
  }

  bool _dobEntered = false;
  bool get dobEntered => _dobEntered;
  set dobEntered(bool _value) {
    notifyListeners();

    _dobEntered = _value;
  }

  String _userListQuery = '';
  String get userListQuery => _userListQuery;
  set userListQuery(String _value) {
    notifyListeners();

    _userListQuery = _value;
  }

  bool _pathologistassigned = false;
  bool get pathologistassigned => _pathologistassigned;
  set pathologistassigned(bool _value) {
    notifyListeners();

    _pathologistassigned = _value;
  }

  bool _technologistassigned = false;
  bool get technologistassigned => _technologistassigned;
  set technologistassigned(bool _value) {
    notifyListeners();

    _technologistassigned = _value;
  }

  double _numTestsDone = 0.0;
  double get numTestsDone => _numTestsDone;
  set numTestsDone(double _value) {
    notifyListeners();

    _numTestsDone = _value;
  }

  int _numTests = 0;
  int get numTests => _numTests;
  set numTests(int _value) {
    notifyListeners();

    _numTests = _value;
    prefs.setInt('ff_numTests', _value);
  }

  int _numTestDone = 0;
  int get numTestDone => _numTestDone;
  set numTestDone(int _value) {
    notifyListeners();

    _numTestDone = _value;
    prefs.setInt('ff_numTestDone', _value);
  }

  bool _allCategories = false;
  bool get allCategories => _allCategories;
  set allCategories(bool _value) {
    notifyListeners();

    _allCategories = _value;
  }

  double _notifHeight = 200;
  double get notifHeight => _notifHeight;
  set notifHeight(double _value) {
    notifyListeners();

    _notifHeight = _value;
    prefs.setDouble('ff_notifHeight', _value);
  }

  bool _proceedconfirmation = false;
  bool get proceedconfirmation => _proceedconfirmation;
  set proceedconfirmation(bool _value) {
    notifyListeners();

    _proceedconfirmation = _value;
    prefs.setBool('ff_proceedconfirmation', _value);
  }

  bool _assignTechnologist = false;
  bool get assignTechnologist => _assignTechnologist;
  set assignTechnologist(bool _value) {
    notifyListeners();

    _assignTechnologist = _value;
  }

  bool _reportLastPage = false;
  bool get reportLastPage => _reportLastPage;
  set reportLastPage(bool _value) {
    notifyListeners();

    _reportLastPage = _value;
  }

  List<String> _reportEmails = [];
  List<String> get reportEmails => _reportEmails;
  set reportEmails(List<String> _value) {
    notifyListeners();

    _reportEmails = _value;
  }

  void addToReportEmails(String _value) {
    notifyListeners();
    _reportEmails.add(_value);
  }

  void removeFromReportEmails(String _value) {
    notifyListeners();
    _reportEmails.remove(_value);
  }

  List<DocumentReference> _testPackTests = [];
  List<DocumentReference> get testPackTests => _testPackTests;
  set testPackTests(List<DocumentReference> _value) {
    notifyListeners();

    _testPackTests = _value;
    prefs.setStringList('ff_testPackTests', _value.map((x) => x.path).toList());
  }

  void addToTestPackTests(DocumentReference _value) {
    notifyListeners();
    _testPackTests.add(_value);
    prefs.setStringList(
        'ff_testPackTests', _testPackTests.map((x) => x.path).toList());
  }

  void removeFromTestPackTests(DocumentReference _value) {
    notifyListeners();
    _testPackTests.remove(_value);
    prefs.setStringList(
        'ff_testPackTests', _testPackTests.map((x) => x.path).toList());
  }

  bool _testPackSubmit = false;
  bool get testPackSubmit => _testPackSubmit;
  set testPackSubmit(bool _value) {
    notifyListeners();

    _testPackSubmit = _value;
    prefs.setBool('ff_testPackSubmit', _value);
  }

  String _packagecategoryPicked = 'all';
  String get packagecategoryPicked => _packagecategoryPicked;
  set packagecategoryPicked(String _value) {
    notifyListeners();

    _packagecategoryPicked = _value;
  }

  bool _allPackageCategories = false;
  bool get allPackageCategories => _allPackageCategories;
  set allPackageCategories(bool _value) {
    notifyListeners();

    _allPackageCategories = _value;
  }

  List<DocumentReference> _duplicateTests = [];
  List<DocumentReference> get duplicateTests => _duplicateTests;
  set duplicateTests(List<DocumentReference> _value) {
    notifyListeners();

    _duplicateTests = _value;
  }

  void addToDuplicateTests(DocumentReference _value) {
    notifyListeners();
    _duplicateTests.add(_value);
  }

  void removeFromDuplicateTests(DocumentReference _value) {
    notifyListeners();
    _duplicateTests.remove(_value);
  }

  DocumentReference? _duplicateTest;
  DocumentReference? get duplicateTest => _duplicateTest;
  set duplicateTest(DocumentReference? _value) {
    notifyListeners();
    if (_value == null) {
      return;
    }
    _duplicateTest = _value;
  }

  String _testsVar = '';
  String get testsVar => _testsVar;
  set testsVar(String _value) {
    notifyListeners();

    _testsVar = _value;
  }

  String _paymentsvar = '';
  String get paymentsvar => _paymentsvar;
  set paymentsvar(String _value) {
    notifyListeners();

    _paymentsvar = _value;
  }

  bool _firstTime = false;
  bool get firstTime => _firstTime;
  set firstTime(bool _value) {
    notifyListeners();

    _firstTime = _value;
    prefs.setBool('ff_firstTime', _value);
  }

  List<String> _images = [];
  List<String> get images => _images;
  set images(List<String> _value) {
    notifyListeners();

    _images = _value;
  }

  void addToImages(String _value) {
    notifyListeners();
    _images.add(_value);
  }

  void removeFromImages(String _value) {
    notifyListeners();
    _images.remove(_value);
  }

  List<String> _specialtests = [];
  List<String> get specialtests => _specialtests;
  set specialtests(List<String> _value) {
    notifyListeners();

    _specialtests = _value;
  }

  void addToSpecialtests(String _value) {
    notifyListeners();
    _specialtests.add(_value);
  }

  void removeFromSpecialtests(String _value) {
    notifyListeners();
    _specialtests.remove(_value);
  }

  int _specialTestsIndex = 0;
  int get specialTestsIndex => _specialTestsIndex;
  set specialTestsIndex(int _value) {
    notifyListeners();

    _specialTestsIndex = _value;
  }

  List<String> _updatedSpecialTests = [];
  List<String> get updatedSpecialTests => _updatedSpecialTests;
  set updatedSpecialTests(List<String> _value) {
    notifyListeners();

    _updatedSpecialTests = _value;
  }

  void addToUpdatedSpecialTests(String _value) {
    notifyListeners();
    _updatedSpecialTests.add(_value);
  }

  void removeFromUpdatedSpecialTests(String _value) {
    notifyListeners();
    _updatedSpecialTests.remove(_value);
  }

  bool _specialTestsAdded = false;
  bool get specialTestsAdded => _specialTestsAdded;
  set specialTestsAdded(bool _value) {
    notifyListeners();

    _specialTestsAdded = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
