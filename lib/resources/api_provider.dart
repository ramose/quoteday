import 'package:dio/dio.dart';

import '../models/quote_model.dart';

class ApiProvider {
  final dio = Dio();
  String url = 'https://api.quotable.io/random';

  Future<QuoteModel> getQuote() async {
    final response = await dio.get(url);
    // print(response.data);
    QuoteModel model = QuoteModel.fromJson(response.data);
    // print(model.author);
    return model;
  }

}