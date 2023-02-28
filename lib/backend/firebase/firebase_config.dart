import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCu0DTEWT365HQGhsNepOTdXQhhMg7CijQ",
            authDomain: "dmlonline-303cc.firebaseapp.com",
            projectId: "dmlonline-303cc",
            storageBucket: "dmlonline-303cc.appspot.com",
            messagingSenderId: "946741237713",
            appId: "1:946741237713:web:94f54bceadb24bfa4372f0",
            measurementId: "G-5ZET5PPZR3"));
  } else {
    await Firebase.initializeApp();
  }
}
