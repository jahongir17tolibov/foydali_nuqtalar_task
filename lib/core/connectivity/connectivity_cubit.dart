import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:foydali_nuqtalar_task/core/base/base_functions.dart';

part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit() : super(const ConnectivityState());

  StreamSubscription? _connectivitySubscription;

  Connectivity get _connectivity => Connectivity();

  void observeConnectivity() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      emit(state.copyWith(isConnected: result.last != ConnectivityResult.none));
      printOnDebug("on cubit: ${state.isConnected}");
    });
  }

  void dispose() {
    _connectivitySubscription?.cancel();
  }
}
