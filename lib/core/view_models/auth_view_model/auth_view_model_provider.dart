import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/core/view_models/auth_view_model/auth_view_model.dart';

final authViewModelProvider = ChangeNotifierProvider(
  (ref) => AuthViewModel(),
);
