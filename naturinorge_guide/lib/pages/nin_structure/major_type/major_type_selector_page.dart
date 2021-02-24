import 'package:flutter/material.dart';
import 'package:naturinorge_guide/pages/nin_structure/app_bar/nin_app_bar.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_selector.dart';

class MajorTypeSelectorPage extends StatelessWidget {
  const MajorTypeSelectorPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          NinAppBar(),
          SliverToBoxAdapter(
            child: MajorTypeSelector(),
          )
        ],
      ),
    );
  }
}
