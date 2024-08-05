part of 'default_bloc.dart';

@immutable
sealed class DefaultEvent {}

class ChangeAppBarText extends DefaultEvent {
  final bool isVisibleHeaderOne;
  final bool isVisibleHeaderTwo;
  ChangeAppBarText(
      {required this.isVisibleHeaderOne, required this.isVisibleHeaderTwo});
}

class RequestMapsData extends DefaultEvent {
  RequestMapsData();
}

class UpdateHaveReservationsMaps extends DefaultEvent {
  final List<MapEntry<String, bool>> updatedList;
  final int index;
  final List<MapEntry<String, bool>> auxList;

  UpdateHaveReservationsMaps(
      {required this.updatedList, required this.index, required this.auxList});
}

class UpdateNeedReservationsMaps extends DefaultEvent {
  final List<MapEntry<String, bool>> updatedList;
  final int index;
  final List<MapEntry<String, bool>> auxList;

  UpdateNeedReservationsMaps(
      {required this.updatedList, required this.index, required this.auxList});
}
