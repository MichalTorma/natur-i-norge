import 'web_shared.dart';

Future<void> ensureDriftWebReady() => ensureDriftWebProbe().then((_) {});
