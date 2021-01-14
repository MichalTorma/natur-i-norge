import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/gad_overlay/species_selector.dart';

class AddSpecieButton extends StatelessWidget {
  const AddSpecieButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      child: Text('Add specie'), // TODO translation
      onPressed: () =>
          showDialog(context: context, builder: (context) => SpeciesSelector()),
    );
  }
}
