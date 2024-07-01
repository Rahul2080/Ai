import 'dart:convert';


import 'package:ai/Repository/ModelClass/AiModel.dart';
import 'package:http/http.dart';
import 'Api Client.dart';




class AiApi {
  ApiClient apiClient = ApiClient();


  Future<AiModel> getai(String id) async {
    String trendingpath ='https://ai-text-to-image-generator-api.p.rapidapi.com/realistic';

    var body = {
      "inputs":id
    };
    Response response = await apiClient.invokeAPI(trendingpath, 'POST',jsonEncode(body) );
    print("hello"+response.body);

    return AiModel.fromJson(jsonDecode(response.body));
  }
}