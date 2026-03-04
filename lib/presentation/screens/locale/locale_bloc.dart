import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries_app/presentation/screens/locale/locale_event.dart';
import 'package:online_groceries_app/presentation/screens/locale/locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc() : super(const LocaleState()) {
    on<OnChangeLocale>(_onChangeLocale);
  }

  /// handle local init
  /// take locale from local storage if needed

  void _onChangeLocale(OnChangeLocale event, Emitter<LocaleState> emit) {
    /// Save Locale to local storage if needed
    emit(state.copyWith(languageCode: event.languageCode));
  }
}
