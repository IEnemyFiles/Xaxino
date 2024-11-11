// To parse this JSON data, do
//
//     final spinWheelResultModel = spinWheelResultModelFromJson(jsonString);

import 'dart:convert';

import 'package:xaxino/data/model/auth/sign_up_model/registration_response_model.dart';

SpinWheelResultModel spinWheelResultModelFromJson(String str) => SpinWheelResultModel.fromJson(json.decode(str));

String spinWheelResultModelToJson(SpinWheelResultModel data) => json.encode(data.toJson());

class SpinWheelResultModel {
    String? remark;
    String? status;
    Message? message;
    Data? data;

    SpinWheelResultModel({
        this.remark,
        this.status,
        this.message,
        this.data,
    });

    factory SpinWheelResultModel.fromJson(Map<String, dynamic> json) => SpinWheelResultModel(
        remark: json["remark"],
        status: json["status"],
        message: json["message"] == null ? null : Message.fromJson(json["message"]),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "remark": remark,
        "status": status,
        "message": message?.toJson(),
        "data": data?.toJson(),
    };
}

class Data {
    String? message;
    String? type;
    String? result;
    String? userChoose;
    String? bal;

    Data({
        this.message,
        this.type,
        this.result,
        this.userChoose,
        this.bal,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        message: json["message"],
        type: json["type"],
        result: json["result"],
        userChoose: json["user_choose"],
        bal: json["bal"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "type": type,
        "result": result,
        "user_choose": userChoose,
        "bal": bal,
    };
}


