import 'package:app_check_web/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  // see firebase_options.dart
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // provided my reCAPTCHA public key here
  // the secret one attached in Firebase Console
  // when enabling AppCheck for the web app
  await FirebaseAppCheck.instance.activate(
    webRecaptchaSiteKey: '6LeI_z8gAAAAANQVFAuG5fkiE7fVx7iyF1FDieOR',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MCVE'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Firestore value:',
            ),
            FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('test')
                  .doc('someDoc')
                  .get(),
              builder: (context,
                  AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                      snapshot) {
                // that's the place where tha app fails to get data and
                // returns snapshot error which says smth like
                // "cloud firestore: permission denied"
                if (snapshot.hasError) {
                  return Text(
                    snapshot.error.toString(),
                    style: const TextStyle(color: Colors.red),
                  );
                }
                if (!snapshot.hasData) {
                  return const Text("loading...");
                }
                return Text(
                  snapshot.data!.get('value'),
                  style: const TextStyle(color: Colors.green),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
