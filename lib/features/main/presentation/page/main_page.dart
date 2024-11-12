import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:malina_delivery/constants/constants.dart';
import 'package:malina_delivery/core/theme/app_text_styles.dart';
import 'package:malina_delivery/core/theme/colors/app_colors.dart';
import 'package:malina_delivery/core/utils/app_utils.dart';
import 'package:malina_delivery/features/basket/presentation/bloc/eat_bloc/eat_bloc.dart';
import 'package:malina_delivery/features/basket/presentation/bloc/stuff_bloc/stuff_bloc.dart';
import 'package:malina_delivery/features/main/presentation/bloc/main_bloc.dart';
import 'package:malina_delivery/generated/l10n.dart';
import 'package:malina_delivery/injector_container.dart';
import 'package:malina_delivery/route/app_routes.dart';
import 'package:malina_delivery/route/name_routes.dart';

class MainPage extends StatelessWidget {
  final String? initialRoute;

  const MainPage({
    super.key,
    this.initialRoute,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<MainBloc>()),
        BlocProvider(create: (_) => sl<EatBloc>()),
        BlocProvider(create: (_) => sl<StuffBloc>()),
      ],
      child: const MainBody(),
    );
  }
}

class MainBody extends StatelessWidget {
  final String? initialRoute;

  const MainBody({
    super.key,
    this.initialRoute,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return PopScope(
          canPop: state.tab.index != 0 ? false : true,
          child: Scaffold(
            body: Navigator(
              key: shellRootNavigatorKey,
              initialRoute: initialRoute,
              onGenerateRoute: AppRoutes.onShellGenerateRoute,
            ),
            bottomNavigationBar: Container(
              padding: AppUtils.kPaddingHor16,
              decoration: const BoxDecoration(
                color: LightThemeColors.white,
                border: Border(
                  top: BorderSide(
                    color: LightThemeColors.white,
                  ),
                ),
                borderRadius: AppUtils.kBorderRadiusTop12,
              ),
              height: 80,
              child: Row(
                children: [
                  Expanded(
                    child: buildMenuItem(
                      icon: "ic_home",
                      text: AppLocalization.of(context).home,
                      selected: state.tab == MainTab.home,
                      changeTap: () => changeTap(context, 0),
                    ),
                  ),
                  Expanded(
                    child: buildMenuItem(
                        icon: "ic_favourite",
                        text: AppLocalization.of(context).favourite,
                        selected: state.tab == MainTab.favourite,
                        changeTap: () => changeTap(context, 1)),
                  ),
                  InkWell(
                    borderRadius: AppUtils.kBorderRadius48,
                    onTap: () => changeTap(context, 2),
                    child: Container(
                      height: 60,
                      width: 60,
                      margin: const EdgeInsets.only(
                        bottom: 16,
                      ),
                      padding: AppUtils.kPaddingVer15Hor5,
                      decoration: const BoxDecoration(
                          color: LightThemeColors.red,
                          borderRadius: AppUtils.kBorderRadius48),
                      child: (state.tab == MainTab.basketStuff ||
                              state.tab == MainTab.basketEat)
                          ? SvgPicture.asset("assets/svg/ic_qr_scan_back.svg")
                          : SvgPicture.asset("assets/svg/ic_qr_scan.svg"),
                    ),
                  ),
                  Expanded(
                    child: buildMenuItem(
                        icon: "ic_profile",
                        text: AppLocalization.of(context).profile,
                        selected: state.tab == MainTab.profile,
                        changeTap: () => changeTap(context, 3)),
                  ),
                  Expanded(
                    child: Padding(
                      padding: AppUtils.kPaddingVer16,
                      child: PopupMenuButton<int>(
                        shadowColor: Colors.transparent,
                        constraints: const BoxConstraints(
                          maxWidth: 70.0,
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: AppUtils.kBorderRadiusTop24,
                        ),
                        menuPadding: AppUtils.kPaddingAll4,
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            height: 0,
                            padding: EdgeInsets.zero,
                            value: 1,
                            child: buildBasketItem(
                              changeTap: () {
                                Navigator.pop(context);
                                changeTap(context, 4);
                              },
                              icon: "ic_food",
                              text: AppLocalization.current.basket_eat,
                            ),
                          ),
                          const PopupMenuItem(
                            height: 0,
                            padding: EdgeInsets.zero,
                            value: 1,
                            child: AppUtils.kBoxHeight10,
                          ),
                          PopupMenuItem(
                            height: 0,
                            value: 2,
                            padding: EdgeInsets.zero,
                            child: buildBasketItem(
                              changeTap: () {
                                Navigator.pop(context);
                                changeTap(context, 5);
                              },
                              icon: "ic_staff",
                              text: AppLocalization.current.basket_stuff,
                            ),
                          ),
                        ],
                        offset: const Offset(-2, -150),
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                "assets/svg/ic_basket.svg",
                                colorFilter: ColorFilter.mode(
                                  (state.tab == MainTab.basketStuff ||
                                          state.tab == MainTab.basketEat)
                                      ? LightThemeColors.red
                                      : LightThemeColors.gray,
                                  BlendMode.srcIn,
                                ),
                              ),
                              Text(
                                AppLocalization.current.basket,
                                style: (state.tab == MainTab.basketStuff ||
                                        state.tab == MainTab.basketEat)
                                    ? AppTextStyles.selectedTab
                                    : AppTextStyles.unSelectedTab,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildMenuItem({
    required String icon,
    required String text,
    required bool selected,
    required Function() changeTap,
  }) {
    return InkWell(
      borderRadius: AppUtils.kBorderRadius100,
      onTap: () => changeTap(),
      child: Padding(
        padding: AppUtils.kPaddingVer16,
        child: Column(
          children: [
            SvgPicture.asset(
              "assets/svg/$icon.svg",
              colorFilter: ColorFilter.mode(
                selected ? LightThemeColors.red : LightThemeColors.gray,
                BlendMode.srcIn,
              ),
            ),
            Text(
              text,
              style: selected
                  ? AppTextStyles.selectedTab
                  : AppTextStyles.unSelectedTab,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }

  Widget buildBasketItem({
    required String icon,
    required String text,
    required Function() changeTap,
  }) {
    return InkWell(
      borderRadius: AppUtils.kBorderRadius100,
      onTap: () => changeTap(),
      child: Ink(
        height: 60,
        width: 60,
        padding: AppUtils.kPaddingAll12,
        decoration: const BoxDecoration(
            color: LightThemeColors.grayTab,
            borderRadius: AppUtils.kBorderRadius100),
        child: Column(
          children: [
            SvgPicture.asset(
              "assets/svg/$icon.svg",
              colorFilter: const ColorFilter.mode(
                LightThemeColors.gray,
                BlendMode.srcIn,
              ),
            ),
            Text(
              text,
              style: AppTextStyles.basketCategory,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }

  void changeTap(BuildContext context, int index) {
    context
        .read<MainBloc>()
        .add(ChangeTabCallEvent(tab: MainTab.values[index]));
    switch (index) {
      case 0:
        Navigator.of(shellRootNavigatorKey.currentContext!)
            .pushNamedAndRemoveUntil(
          Routes.home,
          (route) => false,
        );
        break;
      case 1:
        Navigator.of(shellRootNavigatorKey.currentContext!)
            .pushNamedAndRemoveUntil(
          Routes.favourite,
          (route) => false,
        );
        break;
      case 2:
        Navigator.of(rootNavigatorKey.currentContext!)
            .pushNamed(
          Routes.qrScan,
        )
            .then((value) {
          if (value == null) {
            Navigator.of(shellRootNavigatorKey.currentContext!)
                .pushNamedAndRemoveUntil(
              Routes.home,
              (route) => false,
            );
            if (context.mounted) {
              context
                  .read<MainBloc>()
                  .add(const ChangeTabCallEvent(tab: MainTab.home));
            }
          }
        });
        break;
      case 3:
        Navigator.of(shellRootNavigatorKey.currentContext!)
            .pushNamedAndRemoveUntil(
          Routes.profile,
          (route) => false,
        );
        break;
      case 4:
        Navigator.of(shellRootNavigatorKey.currentContext!)
            .pushNamedAndRemoveUntil(
          Routes.basketEat,
          (route) => false,
        );
        break;
      case 5:
        Navigator.of(shellRootNavigatorKey.currentContext!)
            .pushNamedAndRemoveUntil(
          Routes.basketStuff,
          (route) => false,
        );
        break;
    }
  }
}
