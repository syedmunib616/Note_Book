class APIResponse<T> {
  T data;
  bool error;
  String errormessege;

  APIResponse({this.data, this.error = false, this.errormessege});
}
