import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:setup_structure/core/ui/buttons/common_button.dart';
import 'package:setup_structure/core/ui/success/common_success.dart';
import 'package:setup_structure/res/app_context_extension.dart';
import 'package:setup_structure/res/asset_constants/asset_constants.dart';
import 'package:setup_structure/res/style/app_style.dart';
import 'package:setup_structure/routes/navigation_service.dart';

class CustomDialogue {
  static void showDialogue({
    required VoidCallback onDismiss,
    required String? title,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    String? subtitle,
    required String? assetName,
    Size? size,
    bool hasButton = true,
    String? buttonTitle,
    Color? buttonBgColor,
    VoidCallback? onButtonTap,
  }) {
    if (hasButton) assert(onButtonTap != null);

    showCustomDialog(
      dialogChild: CommonSuccessScreen(
        title: title ?? "Title",
        subTitle: subtitle ?? "",
        onDismiss: onDismiss,
        asset: assetName ?? AssetConstants.accountCreationSuccessIcon,
        size: size ??
            Size(
              MediaQuery.of(NavigationService.navigatorKey.currentContext!).size.width - 140,
              MediaQuery.of(NavigationService.navigatorKey.currentContext!).size.height / 4,
            ),
        titleStyle: titleStyle,
        subtitleStyle: subtitleStyle,
        button: !hasButton
            ? null
            : Container(
                margin: const EdgeInsets.only(bottom: 32, left: 16, right: 16),
                child: CommonButton(
                  title: buttonTitle ?? "Button Title",
                  bgColor: buttonBgColor ?? const Color.fromRGBO(230, 189, 78, 1),
                  height: 48,
                  textStyle: AppTextStyle().w500s16(),
                  onTap: onButtonTap!,
                ),
              ),
      ),
      context: NavigationService.navigatorKey.currentContext!,
      isDismissible: false,
    );
  }

  static void showSuccessDialog(
    BuildContext context, {
    String? title,
    String? subtitle,
    String? buttonText,
    Function? onDismiss,
    Function? onButtonTap,
  }) {
    close() => Navigator.pop(context);

    CustomDialogue.showDialogue(
      title: (title ?? "success").tr(),
      titleStyle: context.resources.style.w700s16(context.resources.color.black10),
      subtitle: (subtitle ?? "successMessage").tr(),
      subtitleStyle: context.resources.style.w400s14(context.resources.color.black40),
      size: const Size(100, 100),
      assetName: context.resources.drawable.checkMarkSuccess,
      onDismiss: () {
        close();
        if (onDismiss != null) onDismiss();
      },
      buttonTitle: (buttonText ?? "ok").tr(),
      onButtonTap: () {
        close();
        if (onButtonTap != null) onButtonTap();
      },
    );
  }
}

Future<dynamic> showCustomDialog(
    {required Widget dialogChild,
    BoxDecoration? dialogDecoration,
    double? height,
    required BuildContext context,
    bool? isDismissible}) async {
  var result = await showGeneralDialog(
    useRootNavigator: false,
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: isDismissible ?? false,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (_, __, ___) {
      return Dialog(
          insetPadding: const EdgeInsets.all(16),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
          child: dialogChild);
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
  return result;
}
