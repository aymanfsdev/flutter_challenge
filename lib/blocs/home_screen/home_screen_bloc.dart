import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';


class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(const HomeScreenState()) {
    on<HomeScreenInitEvent>(_onInit);
  }

  void _onInit(
      HomeScreenInitEvent event,
      Emitter<HomeScreenState> emit,
      ) async {
    emit(
        state.copyWith(
          status: false,
        )
    );
  }
}
