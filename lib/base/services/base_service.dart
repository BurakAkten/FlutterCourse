import 'package:http/http.dart' as http;

class BaseService {
  static BaseService _instance = new BaseService.internal();
  BaseService.internal();
  factory BaseService() => _instance;

  static final String _baseUrl = "https://zoo-animal-api.herokuapp.com";

  static final String randomEndPoint = "/animals/rand";
  static final String fifteenAnimalEndPoint = "/animals/rand/15";

  Future<ServiceResponseModel> getRequest(String path, {int timeOut = 30}) async {
    try {
      var url = Uri.parse("${_baseUrl}$path");
      return http.get(url).timeout(Duration(seconds: timeOut)).then((http.Response response) async {
        int statusCode = response.statusCode;
        if (statusCode == 200) {
          return ServiceResponseModel(isSuccess: true, data: response.body);
        } else {
          return ServiceResponseModel(errorMessage: "Connection failed by $statusCode code.");
        }
      });
    } catch (e) {
      return ServiceResponseModel(errorMessage: "Undefined problem happened!");
    }
  }
}

class ServiceResponseModel {
  final bool isSuccess;
  final String? errorMessage;
  final dynamic data;

  ServiceResponseModel({this.isSuccess = false, this.errorMessage, this.data});
}
