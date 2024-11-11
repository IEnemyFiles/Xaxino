
import 'package:xaxino/core/utils/method.dart';
import 'package:xaxino/core/utils/url_container.dart';
import 'package:xaxino/data/model/global/response_model/response_model.dart';
import 'package:xaxino/data/services/api_service.dart';

class CardFindingRepo {
  ApiClient apiClient;

  CardFindingRepo({required this.apiClient});

  Future<ResponseModel> submitAnswer(String invest, String choose) async {

   

    Map<String, String> map = {'invest': invest.toString(), 'choose': choose.toString()};
    String url = '${UrlContainer.baseUrl}${UrlContainer.cardFindingAnswer}';
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
    String url = '${UrlContainer.baseUrl}${UrlContainer.cardFindingResult}';
    final res = await apiClient.request(
      url,
      Method.postMethod,
      map,
      passHeader: true,
    );
    return res;
  }

  Future<dynamic> loadData() async {
    String url = '${UrlContainer.baseUrl}${UrlContainer.cardfindingdata}';

    final response = await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return response;
  }
}