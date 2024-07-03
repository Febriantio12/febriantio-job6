import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StudentListScreen(),
    );
  }
}

class StudentListScreen extends StatefulWidget {
  @override
  _StudentListScreenState createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  List<String> students = [
    'Awan Restu Listiyanto',
    'Agus Priyanto',
    'Febriantio',
    'Sri Mulyaningsih',
    'Ade Firmansyah',
  ];

  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];

  int currentIndex = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => changeStudent());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void changeStudent() {
    setState(() {
      currentIndex = (currentIndex + 1) % students.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Mahasiswa'),
      ),
      body: Center(
        child: Text(
          students[currentIndex],
          style: TextStyle(
            fontSize: 24,
            color: colors[currentIndex],
          ),
        ),
      ),
    );
  }
}
