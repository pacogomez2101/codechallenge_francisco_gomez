part of 'default_bloc.dart';

@immutable
sealed class DefaultState {}

final class DefaultInitial extends DefaultState {}

final class DefaultWaiting extends DefaultState {}

final class DefaultDataReceived extends DefaultState {
  final List<MapEntry<String, bool>> haveReservationsNamesMap;
  final List<MapEntry<String, bool>> needReservationsNamesMap;

  DefaultDataReceived(
      {required this.haveReservationsNamesMap,
      required this.needReservationsNamesMap});
}
