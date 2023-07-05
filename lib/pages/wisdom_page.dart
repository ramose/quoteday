import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wisdomday/models/quote_model.dart';

class WisdomPage extends StatefulWidget {
  const WisdomPage({Key? key}) : super(key: key);

  @override
  State<WisdomPage> createState() => _WisdomPageState();
}

class _WisdomPageState extends State<WisdomPage> {
  String _quoteText = 'waiting for a quote...';
  String _quoteAuthor = '';

  Future<void> _getQuote() async {
    final dio = Dio();
    final response = await dio.get('https://api.quotable.io/random');
    // print(response.data);
    QuoteModel model = QuoteModel.fromJson(response.data);
    // print(model.content);

    setState(() {
      _quoteText = model.content.toString();
      _quoteAuthor = model.author.toString();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_quoteText),
                  SizedBox(height: 20,),
                  Text(_quoteAuthor),
                ],
              ),
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                ElevatedButton(onPressed: _getQuote, child: Text('Show Quote')),
          )
        ],
      ),
    );
  }
}
