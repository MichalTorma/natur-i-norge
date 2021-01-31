import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_provider.dart';
import 'package:provider/provider.dart';

class SelectedSpeciesList extends StatelessWidget {
  const SelectedSpeciesList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var body = Provider.of<MajorTypeProvider>(context)
        .selectedSpecies
        .map((e) => ListTile(
              // tileColor: Colors.lightBlue,
              title: Text(e.specie.scientificName),
              subtitle: Text(e.specie.vernacularName),
              trailing: GestureDetector(
                child: NeumorphicIcon(
                  Icons.delete,
                  style: NeumorphicStyle(color: Colors.black45),
                  size: 40,
                ),
                onTap: () =>
                    Provider.of<MajorTypeProvider>(context, listen: false)
                        .removeSpecie(e.specie),
              ),
            ))
        .toList();
    return Column(
      children: body,
    );
  }
}
