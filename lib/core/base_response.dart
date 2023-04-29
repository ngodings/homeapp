class BaseResponse<T> {
  final int? statusCode;
  final String? message;
  final T? data;

  BaseResponse({
    this.statusCode,
    this.data,
    this.message,
  });
}
