import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisdomday/blocs/quote_event.dart';
import 'package:wisdomday/blocs/quote_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState>{
  QuoteBloc():super(InitialQuote()){
    on<GetQuote>((event, emit){

    });
  }

}