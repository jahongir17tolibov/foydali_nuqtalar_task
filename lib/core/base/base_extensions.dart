import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foydali_nuqtalar_task/core/connectivity/connectivity_cubit.dart';

extension SizeUtil on num {
  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width * this;

  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height * this;

  double textSize(BuildContext context) => MediaQuery.of(context).textScaler.scale(toDouble());
}

extension Validation on String {
  bool get phoneNumbIsValid {
    final RegExp regex = RegExp(r'^\+998\d{9}$');
    return regex.hasMatch(this);
  }

  bool get cardNumbIsValid {
    final RegExp pattern = RegExp(r'^\d{4} \d{4} \d{4} \d{4}$');
    return pattern.hasMatch(this);
  }

  bool get emailInputIsValid {
    final RegExp pattern = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    return pattern.hasMatch(this);
  }

  String get extractDigits {
    final RegExp regex = RegExp(r'\d+');
    final matches = regex.allMatches(this);
    String result = '';
    for (Match match in matches) {
      result += match.group(0)!;
    }
    return result;
  }
}

extension BuildContextExtensions on BuildContext {
  bool get getConnectivity => read<ConnectivityCubit>().state.isConnected;
}
