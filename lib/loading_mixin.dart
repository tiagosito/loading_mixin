import 'package:flutter/material.dart';

mixin LoadingMixin {
  BuildContext _context;
  Widget _customLoad;
  double _loadingWidth = 50.0;
  double _loadingHeight = 50.0;
  Color _loadingCircularColor;
  Color _loadingBarrierColor = Colors.white.withOpacity(0.4);

  ///
  /// Method name: [startLoad]
  ///
  /// This is the method for calling your asynchronous function
  ///
  /// Parameters:
  ///
  /// Widget: [customLoad], Create your own custom loading
  ///
  /// Function: [callback], Your asynchronous function
  ///
  /// double: [loadingWidth], CircularProgressIndicator width, default [50.0]
  ///
  /// double: [loadingHeight], CircularProgressIndicator height, default [50.0]
  ///
  /// Color: [loadingCircularColor], CircularProgressIndicator color, default [Theme.of(context).primaryColor]
  ///
  /// Color: [loadingBarrierColor], Screen background color, default [Colors.grey.withOpacity(0.2)]
  ///
  /// Example:
  /// ```
  /// RaisedButton(
  ///  onPressed: () async {
  ///     var result = await this.startLoad(requestData);
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
  Future<T> startLoad<T>(
    BuildContext context,
    Function callback, {
    Widget customLoad,
    double loadingWidth = 50.0,
    double loadingHeight = 50.0,
    Color loadingCircularColor,
    Color loadingBarrierColor = Colors.white,
  }) async {
    _setValues(
      context,
      customLoad,
      loadingCircularColor,
      loadingWidth,
      loadingHeight,
      loadingBarrierColor,
    );

    this._loading(context, isLoading: true);

    T value = await callback();

    this._loading(context, isLoading: false);

    return value;
  }

  _loading(BuildContext context, {bool isLoading = false}) {
    isLoading
        ? _createLoading(
            context,
            isLoading,
            this._customLoad != null ? this._customLoad : _createCircularProgressIndicator(),
          )
        : _closeLoading();
  }

  _createLoading(BuildContext context, bool isLoading, Widget child) {
    isLoading
        ? showDialog(
            context: context,
            barrierColor: _loadingBarrierColor,
            barrierDismissible: false,
            builder: (_) => Material(
              type: MaterialType.transparency,
              child: child,
            ),
          )
        : _closeLoading();
  }

  _createCircularProgressIndicator() {
    return Center(
      child: Container(
        width: _loadingWidth,
        height: _loadingHeight,
        color: Colors.transparent,
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(
            _loadingCircularColor != null ? _loadingCircularColor : Theme.of(_context).primaryColor,
          ),
        ),
      ),
    );
  }

  _closeLoading() {
    Navigator.of(_context).pop();
    _resetValues();
  }

  _setValues(
    BuildContext context,
    Widget customLoad,
    Color loadingCircularColor,
    double loadingWidth,
    double loadingHeight,
    Color loadingBarrierColor,
  ) {
    this._context = context != null ? context : this._context;
    this._customLoad = customLoad != null ? customLoad : this._customLoad;
    _loadingWidth = loadingWidth;
    _loadingHeight = loadingHeight;
    _loadingCircularColor = loadingCircularColor;
    _loadingBarrierColor = loadingBarrierColor.withOpacity(0.4);
  }

  _resetValues() {
    _context = null;
    _customLoad = null;
    _loadingWidth = 50.0;
    _loadingHeight = 50.0;
    _loadingCircularColor = null;
    _loadingBarrierColor = null;
  }
}
