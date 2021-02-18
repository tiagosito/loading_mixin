import 'dart:ui';

import 'package:flutter/material.dart';

class LoadingConfig extends StatelessWidget {
  ///
  /// double: [blurSigmaX], blur X axis
  ///
  final double blurSigmaX;

  ///
  /// double: [blurSigmaY], blur Y axis
  ///
  final double blurSigmaY;

  ///
  /// double: [widthLoading], loading widget width
  ///
  final double widthLoading;

  ///
  /// double: [heightLoading], widget height
  ///
  final double heightLoading;

  ///
  /// Color: [backgroundColor], background color
  ///
  final Color backgroundColor;

  ///
  /// Color: [circularProgressIndicatorColor], circularProgressIndicator color
  ///
  final Color circularProgressIndicatorColor;

  ///
  /// Widget: [customLoad], custom widget to show loading
  ///
  final Widget customLoad;

  const LoadingConfig({
    Key key,
    double blurSigmaX,
    double blurSigmaY,
    double widthLoading,
    double heightLoading,
    Color backgroundColor,
    this.circularProgressIndicatorColor,
    this.customLoad,
  })  : this.blurSigmaX = blurSigmaX ?? 0,
        this.blurSigmaY = blurSigmaY ?? 0,
        this.widthLoading = widthLoading ?? 50,
        this.heightLoading = heightLoading ?? 50,
        this.backgroundColor = backgroundColor ?? null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Center(
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: this.blurSigmaX, sigmaY: this.blurSigmaY),
          child: Container(
            color: this.backgroundColor ??
                Theme.of(context).primaryColor.withOpacity(0.08),
            child: SizedBox.expand(
              child: Center(
                child: Container(
                  width: this.widthLoading,
                  height: this.heightLoading,
                  child: this.customLoad != null
                      ? this.customLoad
                      : CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              circularProgressIndicatorColor ??
                                  Theme.of(context).primaryColor),
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
