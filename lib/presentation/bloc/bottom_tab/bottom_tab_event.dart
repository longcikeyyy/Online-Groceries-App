abstract class BottomTabEvent {}

class OnChangeTabEvent extends BottomTabEvent {
  final int tabIndex;

  OnChangeTabEvent(this.tabIndex);
}
