import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foydali_nuqtalar_task/core/base/base_extensions.dart';
import 'package:foydali_nuqtalar_task/core/constants/app_images.dart';
import 'package:foydali_nuqtalar_task/design_system/components/text_view.dart';

class GoToYouTubeWidget extends StatelessWidget {
  const GoToYouTubeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset(
                AppImages.youTubeVideoPng,
                width: 1.screenWidth(context),
                height: 0.22.screenHeight(context),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 6),
            TextView.boldStyle(
              text: 'you_tube_guide_text'.tr(),
              textSize: 18.textSize(context),
              textColor: Theme.of(context).colorScheme.onBackground,
            )
          ],
        ),
      ),
    );
  }
}
