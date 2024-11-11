import 'package:xaxino/core/utils/method.dart';
import 'package:xaxino/core/utils/url_container.dart';
import 'package:xaxino/data/model/global/response_model/response_model.dart';
import 'package:xaxino/data/services/api_service.dart';

class DiceRollingRepo {
  ApiClient apiClient;

  DiceRollingRepo({required this.apiClient});

  Future<ResponseModel> submitAnswer(String invest, int choose) async {

   


    Map<String, String> map = {'invest': invest.toString(), 'choose': choose.toString()};
    String url = '${UrlContainer.baseUrl}${UrlContainer.diceRollingSubmitAnswer}';
    final res = await apiClient.request(
      url,
      Method.postMethod,
      map,
      passHeader: true,
    );
    return res;
  }

  Future<ResponseModel> getAnswer(String gameID) async {

   

    Map<String, String> map = {'game_id': gameID.toString(),};
    String url = '${UrlContainer.baseUrl}${UrlContainer.diceRollingResult}';
    final res = await apiClient.request(
      url,
      Method.postMethod,
      map,
      passHeader: true,
    );
    return res;
  }

  Future<dynamic> loadData() async {
    String url = '${UrlContainer.baseUrl}${UrlContainer.diceRollingdata}';

    final response = await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return response;
  }
}
