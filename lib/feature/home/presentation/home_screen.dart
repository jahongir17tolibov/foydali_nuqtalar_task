import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foydali_nuqtalar_task/design_system/components/text_view.dart';
import 'package:foydali_nuqtalar_task/feature/home/domain/entity/home_style_model.dart';
import 'package:foydali_nuqtalar_task/feature/home/presentation/widget/enter_profle_button.dart';
import 'package:foydali_nuqtalar_task/feature/home/presentation/widget/home_drawer.dart';
import 'package:foydali_nuqtalar_task/feature/home/presentation/widget/home_modal_bottom_sheet.dart';
import 'package:foydali_nuqtalar_task/feature/home/presentation/widget/settings_button.dart';

import 'bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  static void open(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<HomeStyleModel> _homeStylesList = [];

  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    Future.microtask(() {
      _homeStylesList = <HomeStyleModel>[
        HomeStyleModel(
          buttonColor: Theme.of(context).colorScheme.background,
          textColor: Theme.of(context).colorScheme.onBackground,
        ),
        HomeStyleModel(
          buttonColor: Theme.of(context).colorScheme.secondary,
          textColor: Theme.of(context).colorScheme.onBackground,
        ),
        HomeStyleModel(
          buttonColor: Theme.of(context).colorScheme.onBackground,
          textColor: Theme.of(context).colorScheme.background,
        ),
      ];
      context.read<HomeBloc>().add(OnHomeInitialEvent(_homeStylesList.first));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const EnterProfileButton(),
        elevation: 0,
        bottomOpacity: 1.0,
        // bottom: PreferredSize(
        //   preferredSize: const Size.fromHeight(1),
        //   child: Divider(color: Colors.grey.withOpacity(0.4)),
        // ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu_rounded, color: Theme.of(context).colorScheme.onBackground),
            );
          },
        ),
        centerTitle: true,
        actions: const [SettingsButton()],
      ),
      drawer: const HomeDrawer(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStatus.onLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state.status == HomeStatus.onSuccess) {
            return Container(
              color: state.changedStyle!.buttonColor,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              child: TextView(
                                text: state.contentBooks!.first.translate!.uz!.context!,
                                textSize: state.homeTextSize,
                                textColor: state.changedStyle!.textColor,
                                fontFamily: state.homeFontFamily,
                                textAlign: state.homeTextAlign ? TextAlign.justify : null,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Visibility(
                      visible: state.settingsOpened,
                      child: HomeModalBottomSheet(
                        homeStylesList: _homeStylesList,
                        checkedIndex: state.checkedStyleIndex,
                        changedTextSize: state.homeTextSize,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
