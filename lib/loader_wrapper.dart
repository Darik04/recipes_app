import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:recipes_app/constants/colors/color_styles.dart';

showLoaderWrapper(BuildContext context){
  return Loader.show(
    context,
    progressIndicator: LoadingAnimationWidget.fallingDot(
      color: ColorStyles.grey888,
      size: 35,
    ),
  );
}