import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  bool? success;
  Data? data;
  String? message;
  String? token;

  LoginResponse({this.success, this.data, this.message, this.token});

  factory LoginResponse.fromJson(Map<dynamic, dynamic> json) {
    return _$LoginResponseFromJson(json);
  }

  Map<dynamic, dynamic> toJson() => _$LoginResponseToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginResponse &&
        other.success == success &&
        other.data == data &&
        other.message == message &&
        other.token == token;
  }

  @override
  int get hashCode =>
      success.hashCode ^ data.hashCode ^ message.hashCode ^ token.hashCode;
}
