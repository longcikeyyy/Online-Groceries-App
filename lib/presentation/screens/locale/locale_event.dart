abstract class LocaleEvent {}

class OnChangeLocale extends LocaleEvent {
  final String languageCode;

  OnChangeLocale(this.languageCode);
}
