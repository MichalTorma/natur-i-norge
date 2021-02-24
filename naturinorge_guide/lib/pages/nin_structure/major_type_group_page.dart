import 'package:flutter/material.dart';
import 'package:naturinorge_guide/pages/nin_structure/app_bar/nin_app_bar.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type_group/major_type_group_selector.dart';

class MajorTypeGroupPage extends StatelessWidget {
  const MajorTypeGroupPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          NinAppBar(),
          SliverToBoxAdapter(
            child: MajorTypeGroupSelector(),
          ),
        ],
      ),
    );
  }
}
