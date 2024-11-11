import 'dart:convert';
import 'package:xaxino/core/utils/method.dart';
import 'package:xaxino/core/utils/url_container.dart';
import 'package:xaxino/data/model/global/response_model/response_model.dart';
import 'package:xaxino/data/services/api_service.dart';

class KenoRepo {
  ApiClient apiClient;

  KenoRepo({required this.apiClient});

  Future<ResponseModel> submitAnswer(String invest, List<String> selectedNumbers) async {

    Map<String, dynamic> map = {'invest': invest.toString(), 'choose': jsonEncode(selectedNumbers)};
    String url = '${UrlContainer.baseUrl}${UrlContainer.kenoSubmitAnswer}';

    final res = await apiClient.request(
      url,
      Method.postMethod,
      map,
      passHeader: true,
    );
    return res;
  }


  Future<ResponseModel> getAnswer(String gameID) async {
   

    Map<String, String> map = {
      'gameLog_id': gameID.toString(),
    };
    String url = '${UrlContainer.baseUrl}${UrlContainer.kenoResult}';
    final res = await apiClient.request(
      url,
      Method.postMethod,
      map,
      passHeader: true,
    );
    return res;
  }

  Future<dynamic> loadData() async {
    String url = '${UrlContainer.baseUrl}${UrlContainer.kenodata}';

    final response = await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return response;
  }
}
