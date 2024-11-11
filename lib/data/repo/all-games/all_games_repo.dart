
import 'package:xaxino/core/utils/method.dart';
import 'package:xaxino/core/utils/url_container.dart';
import 'package:xaxino/data/model/global/response_model/response_model.dart';
import 'package:xaxino/data/services/api_service.dart';

class AllGanmesRepo{

  ApiClient apiClient;
  AllGanmesRepo({required this.apiClient});

 
 Future<ResponseModel> loadData() async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.dashBoardUrl}";
    ResponseModel responseModel = await apiClient.request(url, Method.getMethod, null, passHeader: true);
   
    return responseModel;
  }

}