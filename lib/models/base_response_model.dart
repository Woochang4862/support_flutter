class BaseResponseModel<S, T> {
  final S? type;
  final int? statusCode;
  final String statusMessage;
  final String? code;
  final String? responseTime;
  final T? data;

  BaseResponseModel({
    this.type,
    this.statusCode,
    required this.statusMessage,
    this.code,
    this.responseTime,
    this.data,
  });

  BaseResponseModel<S, T> setType(S type) => BaseResponseModel(
        statusMessage: statusMessage,
        data: data,
        type: type,
        code: code,
        statusCode: statusCode,
        responseTime: responseTime,
      );

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) {
    return BaseResponseModel(
      type: json['type'] as S,
      statusCode: json['statusCode'] as int,
      statusMessage: json['statusMessage'] as String,
      code: json['code'] as String,
      responseTime: json['responseTime'] as String,
      data: json['data'] as T,
    );
  }
}
