import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisdomday/blocs/quote_bloc.dart';
import 'package:wisdomday/blocs/quote_event.dart';
import 'package:wisdomday/blocs/quote_state.dart';

class WisdomPage extends StatefulWidget {
  const WisdomPage({Key? key}) : super(key: key);

  @override
  State<WisdomPage> createState() => _WisdomPageState();
}

class _WisdomPageState extends State<WisdomPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<QuoteBloc, QuoteState>(
            listener: (context, state) {
              if(state is QuoteLoaded){
                print('...loaded');
              }
            },
            child: Column(
              children: [
                Expanded(child: BlocBuilder<QuoteBloc, QuoteState>(
                  builder: (context, state) {
                    if (state is QuoteInitial) {
                      return _buildInitial();
                    } else if (state is QuoteLoading) {
                      return _buildLoading();
                    } else if (state is QuoteLoaded) {
                      return _buildQuote(state.quoteModel);
                    } else {
                      return Center(child: Text('not defined'));
                    }
                  },
                )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () => BlocProvider.of<QuoteBloc>(context).add(GetQuote()),
                      child: Text('Show Quote')),
                )
              ],
            )));
  }

  Widget _buildInitial() => const Center(child: Text('waiting for a quote....'));

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());

  Widget _buildQuote(quoteModel) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Animate(
          effects: const [FadeEffect()],
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('${quoteModel.content}', style: const TextStyle(fontSize: 20),),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('- ${quoteModel.author}'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
