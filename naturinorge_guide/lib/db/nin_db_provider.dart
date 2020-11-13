import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:naturinorge_guide/db/nin_db.dart';

class NinDatabaseProvider extends ChangeNotifier {
  final NiNDatabase _db;

  NinDatabaseProvider(this._db);

  NiNDatabase get db => _db;
}
