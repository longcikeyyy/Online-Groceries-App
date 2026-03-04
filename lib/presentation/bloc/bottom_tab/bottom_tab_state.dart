import 'package:equatable/equatable.dart';

class BottomTabState extends Equatable {
  final int currentIndex;

  const BottomTabState({this.currentIndex = 0});

  BottomTabState copyWith({int? currentIndex}) {
    return BottomTabState(currentIndex: currentIndex ?? this.currentIndex);
  }

  @override
  List<Object?> get props => [currentIndex];
}
