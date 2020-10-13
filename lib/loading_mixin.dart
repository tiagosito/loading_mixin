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
  /// BuildContext: [context], A handle to the location of a widget in the widget tree
  ///
  /// Widget: [customLoad], Create your own custom loading
  ///
  /// Function: [callback], Your asynchronous function
  ///
  /// double: [loadingWidth], CircularProgressIndicator width, default value [50.0]
  ///
  /// double: [loadingHeight], CircularProgressIndicator height, default value [50.0]
  ///
  /// Color: [loadingCircularColor], CircularProgressIndicator color, default value [Theme.of(context).primaryColor]
  ///
  /// Color: [loadingBarrierColor], Screen background color, default value [Colors.grey.withOpacity(0.2)]
  ///
  /// Example:
  /// ```
  /// RaisedButton(
  ///  onPressed: () async {
  ///     var result = await this.startLoad(context, requestData);
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
  Future<T> startAutomaticLoad<T>(
    BuildContext context,
    Function callback, {
    Widget customLoad,
    double loadingWidth = 50.0,
    double loadingHeight = 50.0,
    Color loadingCircularColor,
    Color loadingBarrierColor = Colors.white,
  }) async {
    try {
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
    } catch (e) {
      print(e.toString());
      this._loading(context, isLoading: false);
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
  /// bool: [isLoading], The load widget is shown if [isLoading == true]. If [isLoading == false] The load widget will be canceled, default value [false]
  ///
  /// Widget: [customLoad], Create your own custom loading
  ///
  /// double: [loadingWidth], CircularProgressIndicator width, default value [50.0]
  ///
  /// double: [loadingHeight], CircularProgressIndicator height, default value [50.0]
  ///
  /// Color: [loadingCircularColor], CircularProgressIndicator color, default value [Theme.of(context).primaryColor]
  ///
  /// Color: [loadingBarrierColor], Screen background color, default value [Colors.grey.withOpacity(0.2)]
  ///
  /// Example:
  /// ```
  /// RaisedButton(
  ///  onPressed: () async {
  ///     //Start Laod
  ///     var result = await this.startManualLoad(context, isLoading: true);
  ///
  ///     //Code here
  ///     print('result');
  ///
  ///     //Close Laod
  ///     var result = await this.startManualLoad(context);
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
  startManualLoad(
    BuildContext context, {
    Widget customLoad,
    bool isLoading = false,
    double loadingWidth = 50.0,
    double loadingHeight = 50.0,
    Color loadingCircularColor,
    Color loadingBarrierColor = Colors.white,
  }) {
    try {
      _setValues(
        context,
        customLoad,
        loadingCircularColor,
        loadingWidth,
        loadingHeight,
        loadingBarrierColor,
      );

      this._loading(context, isLoading: isLoading);
    } catch (e) {
      print(e.toString());
      this._loading(context, isLoading: false);
      return e;
    }
  }

  ///
  /// Method name: [startLoadPredefinedTime]
  ///
  /// This is the method for calling when you want to start and close the load with a predefined time
  ///
  /// Parameters:
  ///
  /// BuildContext: [context], A handle to the location of a widget in the widget tree
  ///
  /// Duration: [predefinedTime], How long do you want Load to be active, default value [const Duration(seconds: 3)]
  ///
  /// Widget: [customLoad], Create your own custom loading
  ///
  /// double: [loadingWidth], CircularProgressIndicator width, default value [50.0]
  ///
  /// double: [loadingHeight], CircularProgressIndicator height, default value [50.0]
  ///
  /// Color: [loadingCircularColor], CircularProgressIndicator color, default value [Theme.of(context).primaryColor]
  ///
  /// Color: [loadingBarrierColor], Screen background color, default value [Colors.grey.withOpacity(0.2)]
  ///
  /// Example:
  /// ```
  /// RaisedButton(
  ///  onPressed: () async {
  ///     //Start Laod
  ///     var result = await this.startLoadPredefinedTime(context);
  ///
  ///     //Code here
  ///     print('result');
  ///
  ///     //Close Laod
  ///     var result = await this.startManualLoad(context, false);
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
  startLoadPredefinedTime(
    BuildContext context, {
    Widget customLoad,
    double loadingWidth = 50.0,
    double loadingHeight = 50.0,
    Color loadingCircularColor,
    Color loadingBarrierColor = Colors.white,
    Duration predefinedTime = const Duration(seconds: 3),
  }) async {
    try {
      _setValues(
        context,
        customLoad,
        loadingCircularColor,
        loadingWidth,
        loadingHeight,
        loadingBarrierColor,
      );

      this._loading(context, isLoading: true);

      predefinedTime =
          predefinedTime == null ? Duration(seconds: 3) : predefinedTime;
      await Future.delayed(predefinedTime);

      this._loading(context, isLoading: false);
    } catch (e) {
      print(e.toString());
      this._loading(context, isLoading: false);
      return e;
    }
  }

  _loading(BuildContext context, {bool isLoading = false}) {
    isLoading
        ? _createLoading(
            context,
            isLoading,
            this._customLoad != null
                ? this._customLoad
                : _createCircularProgressIndicator(),
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
            _loadingCircularColor != null
                ? _loadingCircularColor
                : Theme.of(_context).primaryColor,
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
