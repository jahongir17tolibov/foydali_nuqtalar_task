import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foydali_nuqtalar_task/core/base/base_extensions.dart';
import 'package:foydali_nuqtalar_task/core/constants/app_images.dart';
import 'package:foydali_nuqtalar_task/design_system/base_widgets/fn_app_bars.dart';
import 'package:foydali_nuqtalar_task/design_system/components/different_colored_rich_text.dart';
import 'package:foydali_nuqtalar_task/design_system/components/email_input.dart';
import 'package:foydali_nuqtalar_task/design_system/components/foydali_nuqtalar_button.dart';
import 'package:foydali_nuqtalar_task/design_system/components/foydali_nuqtalar_outlined_button.dart';
import 'package:foydali_nuqtalar_task/design_system/components/text_view.dart';
import 'package:foydali_nuqtalar_task/feature/auth/presentation/login/widget/login_password_input.dart';
import 'package:foydali_nuqtalar_task/feature/auth/presentation/register/register_screen.dart';

import 'bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = '/login';

  static void open(BuildContext context) {
    Navigator.of(context).pushNamed(routeName);
  }

  static void replacementOpen(BuildContext context) {
    Navigator.of(context).popAndPushNamed(routeName);
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailEditingController = TextEditingController();
  final GlobalKey<FormState> _emailFormKey = GlobalKey<FormState>();
  final TextEditingController _passwordEditingController = TextEditingController();
  final GlobalKey<FormState> _passwordFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context, title: 'enter_profile'.tr()),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            FoydaliNuqtalarOutlinedButton(
              onPressed: () {},
              contentText: 'register_google'.tr(),
              icon: AppImages.googleIcon,
            ),
            const SizedBox(height: 10),
            FoydaliNuqtalarOutlinedButton(
              onPressed: () {},
              contentText: 'register_apple'.tr(),
              icon: AppImages.appleIcon,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: TextView(
                text: 'or'.tr(),
                textSize: 16.textSize(context),
                textColor: Colors.grey,
              ),
            ),
            EmailInput(
              emailEditingController: _emailEditingController,
              emailFormKey: _emailFormKey,
            ),
            const SizedBox(height: 12),
            PasswordInput(
              passwordEditingController: _passwordEditingController,
              passwordFormKey: _passwordFormKey,
            ),
            const SizedBox(height: 20),
            FoydaliNuqtalarButton(
              onPressed: _validateButton()
                  ? () {
                      context.read<LoginBloc>().add(OnLoginUserEvent(
                            email: _emailEditingController.text,
                            password: _passwordEditingController.text,
                          ));
                    }
                  : null,
              contentText: 'enter'.tr(),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                RegisterScreen.open(context);
              },
              child: DifferentColoredRichText(
                leftText: 'dont_have_acc_text'.tr(),
                leftTextColor: Theme.of(context).colorScheme.onBackground,
                rightText: 'register_profile'.tr(),
                rightTextColor: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _validateButton() {
    final emailFormKeyState = _emailFormKey.currentState;
    final passwordFormKeyState = _passwordFormKey.currentState;
    if (emailFormKeyState != null && passwordFormKeyState != null) {
      if (context.getConnectivity &&
          emailFormKeyState.validate() &&
          passwordFormKeyState.validate()) {
        return true;
      }
    }
    return false;
  }
}
