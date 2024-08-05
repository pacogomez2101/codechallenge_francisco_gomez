import 'package:bloc/bloc.dart';
import 'package:disneycodechallenge_francisco_gomez/features/default/data/utils/name_list_util.dart';
import 'package:meta/meta.dart';

part 'default_event.dart';
part 'default_state.dart';

class DefaultBloc extends Bloc<DefaultEvent, DefaultState> {
  DefaultBloc() : super(DefaultInitial()) {
    on<RequestMapsData>((event, emit) {
      emit(DefaultWaiting());
      emit(DefaultDataReceived(
          haveReservationsNamesMap: NamesList.getHaveReservationsNamesMap(),
          needReservationsNamesMap: NamesList.getNeedReservationsNamesMap()));
    });
    on<UpdateHaveReservationsMaps>((event, emit) {
      emit(DefaultWaiting());
      Map<String, bool> temporal = Map.fromEntries(event.updatedList);

      if (event.updatedList[event.index].value) {
        temporal[event.updatedList[event.index].key] = false;
      } else {
        temporal[event.updatedList[event.index].key] = true;
      }

      emit(DefaultDataReceived(
          haveReservationsNamesMap: temporal.entries.toList(),
          needReservationsNamesMap: event.auxList));
    });
    on<UpdateNeedReservationsMaps>((event, emit) {
      emit(DefaultWaiting());
      Map<String, bool> temporal = Map.fromEntries(event.updatedList);

      if (event.updatedList[event.index].value) {
        temporal[event.updatedList[event.index].key] = false;
      } else {
        temporal[event.updatedList[event.index].key] = true;
      }

      emit(DefaultDataReceived(
          haveReservationsNamesMap: event.auxList,
          needReservationsNamesMap: temporal.entries.toList()));
    });
  }
}
