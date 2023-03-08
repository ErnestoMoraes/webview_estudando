import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' show parse;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Future<void> requisicao() async {
    Dio dio = Dio();
    Response response = await dio
        .get('https://qacademico.ifce.edu.br/qacademico/index.asp?t=1001');
    final document = parse(response.data);
    final body = document.getElementsByTagName('body')[0];
    final html = body.getElementsByClassName('formulario');
  
    print(html);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            requisicao();
          },
          child: const Text('Requisição'),
        ),
      ),
    );
  }
}
