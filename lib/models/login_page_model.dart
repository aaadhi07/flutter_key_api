
import 'dart:convert';

LoginPageModel loginPageModelFromJson(String str) => LoginPageModel.fromJson(json.decode(str));

String loginPageModelToJson(LoginPageModel data) => json.encode(data.toJson());

class LoginPageModel {
    String? refresh;
    String? access;
    int? id;
    String? name;
    String? place;
    String? email;

    LoginPageModel({
        this.refresh,
        this.access,
        this.id,
        this.name,
        this.place,
        this.email,
    });

    factory LoginPageModel.fromJson(Map<String, dynamic> json) => LoginPageModel(
        refresh: json["refresh"],
        access: json["access"],
        id: json["id"],
        name: json["name"],
        place: json["place"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
        "id": id,
        "name": name,
        "place": place,
        "email": email,
    };
}
