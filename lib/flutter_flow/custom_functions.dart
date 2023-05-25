import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

double addBookingPaymentBalance(
  int? current,
  int? itemprice,
) {
  current = current! + itemprice!;
  return current.toDouble(); // Add your function code here!
}

int addCartTotal(
  int? current,
  int? itemprice,
) {
  current = current! + itemprice!;
  return current; // Add your function code here!
}

int removeFromCart(
  int? current,
  int? itemprice,
) {
  current = current! - itemprice!;
  return current;
  // Add your function code here!
}

List<String> keyWordsMultipleFields(
  String? field1,
  String? field2,
) {
  var string1 = field1!.toLowerCase();
  var string2 = field2!.toLowerCase();
  var inputString = string1 + " " + string2;
  final list = inputString.split(" ");
  var keywords = [
    " ",
    string1,
    string2,
  ];

  var listIterator = list.iterator;
  while (listIterator.moveNext()) {
    var appendString = "";
    listIterator.current.runes.forEach((int rune) {
      appendString += String.fromCharCode(rune);
      keywords.add(appendString);
    });
    inputString = inputString.replaceAll(listIterator.current.toString(), " ");
  }
  return keywords;

  return keywords;
}

DateTime getDayToday() {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  return today;
}

bool getDayIsWeekday(DateTime? date) {
  bool result;

  if (date!.weekday != 7) {
    result = true;
  } else {
    result = false;
  }
  // var nextWeek = new DateTime.now().add(new Duration(days: (dateToday.weekday < 6) ? 7 - dateToday.weekday : 0));
  return result;
}

int doubletoInt(
  double? durationDouble,
  double? defaultValue,
) {
  // convert double to int
  if (durationDouble is double) {
    int duration = durationDouble.toInt();
    return duration;
  } else {
    return defaultValue!.toInt();
  }
}

int doubletoIntCopy(double? durationDouble) {
  // convert double to int
  if (durationDouble is double) {
    int duration = durationDouble.toInt();
    return duration;
  } else {
    return 0;
  }
}

double intToDouble(int? amountInt) {
  // convert int to double
  return (amountInt! + 0.0).toDouble();
}

String isPatientFillDetails(
  BookingsRecord? booking,
  String? string,
) {
  // check if boolean field in document is true and return string field , if false return null
  var _isUserPatient = booking!.userPatient;
  var returnString;
  if (_isUserPatient == true && string == 'firstname') {
    returnString = booking.firstname;
  } else if (_isUserPatient == true && string == 'lastname') {
    returnString = booking.lastname;
  } else if (_isUserPatient == true && string == 'phonenumber') {
    returnString = booking.phonenumber;
  } else if (_isUserPatient == true && string == 'sex') {
    returnString = booking.sex;
  } else if (_isUserPatient == true && string == 'emailaddress') {
    returnString = booking.emailaddress;
  } else if (_isUserPatient == true && string == 'd_o_b') {
    returnString = booking.dOB;
  } else {
    return 'error';
  }
  return returnString;
  return returnString;
}

String isPatientFillFname(BookingsRecord? booking) {
  // check if boolean field in document is true and return string field , if false return null
  var _isUserPatient = booking!.userPatient;
  var returnString;
  if (_isUserPatient == true) {
    returnString = booking.firstname;
  } else {
    return 'error';
  }
  return returnString;
}

String datetoString(DateTime? dateGiven) {
  // Add your function code here! return timestamp as string
  //var formatter = new DateFormat('yyyy-MM-dd');
  var formatter = new DateFormat('yMMMMd');
  String formatted = formatter.format(dateGiven!);
  return formatted;
}

DateTime returntheDay(DateTime? date) {
  // Add your function code here!
  date = date ?? DateTime.now();
  var newDate = DateTime(date!.year, date.month, date.day);
  return newDate;
}

DateTime getNextWeekday() {
  // Add your function code here!
  DateTime currentWeekday;
  DateTime nextWeekDate;
  final today = DateTime.now();

  if (today.weekday < 7) {
    nextWeekDate = today;
  } else {
    nextWeekDate = today.add(const Duration(days: 1));
  }

  return nextWeekDate;
}

DateTime returnDOB(
  BookingsRecord? booking,
  DateTime? statedateofbirth,
  bool? dobEntered,
  bool? isPatient,
) {
  // Add your function code here!
  statedateofbirth = statedateofbirth ?? DateTime.now();
  dobEntered = dobEntered ?? false;
  isPatient = isPatient ?? false;
  DateTime? date;
  // check if document boolean value is true, return datetime field, if false return current date
  //check if user is patient and set dob value if so
  if (booking != null) {
    if (isPatient) {
      date = booking.dOB;
    } else {
      //check if the user is not the patient but has entered the dob
      if (!isPatient && dobEntered) {
        date = statedateofbirth;
      }
    }
  }
  return date ?? DateTime.now();
}

DateTime returnDOBLoader(
  BookingsRecord? booking,
  bool isPatient,
) {
  // Add your function code here!
  DateTime date;
  // check if document boolean value is true, return datetime field, if false return current date
  //check if user is patient and set dob value if so
  if (isPatient) {
    date = booking!.dOB ?? DateTime.now();
  } else {
    //return null
    date = DateTime(1980, 1, 20);
  }
  return date;
}

bool displayDOBButton(
  BookingsRecord? booking,
  bool? stateIsPatient,
  DateTime? stateDobVariable,
  bool? stateVarIsSet,
) {
  bool result;
  if (!booking!.userPatient!) {
    result = true;
  } else {
    result = false;
  }
  return result;
}

bool displayDOBField(
  BookingsRecord? booking,
  bool? stateIsPatient,
  DateTime? stateDobVariable,
  bool? stateVarIsSet,
) {
  bool result;
  if (!booking!.userPatient! && stateIsPatient!) {
    if (stateVarIsSet!) {
      result = true;
    } else {
      result = false;
    }
  } else {
    result = false;
  }
  return result;
}

String returnDateString(DateTime? date) {
  // Add your function code here!
  date = date ?? DateTime.now();
  var formatted = DateFormat('yMMMd').format(date!);
  return formatted;
}

String dobButtonString(
  bool? dobStateIsSet,
  DateTime? dob,
) {
  var dobString;
  var formatted;
  if (dobStateIsSet!) {
    dobString = DateFormat('yMMMd').format(dob!);
  } else {
    dobString = 'Enter Date';
  }
  return dobString;
}

String? scheduleButtonString(
  DateTime? scheduleDate,
  DateTime? nextWeekday,
) {
  var dobString;
  if (scheduleDate != null) {
    dobString = DateFormat('yMMMd').format(scheduleDate);
  } else {
    dobString = DateFormat('yMMMd').format(nextWeekday!);
  }
  return dobString;
}

DateTime getNextDay(DateTime? date) {
  DateTime nextDay = date!.add(Duration(days: 1));
  return nextDay;
}

bool isTestBooked(
  DocumentReference? testref,
  DocumentReference? bookingref,
  List<BookedTestsRecord>? bookedTests,
) {
  // check if document with matching parameters exists in list
  late var found;
  var end = false;
  while (!end) {
    if (bookedTests!.length > 0) {
      if (testref == bookedTests[0].testRef &&
          bookingref == bookedTests[0].bookingRef) {
        found = true;
        end = true;
      } else {
        found = false;
        end = true;
      }
    } else if (bookedTests.length == 0) {
      found = false;
      end = true;
    } else if (bookedTests.isEmpty) {
      return false;
    }
    bookedTests.removeAt(0);
  }
  return found;
}

bool isTestBookedCopy(
  DocumentReference? testRef,
  DocumentReference? bookingRef,
  List<BookedTestsRecord>? bookedTests,
) {
  // check if a document with matching parametersexists in list
  for (BookedTestsRecord bookedTest in bookedTests!) {
    if (testRef == bookedTest.testRef && bookingRef == bookedTest.bookingRef) {
      return true;
    }
  }
  ;
  return false;
}

String dateDay(DateTime? date) {
  var formatted;
  formatted = DateFormat('d').format(date!);
  return formatted;
}

String dateYear(DateTime? date) {
  var formatted;
  formatted = DateFormat('y').format(date!);
  return formatted;
}

String dateMonth(DateTime? date) {
  var formatted;
  //formatted = DateFormat('MMM').format(date);
  formatted = DateFormat('MMM').format(date!);
  return formatted;
}

int? add1(int? num) {
  return num! + 1;
}

bool invoiceFullAmountBooking(
  double? invoiceAmount,
  double? bookingtotal,
) {
  // compare two numbers and return true if they are equal
  return (invoiceAmount == bookingtotal);
}

bool invoiceFullAmount(
  double? invoiceAmount,
  double? paymentAmount,
) {
  // compare two numbers and return true if they are equal
  return (invoiceAmount == paymentAmount);
}

String returnBookingListSize(List<BookingsRecord>? tests) {
  // return number of elements in list
  int numberOfElementsINlist;
  if (tests!.isNotEmpty) {
    numberOfElementsINlist = tests.length;
  } else {
    numberOfElementsINlist = tests.length;
  }
  return numberOfElementsINlist.toString();
}

int returnTestListSizeCopy(List<DocumentReference>? tests) {
  // return number of elements in list
  int numberOfElementsINlist;
  if (tests!.isNotEmpty) {
    numberOfElementsINlist = tests.length;
  } else {
    numberOfElementsINlist = 0;
  }
  return numberOfElementsINlist;
}

int returnBookedTestListSize(List<BookedTestsRecord>? tests) {
  // return number of elements in list
  int numberOfElementsINlist;
  if (tests!.isNotEmpty) {
    numberOfElementsINlist = tests.length;
  } else {
    numberOfElementsINlist = 0;
  }
  return numberOfElementsINlist;
}

int returnInvoiceListSize(List<DocumentReference>? invoices) {
  // return number of elements in list
  int numberOfElementsINlist;
  if (invoices!.isNotEmpty) {
    numberOfElementsINlist = invoices.length;
  } else {
    numberOfElementsINlist = 0;
  }

  return numberOfElementsINlist;
}

List<BookingsRecord> returnTodayBookings(List<BookingsRecord>? bookings) {
  // return list of documents with a date value today
  DateTime today = new DateTime.now();
  List<BookingsRecord> todayBookings = bookings!.where((test) {
    if (DateTimeRange(start: test.scheduledDate!, end: test.scheduledDate!)
            .duration
            .compareTo(const Duration(days: 1)) ==
        0) {
      return true;
    } else {
      return false;
    }
  }).toList();

  return todayBookings;
}

int checkNewBookings(List<BookingsRecord>? bookingsList) {
  // return the total number of documents with the same date as today
  int count = 0;
  DateTime today = DateTime.now();
  for (var i = 0; i < bookingsList!.length; i++) {
    if (bookingsList[i].scheduledDate!.day == today.day) {
      count += 1;
    }
  }
  return count;
}

int checkNewTests(List<BookedTestsRecord>? testsList) {
  // return the total number of documents with the same date as today

  if (testsList!.isNotEmpty) {
    int count = 0;
    DateTime today = DateTime.now();
    for (var i = 0; i < testsList.length; i++) {
      if (testsList[i].scheduledDate!.day == today.day &&
          testsList[i].scheduledDate!.month == today.month &&
          testsList[i].scheduledDate!.year == today.year) {
        count += 1;
      }
    }
    return count;
  } else {
    return 0;
  }
}

double returnInvoiceAmountDue(
  double? paymentAmount,
  double? invoiceAmountDue,
) {
  // subtract two numbers and return the result
  return invoiceAmountDue! - paymentAmount!;
}

double returnBookingBalance(
  double? paymentAmount,
  double? bookingCurrentBalance,
) {
  // subtract two numbers and return the result
  return bookingCurrentBalance! - paymentAmount!;
}

String returnRef(DocumentReference? testRef) {
  return testRef!.id;
}

String returnRefCopy(DocumentReference? testRef) {
  return testRef!.id;
}

bool displayVerifyButton(
  bool? isPosted,
  bool? isVerified,
) {
  // return true if only one condition is true and return false if both conditions are true
  bool result;
  if (isPosted! && (!isVerified!)) {
    result = true;
  } else {
    result = false;
  }
  return result;
}

List<UsersRecord>? returnUserList(
  String? nameQuery,
  List<UsersRecord>? userList,
) {
  // filter firebase collection of documents by string if string is not null
  List<UsersRecord> list = <UsersRecord>[];
  if (nameQuery != null) {
    userList!.forEach((user) {
      if (user.firstName != null &&
              user.firstName!.toLowerCase().contains(nameQuery.toLowerCase()) ||
          user.lastName != null &&
              user.lastName!.toLowerCase().contains(nameQuery.toLowerCase())) {
        list.add(user);
      }
    });
  } else {
    list.addAll(userList!);
  }
  return list;
}

List<TestsRecord> returnSearchTests(
  String? nameQuery,
  List<TestsRecord>? testList,
) {
  // filter firebase collection of documents by string if string is not null
  List<TestsRecord> list = <TestsRecord>[];
  if (nameQuery != null) {
    testList!.forEach((test) {
      if (test.name != null &&
          test.name!.toLowerCase().contains(nameQuery.toLowerCase())) {
        list.add(test);
      }
    });
  } else {
    list.addAll(testList!);
  }
  return list;
}

List<TestPackagesRecord> returnSearchPackages(
  String? nameQuery,
  List<TestPackagesRecord>? packageList,
) {
  // filter firebase collection of documents by string if string is not null
  List<TestPackagesRecord> list = <TestPackagesRecord>[];
  if (nameQuery != null) {
    packageList!.forEach((package) {
      if (package.packageName != null &&
          package.packageName!
              .toLowerCase()
              .contains(nameQuery.toLowerCase())) {
        list.add(package);
      }
    });
  } else {
    list.addAll(packageList!);
  }
  return list;
}

DocumentReference returnStaff(
  String? displayName,
  List<StaffRecord>? staffList,
) {
  // filter firebase collection of documents by string and return single document
  StaffRecord foundStaff = new StaffRecord();

  staffList!.forEach((element) {
    if (element.displayName == displayName) {
      foundStaff = element;
    }
  });

  return foundStaff.reference;
}

List<UsersRecord> filterClients(List<UsersRecord>? usersList) {
  // filter a list of documents based on a boolean value not true
  var result =
      List<UsersRecord>.from(usersList!.where((e) => e.isStaff != true));
  return result;

  List<UsersRecord> list = <UsersRecord>[];
  usersList.forEach((user) {
    if (!user.isStaff!) {
      list.add(user);
    }
  });
  return list;
}

bool displayUnverifiedTag(TestedTestsRecord? testedTest) {
  // return boolean value based on two boolean fields in a document
  bool result;
  if (testedTest!.resultPosted! && !testedTest.isVerified!) {
    result = true;
  } else {
    result = false;
  }
  return result;
}

bool displayVerifiedTag(TestedTestsRecord? testedTest) {
  // return boolean value based on two boolean fields in a document
  bool result;
  if (testedTest!.resultPosted! && testedTest.isVerified!) {
    result = true;
  } else {
    result = false;
  }
  return result;
}

String camelCase(String? name) {
  // return string formatted in sentence case
  /* bool startsWithUppercase = name[0] == name[0].toUpperCase();
  String string = (startsWithUppercase)
      ? name[0].toUpperCase() + name.substring(1).toLowerCase()
      : name.toLowerCase();
  List<String> splitName = string.split(" ");
  List<String> nameList = List();
  splitName.forEach((f) {
    if (f.length > 0) {
      nameList.add(f[0].toUpperCase() + f.substring(1));
    }
  });
  return nameList.join(" "); */
  if (name!.isEmpty) {
    return "";
  } else {
    bool startsWithUppercase = name[0] == name[0].toUpperCase();
    String string = (startsWithUppercase)
        ? name[0].toUpperCase() + name.substring(1).toLowerCase()
        : name.toLowerCase();
    List<String> splitName = string.split(" ");
    List<String> nameList = [];
    var nameIterator = splitName.iterator;

    while (nameIterator.moveNext()) {
      if (nameIterator.current.isNotEmpty) {
        nameList.add(nameIterator.current[0].toUpperCase() +
            nameIterator.current.substring(1));
      }
    }
    return nameList.join(" ");
  }
}

String camelCaseCopy(String? name) {
  // return string formatted in sentence case
  if (name!.isEmpty) {
    return "";
  } else {
    bool startsWithUppercase = name[0] == name[0].toUpperCase();
    String string = (startsWithUppercase)
        ? name[0].toUpperCase() + name.substring(1).toLowerCase()
        : name.toLowerCase();
    List<String> splitName = string.split(" ");
    List<String> nameList = [];
    var nameIterator = splitName.iterator;

    while (nameIterator.moveNext()) {
      if (nameIterator.current.isNotEmpty) {
        nameList.add(nameIterator.current[0].toUpperCase() +
            nameIterator.current.substring(1));
      }
    }
    return nameList.join(" ");
  }
}

String upperCase(String? name) {
  // return string formatted in sentence case
  bool startsWithUppercase = name![0] == name[0].toUpperCase();
  String string = (startsWithUppercase)
      ? name[0].toUpperCase() + name.substring(1).toLowerCase()
      : name.toLowerCase();
  List<String> splitName = string.split(" ");
  List<String> nameList = [];
  splitName.forEach((f) {
    if (f.length > 0) {
      nameList.add(f[0].toUpperCase() + f.substring(1));
    }
  });
  return nameList.join(" ");
}

bool checkStringNull(String? string) {
  // remove white spaces and check if a string value is null
  String? data = string;
  if (string!.isEmpty) {
    return true;
  } else {
    return false;
  }
}

bool allTestsConfirmed(
  int? numTests,
  int? testsConfirmed,
) {
  // if two numbers are not equal to zero, and equal, return true
  if ((numTests == 0.0 || testsConfirmed == 0.0) |
      !(numTests == testsConfirmed)) {
    print('num tests = $numTests');
    print('tests confirmed = $testsConfirmed');
    return false;
  } else {
    return true;
  }
}

int checkTestListSize(
  int? listSize,
  int? itemIndex,
) {
  // Add your function code here!
  if (listSize! < 2) {
    return 0;
  } else {
    return itemIndex!;
  }
}

int testsConfirmed(
  List<BookedTestsRecord>? bookedTests,
  List<DocumentReference>? bookingTests,
) {
  // check if all the elements in one list are contained in another list
  int numTests = 0;
  for (int i = 0; i < bookedTests!.length; i++) {
    bool contains = false;
    for (int j = 0; j < bookingTests!.length; j++) {
      if (bookedTests[i].testRef == bookingTests[j]) {
        contains = true;
        break;
      }
    }
    if (contains) numTests++;
  }
  return numTests;
}

int stringToInt(String? string) {
  // parse string to integer
  return int.parse(string!);
}

double stringToDouble(String? string) {
  // parse string to integer
  return double.parse(string!);
}

TestedTestsRecord returnTestedTest(
  List<TestedTestsRecord>? testedTests,
  DocumentReference? bookedtestRef,
) {
  // query list for document with matching parameters
  final TestedTestsRecord toReturn =
      testedTests!.firstWhere((TestedTestsRecord test) {
    return test.bookedTestRef != null
        ? test.bookedTestRef!.path == bookedtestRef!.path
        : false;
  })!;
  return toReturn;
}

DocumentReference returnTestedTestRef(
  List<TestedTestsRecord>? testedTests,
  DocumentReference? bookedtestRef,
) {
  // query list for document with matching parameters
  final TestedTestsRecord toReturn =
      testedTests!.firstWhere((TestedTestsRecord test) {
    return test.bookedTestRef != null
        ? test.bookedTestRef!.path == bookedtestRef!.path
        : false;
  })!;
  return toReturn.reference;
}

bool testedTestSubmitted(TestedTestsRecord? testedtest) {
  // check if parameter is true
  if (testedtest == null) {
    return false;
  } else if (testedtest.resultPosted!) {
    return true;
  } else {
    return false;
  }
}

bool testedTestVerified(TestedTestsRecord? testedtest) {
  // check if parameter is true
  if (testedtest == null) {
    return false;
  } else if (testedtest.isVerified!) {
    return true;
  } else {
    return false;
  }
}

List<BookingsRecord> filterDayBookings(
  List<BookingsRecord>? calendarBookings,
  DateTime? calendarDate,
) {
  // return all documents with same day
  List<BookingsRecord> dayBookings = calendarBookings!
      .where((booking) => booking.scheduledDate!.day == calendarDate!.day)
      .toList();
  return dayBookings;
}

List<BookedTestsRecord> filterDayTests(
  List<BookedTestsRecord>? calendarTests,
  DateTime? calendarDate,
) {
  // return all documents with same day
  List<BookedTestsRecord> dayBookings = calendarTests!
      .where((bookedTest) => bookedTest.scheduledDate!.day == calendarDate!.day)
      .toList();
  return dayBookings;
}

int getDayTestsnumber(
  List<BookedTestsRecord>? calendarTests,
  DateTime? calendarDate,
) {
  // return all documents with same day
  List<BookedTestsRecord> dayBookings = calendarTests!
      .where((bookedTest) => bookedTest.scheduledDate!.day == calendarDate!.day)
      .toList();
  return dayBookings.length;
}

bool checkAllTestVerified(
  List<BookedTestsRecord>? bookedTests,
  List<TestedTestsRecord>? verifiedTests,
) {
  // check if all documents in one list have a corresponding document in another list
  if (bookedTests!.isEmpty && verifiedTests!.isEmpty) return true;
  if (bookedTests.length == verifiedTests!.length) {
    for (int i = 0; i < bookedTests.length; i++) {
      if (!verifiedTests
          .map((item) => item.bookedTestRef)
          .contains(bookedTests[i].reference)) {
        return false;
      }
    }
    return true;
  } else {
    return false;
  }
}

bool checktestsListsEqual(
  List<DocumentReference>? bookingTests,
  List<DocumentReference>? bookedTests,
) {
  // check if two lists contain the same elements
  if (bookingTests == null && bookedTests == null) return false;
  bool res = true;
  if (bookingTests!.length != bookedTests!.length) res = false;
  for (int i = 0; i < bookingTests.length; i++) {
    res = res && bookingTests.contains(bookedTests[i]);
  }
  return res;
}

DateTime setInvoiceDueDate(DateTime? datePicked) {
  // if datetime parameter is null, return next day from current timestamp
  if (datePicked == null)
    return DateTime.now().add(Duration(days: 1));
  else
    return datePicked;
}

bool isCategorySelected(String? categoryLocalState) {
  // return true if string variable is "all"
  if (categoryLocalState!.toLowerCase == 'All') {
    return true;
  } else
    return false;
}

bool isThisCategorySelected(
  String? categoryLocalState,
  String? categoryString,
  bool? allPackageCategories,
) {
  // return true if string variable is "all"
  if (allPackageCategories!) {
    return false;
  } else if (categoryLocalState!.toLowerCase == categoryString!.toLowerCase) {
    return true;
  } else {
    return false;
  }
}

List<TestsRecord> filterTests(
  bool? allcategories,
  String? catString,
  String? searchQuery,
  List<TestsRecord>? allTests,
) {
  // filter collection by category parameter if boolean value true
  //
  if (allcategories!) {
    if (searchQuery!.isNotEmpty) {
      return allTests!.where((t) => t.name!.contains(searchQuery)).toList();
    } else {
      return allTests!
          .where((t) => t.category!.toLowerCase() == catString!.toLowerCase())
          .toList();
    }
  } else {
    if (searchQuery!.isNotEmpty && !allcategories) {
      return allTests!
          .where((t) =>
              t.name!.contains(searchQuery) &&
              t.category!.toLowerCase() == catString!.toLowerCase())
          .toList();
    } else {
      return allTests!;
    }
  }
}

List<TestPackagesRecord> filterPackages(
  bool? allcategories,
  String? catString,
  String? searchQuery,
  List<TestPackagesRecord>? allPackages,
) {
  // filter collection by category parameter if boolean value true
  //
  if (allcategories!) {
    if (searchQuery!.isNotEmpty) {
      return allPackages!
          .where((t) => t.packageName!.contains(searchQuery))
          .toList();
    } else {
      return allPackages!
          .where((t) => t.category!.toLowerCase() == catString!.toLowerCase())
          .toList();
    }
  } else {
    if (searchQuery!.isNotEmpty && !allcategories) {
      return allPackages!
          .where((t) =>
              t.packageName!.contains(searchQuery) &&
              t.category!.toLowerCase() == catString!.toLowerCase())
          .toList();
    } else {
      return allPackages!;
    }
  }
}

List<TestsRecord> filterTestsByCategory(
  bool? allcategories,
  String? catString,
  List<TestsRecord>? allTests,
) {
  // filter collection by category parameter if boolean value true
  final List<TestsRecord> filteredList = [];
  if (catString!.isNotEmpty) {
    for (int i = 0; i < allTests!.length; i++) {
      if (allcategories == true) {
        filteredList.add(allTests[i]);
      } else if (allcategories == false) {
        if (allTests[i].category!.toLowerCase() == catString.toLowerCase()) {
          filteredList.add(allTests[i]);
        }
      }
    }
    return filteredList;
  } else {
    return allTests!;
  }
}

List<TestPackagesRecord> filterPackagesByCategory(
  bool? allcategories,
  String? catString,
  List<TestPackagesRecord>? allPackages,
) {
  // filter collection by category parameter if boolean value true
  final List<TestPackagesRecord> filteredList = [];
  if (catString!.isNotEmpty) {
    for (int i = 0; i < allPackages!.length; i++) {
      if (allcategories == true) {
        filteredList.add(allPackages[i]);
      } else if (allcategories == false) {
        if (allPackages[i].category!.toLowerCase() == catString.toLowerCase()) {
          filteredList.add(allPackages[i]);
        }
      }
    }
    return filteredList;
  } else {
    return allPackages!;
  }
}

String returnNewTestsifZero(int? tests) {
  // if list is empty or null return string
  String _returnThis;
  if (tests! > 0)
    // something
    _returnThis = tests.toString();
  else
    _returnThis = '0';
  return _returnThis;
}

bool userHasStaffRecord(
  DocumentReference? userRef,
  List<StaffRecord>? staffList,
) {
  // check list for record with a matching userRef field and return true if found
  if (userRef == null) {
    return false;
  }
  for (var staff in staffList!) {
    if (staff.userRef == userRef) {
      return true;
    }
  }
  return false;
}

int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}

bool bookingValidation(
  String? fName,
  String? lName,
  String? email,
  String? phone,
  String? sex,
  List<DocumentReference>? tests,
) {
  // validate form entries
  // missing entries:
  if (fName!.isEmpty ||
      lName!.isEmpty ||
      email!.isEmpty ||
      sex!.isEmpty ||
      tests!.isEmpty) {
    return false;
  } else {
    return true;
  }
}

String bookingValidator(
  String? fName,
  String? lName,
  String? email,
  String? phone,
  String? sex,
  List<DocumentReference>? tests,
) {
  // validate form entries
  // missing entries:
  late String err;
  if (fName!.isEmpty) {
    err = "fName";
  }
  if (lName!.isEmpty) {
    err = err + "lName";
  }
  if (email!.isEmpty) {
    err = err + "email";
  }
  if (sex!.isEmpty) {
    err = err + "sex";
  }
  if (tests!.isEmpty) {
    err = err + "tests";
  }
  return err;
}

double expandableSize(bool? isOpen) {
  // Add your function code here!
  if (isOpen!) {
    return 24;
  } else {
    return 14;
  }
}

List<String> splitProcedureString(String? procedureString) {
  // split string using comma
  return procedureString!.split(", ").map((String e) => e.trim()).toList();
}

List<NotificationsRecord> filterNotifications(
  List<NotificationsRecord>? allNotifications,
  DocumentReference? userRef,
) {
  // filter notifications if usersSeen array contains document reference
  List<NotificationsRecord> ret = [];
  allNotifications!.forEach((NotificationsRecord notification) {
    if (!notification.usersSeen!.contains(userRef)) {
      ret.add(notification);
    }
  });
  return ret;
}

String checkNullString(String? string) {
  // check if string is null
  return string != null ? string : "no data";
}

String returnInvoiceStatus(InvoicesRecord? invoice) {
  // return string if boolean value true and another string if not
  if (invoice != null) {
    if (invoice.reference != null && invoice.isPaid != null) {
      if (invoice.isPaid!) {
        if (invoice.fullAmount!) {
          return 'Paid in full';
        } else {
          return 'incomplete';
        }
      } else {
        return 'Pending';
      }
    } else {
      return 'Pending';
    }
  } else {
    return 'None';
  }
}

bool isTestnotVerifiedorFlagged(TestedTestsRecord? testedTest) {
  // return boolean value if isVerified true and isflagged not true
  if (testedTest!.isVerified == true && testedTest.isFlagged != true) {
    return true;
  } else {
    return false;
  }
}

bool isListEmpty(List<DocumentReference>? tests) {
  // check if list is empty
  if (tests!.length != 0) {
    return false;
  }
  return true;
}

List<String> returnReportFooter() {
  // Add your function code here!
  List<String> footerItems = [
    'Prof. Emily A. Rogena MB Ch.B UON M Med. (Path) UON Msc. (Forensic Med)',
    'Mrs. Susan M. Sitati Dip.Med.Lab.Tech. (UK) Dip.Med.lab.Tech. (E.A) H/Dip. Histopathology (E.A) Dip.Gyn.Cytology (UK)'
  ];

  return footerItems;
}

List<String> returnHeaderContacts() {
  List<String> headerContacts = ['0742540718', '0777540718'];
  return headerContacts;
}

String returnHeaderEmail() {
  String email = 'info@dmlaboratories.co.ke';
  return email;
}

List<DocumentReference>? filterTestPackTests(
  List<DocumentReference>? testPacks,
  List<DocumentReference>? allBookingTests,
) {
  // query firebase document and return list of tests from record

  List<DocumentReference> testPackFilter = [];
  List<DocumentReference> testPackTests = [];
  testPackFilter.addAll(allBookingTests!);
  //iterate through all the records in testPacks list and populate one list with all their tests records
  for (int i = 0; i < testPacks!.length; i++) {
    var testPack = FirebaseFirestore.instance
        .collection('test_Packages')
        .doc('${testPacks[i]}')
        .get()
        .then((snap) {
      // testPackTests.addAll(TestPackagesRecord().testsIncluded);
      // testPackTests. (TestPackagesRecord().testsIncluded!.asList);
      return testPacks[i];
      // return testPackTests;
    });

    for (int j = 0; j < testPackTests.length; j++) {
      testPackFilter.removeWhere((element) => testPackTests.contains(element));
      /*if (testPackFilter.contains(testPackTests[j])) {
        testPackFilter.remove(testPackTests[j]);
      }*/

    }

    //filteredList.add(allTests[i]);
  }
  return testPackFilter;
}

int calculateAge(DateTime? dOb) {
  // calculate age from date of birth
  DateTime currentDate = DateTime.now();
  int age = 0;
  age = currentDate.year - dOb!.year;
  return age;
}

List<DocumentReference> removeBookingPackageTests(
  List<DocumentReference>? testPackTests,
  List<DocumentReference>? allPackagesTestsList,
) {
  // remove all elements in allPackagesTestsList that are also in testPackTests
  //final packageTest = new List<DocumentReference>();
  var packageTest = List<DocumentReference>.empty(growable: true);
  for (final test in allPackagesTestsList!) {
    if (!testPackTests!.contains(test)) {
      packageTest.add(test);
    }
  }
  return packageTest;
}

List<DocumentReference> addBookingPackageTests(
  List<DocumentReference>? bookingPackageTests,
  List<DocumentReference>? packageTests,
) {
  // add all elements in packageTests into bookingPackageTests
  for (var doctest in packageTests!) {
    bookingPackageTests!.add(doctest);
  }
  return bookingPackageTests!;
}

List<DocumentReference> returnAllBookingTests(
  List<DocumentReference>? allPackageTests,
  List<DocumentReference>? allBookingTests,
) {
  // combine lists into one list
  List<DocumentReference> combinedTests = allPackageTests!;
  combinedTests.addAll(allBookingTests!);
  return combinedTests;
}

bool checkTestInBookingTests(
  DocumentReference? test,
  List<DocumentReference>? allBookingTests,
) {
  // check if list contains element
  for (final bookingTest in allBookingTests!) {
    if (bookingTest == test) {
      return true;
    }
  }
  return false;
}

bool checkTestPackageBookingHasDuplicates(
  List<DocumentReference>? allBookingTests,
  List<DocumentReference>? testPackTests,
) {
  // Check if allBookingTests contains any elements in testPackTests
  // loop will exit naturally if allBookingTests contains any elements in testPackTests:
  return allBookingTests!.any((element) => testPackTests!.contains(element));
}

List<DocumentReference> returnDuplicateTestsinBooking(
  List<DocumentReference>? allBookingTests,
  List<DocumentReference>? testPackageTests,
) {
  // return elements contained in both lists
  var duplicateTests = <DocumentReference>[];
  allBookingTests!.forEach((e) {
    if (testPackageTests!.contains(e)) {
      duplicateTests.add(e);
    }
  });
  return duplicateTests;
}

List<DateTime> returnTestsDates(
  List<TestedTestsRecord>? testedtests,
  DateTime? date,
) {
  // return list of TestedTest  documents where date_conducted is within the past seven days
  List<TestedTestsRecord>? tests = [];

  final List<DateTime> dates = List.generate(
      7, (index) => date!.subtract(Duration(days: index)).toUtc());

  return dates.reversed.toList();
}

List<TestPackagesRecord> returnPackagesinBooking(
  List<TestPackagesRecord>? packagesCollection,
  List<DocumentReference>? bookingPackagesList,
) {
  // return list of documents where reference is contained in TestPackagesRecord list
  List<TestPackagesRecord> newPackagesCollection = [];

  for (int i = 0; i < bookingPackagesList!.length; i++) {
    for (var j = 0; j < packagesCollection!.length; j++) {
      if (bookingPackagesList[i] == packagesCollection[j].reference) {
        newPackagesCollection.add(packagesCollection[j]);
        break;
      }
    }
  }

  return newPackagesCollection;
}

List<TestPackagesRecord> returnPackagesContainingDuplicateTests(
  List<TestPackagesRecord>? bookingPackages,
  List<DocumentReference>? duplicateTests,
) {
  // return list of documents containing any elements in duplicateTests list
  List<TestPackagesRecord> matchList = [];

  for (var testpackage in bookingPackages!.toList()) {
    for (var test in testpackage!.testsIncluded!) {
      if (duplicateTests!.contains(test)) {
        matchList.add(testpackage);
      }
    }
  }
  return matchList;
}

List<DocumentReference> returnDuplicateTestsinPackage(
  TestPackagesRecord? testPackage,
  List<DocumentReference>? duplicateTests,
) {
  // return list of elements contained in both TestPackage and duplicateTests
  List<DocumentReference> duplicateTestsinPackage = [];

  testPackage!.testsIncluded!.forEach((testRef) {
    if (duplicateTests!.contains(testRef)) {
      if (!duplicateTestsinPackage.contains(testRef)) {
        duplicateTestsinPackage.add(testRef);
      }
    }
  });

  return duplicateTestsinPackage;
}

List<double> returnStats(
  List<TestedTestsRecord>? testedTests,
  DateTime? endDate,
) {
  // count records with created date for previous 7 days and generate list
  List<double> results = List<double>.filled(14, 0.0);
  for (int i = 0; i < 14; i++) {
    final dayStart = endDate!.subtract(Duration(days: 14));
    results[i] = testedTests!
        .where((booking) => booking.dateSampleCollected == dayStart)
        .toList()
        .length
        .toDouble();
    print(results[i]);
  }
  /*
  final resultList = List<double>.generate(14, (index) {
    final dayStart = DateTime(endDate.year, endDate.month, endDate.day);
    final dayEnd = DateTime(
        dayStart.year, dayStart.month, dayStart.day - index + 1, 23, 59, 59);
    return testedTests
        .where((booking) => booking.dateSampleCollected == dayEnd)
        .toList()
        .length
        .toDouble();
  }); */
  /* for (int i = 0; i < resultList.length; i++) {
    for (var test in testedTests.toList()) {
      if (test.dateSampleCollected == endDate) {
        resultList[i]++;
        endDate = endDate.subtract(Duration(days: 1));
      }
    }
  } */

  /*var totall = 0;
  for (int i = 0; i < resultList.length; i++) {
    totall = totall + resultList[i];
  }
  resultList.add(totall); */
  return results;
}

List<String> returnSexOptions() {
  // Add your function code here!
  var string = ['Male', 'Female'];
  return string;
}

bool checkBookingTests(BookingsRecord? booking) {
  if (booking!.testsIncluded!.length > 1) {
    return true;
  } else {
    return false;
  }
}

int returnBookingsTab(String? testVar) {
  // return integer based on string match
  if (testVar!.toLowerCase() == null || testVar.toLowerCase() == '') {
    return 1;
  }
  if (testVar.toLowerCase() == 'upcoming') {
    return 1;
  }
  if (testVar.toLowerCase() == 'past') {
    return 0;
  }
  if (testVar.toLowerCase() == 'notif') {
    return 2;
  }
  return 0;
}

List<String>? updateSpecialTestsList(
  List<String>? list,
  String? stringItem,
) {
  if (list != null) {
    //list.add(stringItem ?? ' ');
    list.remove(stringItem);
  } /*else {
    list!.add(stringItem ?? ' ');
  } */
  return list;
}

List<String>? updateSpecialTestsListItem(
  List<String>? list,
  String? stringItem,
  int index,
) {
  if (list != null) {
    list.add(stringItem ?? ' ');
  } else {
    list!.add(stringItem ?? ' ');
  }
  return list;
}

List<String>? returnSpecialTests(List<String>? specialTests) {
  if (specialTests != null) {
    return specialTests;
  } else {
    specialTests!.add(specialTests[0] ?? ' ');
  }
}

List<String> removeSpecialTestsitem(
  List<String> specialTests,
  int index,
) {
  if (specialTests != null && index > -1) {
    specialTests.removeAt(index);
    return specialTests.toList();
  } else
    return specialTests.toList();
}

int checkAttachmentsExist(List<String>? attachments) {
  // check if list is empty return 0 else return 100
  if (attachments?.isEmpty ?? true) {
    return 0;
  }
  return 100;
}

DocumentReference? returnTestedRef(BookedTestsRecord? bookedTest) {
// return testedtest record where booked test reference matches and test ref matches
  if (bookedTest == null) {
    return null;
  } else {
    final dynamic result = FirebaseFirestore.instance
        .collection('tested_tests')
        .where('booking_ref', isEqualTo: bookedTest.bookingRef)
        .where('test_ref', isEqualTo: bookedTest.testRef)
        .get();

    return result.docs[0].reference;
  }
}

String? returnTestResultsCompilationString(
    List<TestedTestsRecord>? testedTests) {
  String result = ' ';
  String desc = ' ';
  String testResult = ' ';
  if (testedTests != null) {
    for (TestedTestsRecord test in testedTests) {
      if (test != null) {
        desc = test.pathologistNote ?? ' ';
        if (test.hasTestPack != true) {
          testResult = test.testResult ?? ' ';
          /*TestsRecord thisTest =
              await TestsRecord.getDocumentOnce(test.testRef); */
          result += '\n' + testResult + '\n' + desc + '\n';
        }
      }
    }
  }
  return result;
}

List<DocumentReference> removeTestsfromList(
  List<DocumentReference>? testsToRemove,
  List<DocumentReference>? alltests,
) {
  // remove all items from one list that are in the other list
  if (testsToRemove == null || alltests == null) {
    return [];
  }
  List<DocumentReference> newList = [];
  for (DocumentReference test in alltests) {
    if (!testsToRemove.contains(test)) {
      newList.add(test);
    }
  }
  return newList;
}

List<int> returnTestsQuantity(
  List<TestedTestsRecord>? testedtests,
  DateTime? date,
) {
  // return list of TestedTest  documents where date_conducted is within the past seven days
  List<TestedTestsRecord>? tests = [];

  final dates = List.generate(
      7, (index) => date!.subtract(Duration(days: index)).toUtc().day);

  final counts = List.generate(7, (index) {
    final dateToCompare = dates[index];
    return tests
        .where((test) => test.dateConducted?.toUtc()?.day == dateToCompare)
        .length;
  });

  return counts.reversed.toList();
}
