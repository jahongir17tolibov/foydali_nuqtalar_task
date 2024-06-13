import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foydali_nuqtalar_task/core/base/base_extensions.dart';
import 'package:foydali_nuqtalar_task/core/constants/app_images.dart';
import 'package:foydali_nuqtalar_task/design_system/base_widgets/fn_app_bars.dart';
import 'package:foydali_nuqtalar_task/design_system/components/different_colored_rich_text.dart';
import 'package:foydali_nuqtalar_task/design_system/components/email_input.dart';
import 'package:foydali_nuqtalar_task/design_system/components/foydali_nuqtalar_outlined_button.dart';
import 'package:foydali_nuqtalar_task/design_system/components/name_input.dart';
import 'package:foydali_nuqtalar_task/design_system/components/text_view.dart';
import 'package:foydali_nuqtalar_task/design_system/extensions/floating_ui.dart';
import 'package:foydali_nuqtalar_task/feature/auth/presentation/login/login_screen.dart';
import 'package:foydali_nuqtalar_task/feature/auth/presentation/register/widget/register_button.dart';
import 'package:foydali_nuqtalar_task/feature/auth/presentation/register/widget/register_password_input.dart';
import 'package:foydali_nuqtalar_task/feature/home/presentation/home_screen.dart';

import 'bloc/register_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String routeName = '/register';

  static void open(BuildContext context) {
    Navigator.of(context).pushNamed(routeName);
  }

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameEditingController = TextEditingController();
  final GlobalKey<FormState> _nameFormKey = GlobalKey<FormState>();
  final TextEditingController _emailEditingController = TextEditingController();
  final GlobalKey<FormState> _emailFormKey = GlobalKey<FormState>();
  final TextEditingController _passwordEditingController = TextEditingController();
  final GlobalKey<FormState> _passwordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context, title: 'register_profile'.tr()),
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state.status == RegisterStatus.showMessage) {
            context.showSnackBar(state.message.toString());
          } else if (state.status == RegisterStatus.registerSuccessful) {
            HomeScreen.open(context);
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  text: 'or_text'.tr(),
                  textSize: 16.textSize(context),
                  textColor: Colors.grey,
                ),
              ),
              NameInput(
                nameEditingController: _nameEditingController,
                nameFormKey: _nameFormKey,
              ),
              const SizedBox(height: 12),
              EmailInput(
                emailEditingController: _emailEditingController,
                emailFormKey: _emailFormKey,
              ),
              const SizedBox(height: 12),
              RegisterPasswordInput(
                passwordEditingController: _passwordEditingController,
                passwordFormKey: _passwordFormKey,
              ),
              const SizedBox(height: 20),
              RegisterButton(
                onPressed: _validateButton()
                    ? () {
                        context.read<RegisterBloc>().add(OnRegisterUserEvent(
                              fullName: _nameEditingController.text,
                              email: _emailEditingController.text,
                              password: _passwordEditingController.text,
                            ));
                      }
                    : null,
              ),
              TextButton(
                onPressed: () {
                  // LoginScreen.replacementOpen(context);
                  Navigator.of(context).pop();
                },
                child: DifferentColoredRichText(
                  leftText: 'already_have_acc_text'.tr(),
                  leftTextColor: Theme.of(context).colorScheme.onBackground,
                  rightText: 'enter'.tr(),
                  rightTextColor: Theme.of(context).colorScheme.primary,
                ),
              ),
              // TextView(
              //   text: 'register_offerta_text'.tr(),
              //   textSize: 14.textSize(context),
              //   textColor: Colors.grey,
              //   textAlign: TextAlign.center,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validateButton() {
    final nameFormKeyState = _nameFormKey.currentState;
    final emailFormKeyState = _emailFormKey.currentState;
    final passwordFormKeyState = _passwordFormKey.currentState;
    if (nameFormKeyState != null && emailFormKeyState != null && passwordFormKeyState != null) {
      if (context.getConnectivity &&
          nameFormKeyState.validate() &&
          emailFormKeyState.validate() &&
          passwordFormKeyState.validate()) {
        return true;
      }
    }
    return false;
  }
}
