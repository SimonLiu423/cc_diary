import 'dart:async';

import 'package:cc_diary/core/model/diary_m.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'discover_event.dart';
part 'discover_state.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  DiscoverBloc() : super(DiscoverInitial()) {
    on<GetDiscover>(_onGetDiscover);
    on<SubmitComment>(_onSubmitComment);
  }

  FutureOr<void> _onGetDiscover(
      GetDiscover event, Emitter<DiscoverState> emit) async {
    emit(DiscoverLoading());
    await Future.delayed(const Duration(seconds: 1));
    emit(DiscoverLoaded(randomDiaries()));
  }

  FutureOr<void> _onSubmitComment(
      SubmitComment event, Emitter<DiscoverState> emit) {
    // submit comment to server
  }
}
