import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisdomday/blocs/quote_event.dart';
import 'package:wisdomday/blocs/quote_state.dart';
import 'package:wisdomday/models/quote_model.dart';

import '../resources/api_repo.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState>{
  QuoteBloc():super(QuoteInitial()){
    final ApiRepo _apiRepo = ApiRepo();

    on<GetQuote>((event, emit) async{
      // print('get quote...');
      emit(QuoteLoading());
      final _quote = await _apiRepo.getQuote();
      // print(_quote.content);
      emit(QuoteLoaded(_quote));
    });
  }

}