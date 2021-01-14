import 'package:dazn_schedule/io/settings.dart';
import 'package:dazn_schedule/program_guide/program.dart';
import 'package:dazn_schedule/program_guide/program_guide.dart';
import 'package:dazn_schedule/view/program_guide_view.dart';
import 'package:dazn_schedule/view/search_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _settings = Settings();
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    _settings.init().then((value) => _updateScreen());
  }

  @override
  Widget build(BuildContext context) {
    return _settings.isValid ? _buildNormal(context) : _buildLoading(context);
  }

  Widget _buildLoading(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }

  Widget _buildNormal(BuildContext context) {
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
              SearchView(context, _controller, (text) { _updateScreen(); }),
              Expanded(
                child: SingleChildScrollView(
                  child: ProgramGuideView(
                      context,
                      snapshot,
                      _controller,
                      _settings.getStringValue(SettingsKind.googleApiClientId)
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { Navigator.of(context).pushNamed('/settings'); },
        tooltip: 'Settings',
        child: const Icon(Icons.settings),
      ),
    );
  }

  void _updateScreen() {
    setState(() {});
  }
}
