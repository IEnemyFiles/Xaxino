
import 'package:xaxino/core/utils/method.dart';
import 'package:xaxino/core/utils/url_container.dart';
import 'package:xaxino/data/model/global/response_model/response_model.dart';
import 'package:xaxino/data/services/api_service.dart';

class GameLogRepo{
  ApiClient apiClient;

  GameLogRepo({required this.apiClient});

  Future<ResponseModel>gameLog()async{

    String url = '${UrlContainer.baseUrl}${UrlContainer.gameLog}';

    ResponseModel responseModel = await apiClient.request(url, Method.getMethod, null,passHeader: true);
 
    return responseModel;
  }


}