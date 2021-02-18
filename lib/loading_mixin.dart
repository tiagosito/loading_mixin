import 'package:flutter/material.dart';

import 'loadig_configuration.dart';

mixin LoadingMixin {
  ///
  /// Method name: [startAutomaticLoad]
  ///
  /// This is the method for calling your asynchronous function
  ///
  /// Parameters:
  ///
  /// BuildContext: [context], A handle to the location of a widget in the widget tree
  ///
  /// Function: [callback], Your asynchronous function
  ///
  /// Widget: [loadingConfig], Create your own custom loading or make your customization
  ///
  ///
  /// Example:
  /// ```
  /// RaisedButton(
  ///  onPressed: () async {
  ///     var result = await this.startAutomaticLoad(context, requestData);
  ///   },
  ///  child: Text('Fetch'),
  /// )
  ///
  /// //HTTP request Example
  /// static Future requestData() async {
  ///   await Future.delayed(Duration(milliseconds: 1500));
  ///   return 1844;
  /// }
  /// ```
  ///
  Future<LoadingResult> startAutomaticLoad<LoadingResult>(
      BuildContext context, Function callback,
      {LoadingConfig loadingConfig}) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => loadingConfig ?? LoadingConfig(),
    );

    try {
      overlayState.insert(overlayEntry);

      LoadingResult value = await callback();

      overlayEntry.remove();
      return value;
    } catch (e) {
      debugPrint('\n\n **************\n\nERROR: $e\n\n');
      overlayEntry.remove();
      return e;
    }
  }

  ///
  /// Method name: [startManualLoad]
  ///
  /// This is the method for calling when you want to start and close the load manually
  ///
  /// Parameters:
  ///
  /// BuildContext: [context], A handle to the location of a widget in the widget tree
  ///
  /// Widget: [loadingConfig], Create your own custom loading or make your customization
  ///
  /// Example:
  /// ```
  /// RaisedButton(
  ///  onPressed: () async {
  ///     //Start Laod
  ///     var ovelayEntry = this.startManualLoad(context);
  ///
  ///     //Code here
  ///     result = await requestData();
  ///
  ///     //Close Laod
  ///     this.endManualLoad(context, ovelayEntry);
  ///   },
  ///  child: Text('Fetch'),
  /// )
  ///
  /// //HTTP request Example
  /// static Future requestData() async {
  ///   await Future.delayed(Duration(milliseconds: 1500));
  ///   return 1844;
  /// }
  /// ```
  ///
  OverlayEntry startManualLoad<T>(BuildContext context,
      {LoadingConfig loadingConfig}) {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => loadingConfig ?? LoadingConfig(),
    );

    try {
      overlayState.insert(overlayEntry);
      return overlayEntry;
    } catch (e) {
      debugPrint('\n\n **************\n\nERROR: $e\n\n');
      return e;
    }
  }

  ///
  /// Method name: [endManualLoad]
  ///
  /// This method needs to be called after you call the manual method and process what you want
  ///
  /// Parameters:
  ///
  /// BuildContext: [context], A handle to the location of a widget in the widget tree
  ///
  /// Widget: [overlayEntryToRemove], Overlay that will be added and then removed from the screen
  ///
  /// Example:
  /// ```
  /// RaisedButton(
  ///  onPressed: () async {
  ///     //Start Laod
  ///     var ovelayEntry = this.startManualLoad(context);
  ///
  ///     //Code here
  ///     result = await requestData();
  ///
  ///     //Close Laod
  ///     this.endManualLoad(context, ovelayEntry);
  ///   },
  ///  child: Text('Fetch'),
  /// )
  ///
  /// //HTTP request Example
  /// static Future requestData() async {
  ///   await Future.delayed(Duration(milliseconds: 1500));
  ///   return 1844;
  /// }
  /// ```
  ///
  bool endManualLoad<T>(
      BuildContext context, OverlayEntry overlayEntryToRemove) {
    try {
      overlayEntryToRemove.remove();
      return true;
    } catch (e) {
      debugPrint('\n\n **************\n\nERROR: $e\n\n');
      return e;
    }
  }
}
