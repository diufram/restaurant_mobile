import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    bool success;
    String mensaje;
    int userId;
    String accessToken;

    LoginResponse({
        required this.success,
        required this.mensaje,
        required this.userId,
        required this.accessToken,
    });

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json["success"],
        mensaje: json["mensaje"],
        userId: json["user_id"],
        accessToken: json["access_token"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "mensaje": mensaje,
        "user_id": userId,
        "access_token": accessToken,
    };
}
