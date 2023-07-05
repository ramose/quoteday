import 'package:equatable/equatable.dart';

import '../models/quote_model.dart';

class QuoteState extends Equatable{
const QuoteState();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class InitialQuote extends QuoteState{}

class QuoteLoading extends QuoteState{}

class QuoteLoaded extends QuoteState{
  final QuoteModel quoteModel;
  const QuoteLoaded(this.quoteModel);
}
