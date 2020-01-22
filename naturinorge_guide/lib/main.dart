import 'package:flutter/material.dart';
import 'package:naturinorge_guide/db/db_description.dart';
import 'package:naturinorge_guide/details/details_view.dart';
import 'package:naturinorge_guide/details/map_provider.dart';
import 'package:naturinorge_guide/filter_provider.dart';
import 'package:naturinorge_guide/tools/my_theme.dart';
import 'package:preferences/preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  await PrefService.init(prefix: 'pref_');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FilterProvider>(
          create: (_) => FilterProvider(MyDatabase().t4Dao),
        ),
        ChangeNotifierProvider<MapProvider>(
          create: (_) => MapProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Natur i Norge',
        theme: myTheme,
        home: MyHomePage(title: 'Natur i Norge'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List<T4Data> data = [];

  @override
  Widget build(BuildContext context) {
    // if (data.length == 0){
    //   Provider.of<T4Dao>(context).allT4.then((allEntries) => {
    //       setState(() {
    //         data = allEntries;
    //       })
    //     });
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                ),
                onChanged: (mask) async {
                  await Provider.of<FilterProvider>(context, listen: false)
                      .filterMask(mask);
                  print(mask);
                }),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: Provider.of<FilterProvider>(context).data.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                    Provider.of<FilterProvider>(context).data[index].c_Art),
                subtitle: Text(Provider.of<FilterProvider>(context)
                    .data[index]
                    .c_NorskNavn),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsView(
                            data: Provider.of<FilterProvider>(context)
                                .data[index]))),
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
