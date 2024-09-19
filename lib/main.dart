import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> nombres = [
    'Juan',
    'Pedro',
    'Maria',
    'Jose',
    'Ana',
    'Luis',
    'Carlos',
    'Sofia',
    'Laura',
    'Fernando',
  ];

  List<String> apellidos = [
    'Perez',
    'Gomez',
    'Rodriguez',
    'Gonzalez',
    'Fernandez',
    'Lopez',
    'Martinez',
    'Sanchez',
    'Diaz',
    'Torres',
  ];

  List<int> edades = [
    20,
    25,
    30,
    35,
    40,
    45,
    50,
    55,
    60,
    65,
  ];

  void _addUser() {
    var db = FirebaseFirestore.instance;

    final user = <String, dynamic>{
      'first': nombres[Random().nextInt(nombres.length)],
      'last': apellidos[Random().nextInt(apellidos.length)],
      'born': edades[Random().nextInt(edades.length)],
    };

// Add a new document with a generated ID
    db.collection("users").add(user).then(
          (DocumentReference doc) =>
              print('DocumentSnapshot added with ID: ${doc.id}'),
        );
  }

  getUsers() {
    var db = FirebaseFirestore.instance;
    return db.collection("users").get();
  }

  getStreamUsers() {
    var db = FirebaseFirestore.instance;
    return db.collection("users").snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder(
          stream: getStreamUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data.docs[index]['first']),
                    subtitle: Text(snapshot.data.docs[index]['last']),
                    trailing:
                        Text(snapshot.data.docs[index]['born'].toString()),
                    leading: IconButton(
                        onPressed: () {
                          var db = FirebaseFirestore.instance;
                          db
                              .collection("users")
                              .doc(snapshot.data.docs[index].id)
                              .delete();
                        },
                        icon: const Icon(Icons.delete)),
                  );
                },
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addUser,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
