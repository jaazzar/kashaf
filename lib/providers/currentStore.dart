import 'package:flutter_riverpod/flutter_riverpod.dart';

class currentStore extends StateNotifier<int?> {
  currentStore() : super(null);

  void changeStore(int storeId) {
    state = storeId;
  }
}

final currentStoreProvider =
    StateNotifierProvider<currentStore, int?>((ref) => currentStore());
