import 'package:online_groceries_app/presentation/bloc/bottom_tab/bottom_tab_event.dart';
import 'package:online_groceries_app/presentation/bloc/bottom_tab/bottom_tab_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomTabBloc extends Bloc<BottomTabEvent, BottomTabState> {
  BottomTabBloc() : super(const BottomTabState()) {
    on<OnChangeTabEvent>((event, emit) {
      emit(state.copyWith(currentIndex: event.tabIndex));
    });
  }
}
