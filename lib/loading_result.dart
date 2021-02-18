class LoadingResult<T> {
  ///
  /// T: [data], result value
  ///
  T data;

  ///
  /// dynamic: [error], result error
  ///
  dynamic error;

  ///
  /// bool: [success], whether the returned result worked or returned an error
  ///
  bool get success => error == null;
}
