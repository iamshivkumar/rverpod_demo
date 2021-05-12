import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = FutureProvider.family<String, String>((ref, id) async {
  await Future.delayed(
    Duration(seconds: 1),
  );
  String email = id.split("|").first;
  return email;
});
