import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_state.dart';

class HomeNotifier extends Notifier<HomeState> {
  @override
  HomeState build() => const HomeState();

  void increment() {
    state = state.copyWith(counter: state.counter + 1);
  }
}

final homeProvider = NotifierProvider<HomeNotifier, HomeState>(
  HomeNotifier.new,
);