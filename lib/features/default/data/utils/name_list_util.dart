class NamesList {
  static const List<String> haveReservationsNames = [
    "Dale Gibson",
    "Jeremy Gibson",
    "a",
    "b",
    "c",
    "d",
    "f",
    "g",
    "h",
    "i",
    "k",
    "l",
    "m",
    "n",
  ];

  static const List<String> needReservationsNames = [
    "Linda Gibson",
    "Margaret Gibson",
  ];

  static List<MapEntry<String, bool>> getHaveReservationsNamesMap() {
    Map<String, bool> resultMap = {};
    for (var element in haveReservationsNames) {
      resultMap[element] = false;
    }
    return resultMap.entries.toList();
  }

  static List<MapEntry<String, bool>> getNeedReservationsNamesMap() {
    Map<String, bool> resultMap = {};
    for (var element in needReservationsNames) {
      resultMap[element] = false;
    }
    return resultMap.entries.toList();
  }
}
