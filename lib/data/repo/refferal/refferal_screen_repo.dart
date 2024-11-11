
import 'package:xaxino/core/utils/method.dart';
import 'package:xaxino/core/utils/url_container.dart';
import 'package:xaxino/data/model/global/response_model/response_model.dart';
import 'package:xaxino/data/services/api_service.dart';

class RefferalScreenRepo{
  ApiClient apiClient;

  RefferalScreenRepo({required this.apiClient});

  Future<ResponseModel>refferalData()async{

    String url = '${UrlContainer.baseUrl}${UrlContainer.refferal}';

    ResponseModel responseModel = await apiClient.request(url, Method.getMethod, null,passHeader: true);

    return responseModel;
  }


}