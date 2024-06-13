import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar_task/core/base/base_extensions.dart';
import 'package:foydali_nuqtalar_task/core/constants/app_images.dart';
import 'package:foydali_nuqtalar_task/design_system/components/text_view.dart';
import 'package:foydali_nuqtalar_task/feature/auth/presentation/login/login_screen.dart';
import 'package:foydali_nuqtalar_task/feature/home/presentation/bloc/home_bloc.dart';

class EnterProfileButton extends StatelessWidget {
  const EnterProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, bool>(
      selector: (state) => state.userIsAuthenticated,
      builder: (context, state) {
        return !state
            ? FilledButton(
                onPressed: () {
                  LoginScreen.open(context);
                },
                style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    backgroundColor: const Color(0xFFF5CCC5),
                    elevation: 0,
                    maximumSize: Size.fromWidth(0.4.screenWidth(context))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      AppImages.personCircleIcon,
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: TextView(
                        text: 'enter_profile'.tr(),
                        textSize: 14.textSize(context),
                        textColor: Theme.of(context).colorScheme.primary,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
