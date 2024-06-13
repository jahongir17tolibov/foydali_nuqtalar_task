import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foydali_nuqtalar_task/core/base/base_functions.dart';
import 'package:foydali_nuqtalar_task/core/constants/app_constants.dart';
import 'package:foydali_nuqtalar_task/feature/auth/domain/use_case/get_users_auth_state_use_case.dart';
import 'package:foydali_nuqtalar_task/feature/home/data/dto/books_dto.dart';
import 'package:foydali_nuqtalar_task/feature/home/domain/entity/home_style_model.dart';
import 'package:foydali_nuqtalar_task/feature/home/domain/use_case/get_books_content_use_case.dart';
import 'package:foydali_nuqtalar_task/feature/home/domain/use_case/get_current_locale_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.getCurrentLocaleUseCase,
    required this.getUsersAuthState,
    required this.getBooksContentResultUseCase,
  }) : super(const HomeState(status: HomeStatus.pure)) {
    on<OnHomeInitialEvent>(_onHomeInitialEvent);

    on<OnHomeRefreshEvent>(_onHomeRefreshEvent);

    on<OnHomeStyleButtonChangedEvent>(_onHomeStyleButtonChangedEvent);

    on<OnHomeChangeTextSizeEvent>(_onHomeChangeTextSizeEvent);

    on<OnHomeChangeFontFamilyEvent>(_onHomeChangeFontFamilyEvent);

    on<OnHomeChangeTextAlignEvent>(_onHomeChangeTextAlignEvent);

    on<OnHomeSettingsButtonClickEvent>(_onHomeSettingsButtonClickEvent);
  }

  final GetCurrentLocaleUseCase getCurrentLocaleUseCase;
  final GetUsersAuthState getUsersAuthState;
  final GetBooksContentResultUseCase getBooksContentResultUseCase;

  FutureOr<void> _onHomeInitialEvent(
    OnHomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.onLoading, changedStyle: event.initialModel));

    await _getBaseHomeStates(emit);
    await _getContentBooks(emit);
  }

  FutureOr<void> _onHomeRefreshEvent(
    OnHomeRefreshEvent event,
    Emitter<HomeState> emit,
  ) async {
    await _getBaseHomeStates(emit);
    await _getContentBooks(emit);
  }

  FutureOr<void> _onHomeStyleButtonChangedEvent(
    OnHomeStyleButtonChangedEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(changedStyle: event.homeStyleModel, checkedStyleIndex: event.index));
  }

  FutureOr<void> _onHomeChangeTextSizeEvent(
    OnHomeChangeTextSizeEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(homeTextSize: event.size));
  }

  FutureOr<void> _onHomeChangeFontFamilyEvent(
    OnHomeChangeFontFamilyEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(homeFontFamily: event.font));
  }

  FutureOr<void> _onHomeChangeTextAlignEvent(
    OnHomeChangeTextAlignEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(homeTextAlign: !state.homeTextAlign));
  }

  FutureOr<void> _onHomeSettingsButtonClickEvent(
    OnHomeSettingsButtonClickEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(settingsOpened: !state.settingsOpened));
  }

  Future<void> _getBaseHomeStates(Emitter<HomeState> emit) async {
    await getCurrentLocaleUseCase.execute().then((value) {
      emit(state.copyWith(currentLocale: value));
    });

    await getUsersAuthState.execute().then((value) {
      emit(state.copyWith(userIsAuthenticated: value != null));
    });
  }

  Future<void> _getContentBooks(Emitter<HomeState> emit) async {
    await getBooksContentResultUseCase.execute().then((result) {
      printOnDebug(result.results!.first.translate!.uz!.context!);
      if (result.results != null) {
        printOnDebug(result.results!.first.translate!.uz!.context!);
        emit(state.copyWith(contentBooks: result.results, status: HomeStatus.onSuccess));
      }
    });
  }
}
