// To parse this JSON data, do
//
//     final headTailSubmitAnsModel = headTailSubmitAnsModelFromJson(jsonString);

import 'dart:convert';

import 'package:xaxino/data/model/auth/sign_up_model/registration_response_model.dart';

HeadTailInvestmentResponseModel headTailSubmitAnsModelFromJson(String str) => HeadTailInvestmentResponseModel.fromJson(json.decode(str));

String headTailSubmitAnsModelToJson(HeadTailInvestmentResponseModel data) => json.encode(data.toJson());

class HeadTailInvestmentResponseModel {
    String? remark;
    String? status;
    Message? message;
    Data? data;

    HeadTailInvestmentResponseModel({
        this.remark,
        this.status,
        this.message,
        this.data,
    });

    factory HeadTailInvestmentResponseModel.fromJson(Map<String, dynamic> json) => HeadTailInvestmentResponseModel(
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
    GameLog? gameLog;
    String? balance;

    Data({
        this.gameLog,
        this.balance,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        gameLog: json["game_log"] == null ? null : GameLog.fromJson(json["game_log"]),
        balance: json["balance"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "game_log": gameLog?.toJson(),
        "balance": balance,
    };
}

class GameLog {
    String? userId;
    String? gameId;
    String? userSelect;
    String? result;
    String? status;
    String? winStatus;
    String? invest;
    String? winAmo;
    String? mines;
    String? mineAvailable;
    String? updatedAt;
    String? createdAt;
    String? id;

    GameLog({
        this.userId,
        this.gameId,
        this.userSelect,
        this.result,
        this.status,
        this.winStatus,
        this.invest,
        this.winAmo,
        this.mines,
        this.mineAvailable,
        this.updatedAt,
        this.createdAt,
        this.id,
    });

    factory GameLog.fromJson(Map<String, dynamic> json) => GameLog(
        userId: json["user_id"].toString(),
        gameId: json["game_id"].toString(),
        userSelect: json["user_select"],
        result: json["result"],
        status: json["status"].toString(),
        winStatus: json["win_status"].toString(),
        invest: json["invest"].toString(),
        winAmo: json["win_amo"].toString(),
        mines: json["mines"].toString(),
        mineAvailable: json["mine_available"].toString(),
        updatedAt: json["updated_at"].toString(),
        createdAt: json["created_at"] .toString(),
        id: json["id"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "game_id": gameId,
        "user_select": userSelect,
        "result": result,
        "status": status,
        "win_status": winStatus,
        "invest": invest,
        "win_amo": winAmo,
        "mines": mines,
        "mine_available": mineAvailable,
        "updated_at": updatedAt,
        "created_at": createdAt,
        "id": id,
    };
}

