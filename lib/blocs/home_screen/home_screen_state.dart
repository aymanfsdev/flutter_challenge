part of 'home_screen_bloc.dart';

class HomeScreenState extends Equatable {
  const HomeScreenState({
    this.status = false,
  });

  final bool status;

  HomeScreenState copyWith({
    bool? status,
  }) {
    return HomeScreenState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
    status,
  ];
}
