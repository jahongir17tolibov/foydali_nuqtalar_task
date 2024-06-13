import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foydali_nuqtalar_task/feature/auth/domain/use_case/get_users_auth_state_use_case.dart';

part 'guide_state.dart';

class GuideCubit extends Cubit<GuideState> {
  GuideCubit({required this.getUsersAuthState}) : super(const GuideState());

  final GetUsersAuthState getUsersAuthState;

  FutureOr<void> getAuthToken() async {
    await getUsersAuthState.execute().then((value) {
      emit(GuideState(token: value));
    });
  }
}
