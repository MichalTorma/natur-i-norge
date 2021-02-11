import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/pages/nin_structure/nin_structure_provider.dart';
import 'package:provider/provider.dart';

class NinAppBar extends StatelessWidget {
  const NinAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var actions = List<Widget>.empty(growable: true);
    if (Provider.of<NinStructureProvider>(context).selectedMajorTypeGroup !=
        null)
      actions.add(NinAppBarAction(
          onTap: () => Provider.of<NinStructureProvider>(context, listen: false)
              .setScrollIndex(0),
          text: Provider.of<NinStructureProvider>(context)
              .selectedMajorTypeGroup
              .data
              .id));
    if (Provider.of<NinStructureProvider>(context).selectedMajorType != null)
      actions.add(NinAppBarAction(
          onTap: () => Provider.of<NinStructureProvider>(context, listen: false)
              .setScrollIndex(1),
          text: Provider.of<NinStructureProvider>(context)
              .selectedMajorType
              .data
              .order
              .toString()));
    return SliverAppBar(
      floating: true,
      title: Container(
        height: 60,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: actions,
        ),
      ),
      // actions: actions,
      leading: LeadingNinAppBar(),
    );
  }
}

class NinAppBarAction extends StatelessWidget {
  final Function() onTap;
  final String text;
  const NinAppBarAction({
    Key key,
    this.onTap,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1,
        child: GestureDetector(
          onTap: onTap,
          child: Center(
            child: Text(text, style: Theme.of(context).textTheme.headline3),
          ),
        ));
  }
}

class LeadingNinAppBar extends StatelessWidget {
  static double iconSize = 36;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Icon(
        Icons.home,
        size: iconSize,
      ),
    );
  }
}
