import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(home: Home(),));
}

