import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:crud_firebase/services/firebase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '3.7 Conexion con Firebase',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3.7 Conexión con Firebase'),
      ),
      body: FutureBuilder(
        future: getMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            // Lista de todos los datos
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Título: ${snapshot.data?[index]['titulo'] ?? ''}'),
                      Text('Año: ${snapshot.data?[index]['año'] ?? ''}'),
                      Text('Género: ${snapshot.data?[index]['genero'] ?? ''}'),
                      Text('Director: ${snapshot.data?[index]['director'] ?? ''}'),
                      Text('Sinopsis: ${snapshot.data?[index]['sinopsis'] ?? ''}'),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
