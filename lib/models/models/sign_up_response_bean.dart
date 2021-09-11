import 'data.dart';

class SignUpResponseBean {
  bool? success;
  Data? data;
  String? message;
  String? token;

  SignUpResponseBean({this.success, this.data, this.message, this.token});

  factory SignUpResponseBean.fromJson(Map<dynamic, dynamic> json) =>
      SignUpResponseBean(
        success: json['success'] as bool?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        message: json['message'] as String?,
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data?.toJson(),
        'message': message,
        'token': token,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignUpResponseBean &&
        other.success == success &&
        other.data == data &&
        other.message == message &&
        other.token == token;
  }

  @override
  int get hashCode =>
      success.hashCode ^ data.hashCode ^ message.hashCode ^ token.hashCode;
}
