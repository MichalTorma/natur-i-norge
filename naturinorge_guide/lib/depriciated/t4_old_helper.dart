import 'package:flutter/material.dart';
import 'package:naturinorge_guide/details/details_view.dart';
import 'package:naturinorge_guide/filter_provider.dart';
import 'package:provider/provider.dart';

class T4HelpPageOld extends StatefulWidget {
  T4HelpPageOld({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _T4HelpPageOldState createState() => _T4HelpPageOldState();
}

class _T4HelpPageOldState extends State<T4HelpPageOld> {
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
    );
  }
}
