import 'package:equatable/equatable.dart';

class LocaleState extends Equatable {
  final String? languageCode;

  const LocaleState({this.languageCode = 'en'});

  LocaleState copyWith({String? languageCode}) {
    return LocaleState(languageCode: languageCode ?? this.languageCode);
  }

  @override
  List<Object?> get props => [languageCode];
}
