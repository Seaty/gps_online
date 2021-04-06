// To parse this JSON data, do
//
//     final fbData = fbDataFromJson(jsonString);

import 'dart:convert';

FbData fbDataFromJson(String str) => FbData.fromJson(json.decode(str));

String fbDataToJson(FbData data) => json.encode(data.toJson());

class FbData {
    FbData({
        this.name,
        this.email,
        this.picture,
        this.id,
    });

    String name;
    String email;
    Picture picture;
    String id;

    factory FbData.fromJson(Map<String, dynamic> json) => FbData(
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        picture: json["picture"] == null ? null : Picture.fromJson(json["picture"]),
        id: json["id"] == null ? null : json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "picture": picture == null ? null : picture.toJson(),
        "id": id == null ? null : id,
    };
}

class Picture {
    Picture({
        this.data,
    });

    Data data;

    factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? null : data.toJson(),
    };
}

class Data {
    Data({
        this.height,
        this.isSilhouette,
        this.url,
        this.width,
    });

    int height;
    bool isSilhouette;
    String url;
    int width;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        height: json["height"] == null ? null : json["height"],
        isSilhouette: json["is_silhouette"] == null ? null : json["is_silhouette"],
        url: json["url"] == null ? null : json["url"],
        width: json["width"] == null ? null : json["width"],
    );

    Map<String, dynamic> toJson() => {
        "height": height == null ? null : height,
        "is_silhouette": isSilhouette == null ? null : isSilhouette,
        "url": url == null ? null : url,
        "width": width == null ? null : width,
    };
}
