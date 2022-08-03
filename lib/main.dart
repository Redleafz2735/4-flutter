import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/form._screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'แอพบัญชี'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
              icon: Icon(Icons.umbrella),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Fromscreen();
                }));
              },
            )
          ],
        ),
        body: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, int index) {
              return Card(
                elevation: 10,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: FittedBox(
                      child: Text("500"),
                    ),
                  ),
                  title: Text("รายการ"),
                  subtitle: Text("02/01/2021"),
                ),
              );
            }));
  }
}
