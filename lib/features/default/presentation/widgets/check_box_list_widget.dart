import 'package:disneycodechallenge_francisco_gomez/features/default/presentation/bloc/default_bloc.dart';
import 'package:disneycodechallenge_francisco_gomez/features/default/presentation/widgets/checkbox_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckBoxListWidget extends StatelessWidget {
  const CheckBoxListWidget(
      this.currentList, this.supplementaryList, this.isFirstList,
      {super.key});

  final List<MapEntry<String, bool>> currentList;
  final List<MapEntry<String, bool>> supplementaryList;
  final bool isFirstList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: List.generate(
            currentList.length,
            (index) => Column(
                  children: [
                    GestureDetector(
                      onTap: isFirstList
                          ? () {
                              context.read<DefaultBloc>().add(
                                    UpdateHaveReservationsMaps(
                                      updatedList: currentList,
                                      index: index,
                                      auxList: supplementaryList,
                                    ),
                                  );
                            }
                          : () {
                              context.read<DefaultBloc>().add(
                                    UpdateNeedReservationsMaps(
                                      updatedList: currentList,
                                      index: index,
                                      auxList: supplementaryList,
                                    ),
                                  );
                            },
                      child: CheckboxItemWidget(
                        currentList[index].key,
                        currentList[index].value,
                      ),
                    ),
                    index != currentList.length - 1
                        ? const SizedBox(height: 20)
                        : Container()
                  ],
                )),
      ),
    );
  }
}
