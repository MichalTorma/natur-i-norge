import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:naturinorge_guide/db/db_adapters.dart';
import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:naturinorge_guide/details/detailed_adapter.dart';

class MinorTypeDescription extends StatefulWidget {
  final List<MinorTypeAdapter> minorTypes;

  const MinorTypeDescription({Key key, this.minorTypes}) : super(key: key);

  @override
  _MinorTypeDescriptionState createState() => _MinorTypeDescriptionState();
}

class _MinorTypeDescriptionState extends State<MinorTypeDescription>
    with SingleTickerProviderStateMixin {
  int selected = 0;
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: widget.minorTypes.length, vsync: this);
    _controller.addListener(() {
      if (_controller.index != selected) {
        setState(() {
          selected = _controller.index;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var mt = widget.minorTypes[selected];
    var body = List<Widget>.empty(growable: true);
    body.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        mt.minorType.name,
        style: Theme.of(context).textTheme.headline4,
        textAlign: TextAlign.center,
      ),
    ));
    if (mt.minorType.description != null) {
      body.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          mt.minorType.description,
          style: Theme.of(context).textTheme.subtitle2,
          textAlign: TextAlign.center,
        ),
      ));
    }
    mt.minorType.other.forEach((key, value) {
      body.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          key,
          style: Theme.of(context).textTheme.subtitle2,
          textAlign: TextAlign.center,
        ),
      ));
      body.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(value),
      ));
    });
    var tabs = widget.minorTypes
        .map((e) => Tab(
              text: e.minorType.name,
            ))
        .toList();

    return Dialog(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
              stretch: true,
              title: Text(mt.minorType.name),
              bottom: widget.minorTypes.length > 1
                  ? PreferredSize(
                      preferredSize: Size.fromHeight(50.0),
                      child: Container(
                        // width: 100,
                        child: TabBar(
                          controller: _controller,
                          // isScrollable: true,
                          tabs: tabs,
                        ),
                      ),
                    )
                  : null),
          SliverList(delegate: SliverChildListDelegate.fixed(body))
        ],
      ),

      // child: ListView(
      //   children: [
      //     // Text(minorType.name),
      //     // Text(minorType.description),
      //     // Text(minorType.other.toString())
      //   ],
      // ),
    );
  }
}
