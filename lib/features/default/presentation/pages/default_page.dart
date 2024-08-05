import 'package:disneycodechallenge_francisco_gomez/core/constants/colors.dart';
import 'package:disneycodechallenge_francisco_gomez/core/constants/strings.dart';
import 'package:disneycodechallenge_francisco_gomez/features/default/presentation/bloc/default_bloc.dart';
import 'package:disneycodechallenge_francisco_gomez/features/default/presentation/widgets/bottom_advice_widget.dart';
import 'package:disneycodechallenge_francisco_gomez/features/default/presentation/widgets/check_box_list_widget.dart';
import 'package:disneycodechallenge_francisco_gomez/features/default/presentation/widgets/generic_button_widget.dart';
import 'package:disneycodechallenge_francisco_gomez/features/default/presentation/widgets/info_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DefaultPageState createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  final ScrollController scrollController = ScrollController();
  final GlobalKey keyHeaderOne = GlobalKey();
  final GlobalKey keyHeaderTwo = GlobalKey();
  final ValueNotifier<String> appbarTitle =
      ValueNotifier(AppStrings.headerText);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkVisibility();
    });

    scrollController.addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        checkVisibility();
      });
    });

    context.read<DefaultBloc>().add(RequestMapsData());
  }

  @override
  void dispose() {
    scrollController.removeListener(() {});
    scrollController.dispose();
    appbarTitle.dispose();
    super.dispose();
  }

  void checkVisibility() {
    RenderBox? boxHeaderOne =
        keyHeaderOne.currentContext?.findRenderObject() as RenderBox?;
    RenderBox? boxHeaderTwo =
        keyHeaderTwo.currentContext?.findRenderObject() as RenderBox?;

    if (boxHeaderOne == null || boxHeaderTwo == null) {
      return;
    }

    Offset positionHeaderOne = boxHeaderOne.localToGlobal(Offset.zero);
    Offset positionHeaderTwo = boxHeaderTwo.localToGlobal(Offset.zero);

    double screenHeight = MediaQuery.of(context).size.height;

    bool isVisibleHeaderOne = positionHeaderOne.dy < screenHeight &&
        positionHeaderOne.dy + boxHeaderOne.size.height > 0;

    bool isVisibleHeaderTwo = positionHeaderTwo.dy < screenHeight &&
        positionHeaderTwo.dy + boxHeaderTwo.size.height > 0;

    if (!isVisibleHeaderOne && isVisibleHeaderTwo) {
      appbarTitle.value = AppStrings.subtitle1;
    } else if (!isVisibleHeaderTwo && !isVisibleHeaderOne) {
      appbarTitle.value = AppStrings.subtitle2;
    } else {
      appbarTitle.value = AppStrings.headerText;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<DefaultBloc, DefaultState>(
      builder: (context, state) {
        if (state is DefaultDataReceived) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            appBar: AppBar(
              elevation: 1,
              backgroundColor: Colors.white,
              title: ValueListenableBuilder<String>(
                valueListenable: appbarTitle,
                builder: (context, value, child) {
                  return Text(
                    value,
                    style: TextStyle(
                      color: AppColors.headerColor,
                      fontWeight: FontWeight.w900,
                      fontSize: size.width * 0.04,
                    ),
                  );
                },
              ),
              centerTitle: appbarTitle.value == AppStrings.headerText,
              leading: appbarTitle.value != AppStrings.headerText
                  ? null
                  : Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.actionColor,
                      size: size.width * 0.05,
                    ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Container(
                          key: keyHeaderOne,
                          width: size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            AppStrings.subtitle1,
                            style: TextStyle(
                                color: AppColors.headerColor,
                                fontSize: size.width * 0.045,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                        const SizedBox(height: 20),
                        CheckBoxListWidget(
                          state.haveReservationsNamesMap,
                          state.needReservationsNamesMap,
                          true,
                        ),
                        const SizedBox(height: 32),
                        Container(
                          key: keyHeaderTwo,
                          width: size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            AppStrings.subtitle2,
                            style: TextStyle(
                                color: AppColors.headerColor,
                                fontSize: size.width * 0.045,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                        const SizedBox(height: 20),
                        CheckBoxListWidget(
                          state.needReservationsNamesMap,
                          state.haveReservationsNamesMap,
                          false,
                        ),
                        const SizedBox(height: 25),
                        const InfoTextWidget(),
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ),
                getBottomView(
                  state.haveReservationsNamesMap,
                  state.needReservationsNamesMap,
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.headerColor,
            ),
          );
        }
      },
    );
  }

  Widget getBottomView(
    List<MapEntry<String, bool>> haveList,
    List<MapEntry<String, bool>> needList,
  ) {
    if (haveList.any((element) => element.value)) {
      return const Column(
        children: [GenericButtonWidget(true), SizedBox(height: 34)],
      );
    } else if (needList.any((element) => element.value)) {
      return const BottomAdviceWidget();
    } else {
      return const Column(
        children: [GenericButtonWidget(false), SizedBox(height: 34)],
      );
    }
  }
}
