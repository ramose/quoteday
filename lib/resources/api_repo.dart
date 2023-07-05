import '../models/quote_model.dart';
import 'api_provider.dart';

class ApiRepo {
  final _provider = ApiProvider();

  Future<QuoteModel> getQuote(){
    return _provider.getQuote();
  }
}