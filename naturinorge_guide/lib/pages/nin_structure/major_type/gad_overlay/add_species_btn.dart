import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/gad_overlay/species_selector.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_provider.dart';
import 'package:provider/provider.dart';

class AddSpecieButtons extends StatelessWidget {
  const AddSpecieButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        NeumorphicButton(
          child: Text('Add specie'), // TODO translation
          onPressed: () => showDialog(
              context: context, builder: (context) => SpeciesSelector()),
        ),
        if (Provider.of<MajorTypeProvider>(context).selectedSpecies.length > 0)
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 26,
                ),
                Expanded(
                  child: NeumorphicToggle(
                    children: [
                      ToggleElement(
                          foreground: NeumorphicIcon(
                            Icons.visibility,
                            style: NeumorphicStyle(color: Colors.black87),
                          ),
                          background: Center(
                            child: NeumorphicIcon(
                              Icons.visibility,
                              style: NeumorphicStyle(color: Colors.black26),
                            ),
                          )),
                      ToggleElement(
                          foreground: NeumorphicIcon(
                            Icons.visibility_off,
                            style: NeumorphicStyle(color: Colors.black87),
                          ),
                          background: Center(
                            child: NeumorphicIcon(
                              Icons.visibility_off,
                              style: NeumorphicStyle(color: Colors.black26),
                            ),
                          )),
                    ],
                    thumb: Neumorphic(),
                    onChanged: (idx) =>
                        Provider.of<MajorTypeProvider>(context, listen: false)
                            .setShowGad(idx),
                    selectedIndex:
                        Provider.of<MajorTypeProvider>(context).showGad,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
