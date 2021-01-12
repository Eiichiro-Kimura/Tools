import 'package:dazn_schedule/program_guide/program.dart';
import 'package:dazn_schedule/program_guide/program_guide.dart';
import 'package:dazn_schedule/view/program_guide_view.dart';
import 'package:dazn_schedule/view/search_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dazn Schedule',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Dazn Schedule'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Program>>(
        future: ProgramGuide().generate(),
        builder: (BuildContext context,
            AsyncSnapshot<List<Program>> snapshot) {

          return Column(
              children: [
                SearchView(context, _controller, (text) {setState(() {});}),
                Expanded(
                  child: SingleChildScrollView(
                    child: ProgramGuideView(context, snapshot, _controller),
                  ),
                )
              ]
          );
        },
      ),
    );
  }
}
