import 'dart:convert';
import 'package:xaxino/core/utils/method.dart';
import 'package:xaxino/core/utils/my_strings.dart';
import 'package:xaxino/core/utils/url_container.dart';
import 'package:xaxino/data/model/general_setting/general_setting_response_model.dart';
import 'package:xaxino/data/model/global/response_model/response_model.dart';
import 'package:xaxino/data/services/api_service.dart';

class HomeRepo {
  ApiClient apiClient;
  HomeRepo({required this.apiClient});

  Future<ResponseModel> getData() async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.dashBoardUrl}";
    ResponseModel responseModel = await apiClient.request(url, Method.getMethod, null, passHeader: true);
   
    return responseModel;
  }

  Future<dynamic> refreshGeneralSetting() async {
    String url = '${UrlContainer.baseUrl}${UrlContainer.generalSettingEndPoint}';
    ResponseModel response = await apiClient.request(url, Method.getMethod, null, passHeader: false);

    if (response.statusCode == 200) {
      GeneralSettingResponseModel model = GeneralSettingResponseModel.fromJson(jsonDecode(response.responseJson));
      if (model.status?.toLowerCase() == MyStrings.success.toLowerCase()) {
        apiClient.storeGeneralSetting(model);
      }
    }
  }
}
