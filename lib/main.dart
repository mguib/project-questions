import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resultado.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao':2},
        {'texto': 'Vermelho', 'pontuacao':8},
        {'texto': 'Verde', 'pontuacao':9},
        {'texto': 'Verde', 'pontuacao':6},
      ],
    },
    {
      'texto': 'Qual é seu animal favorito?',
      'respostas': [
       {'texto': 'Gato', 'pontuacao':5},
       {'texto': 'Coelho', 'pontuacao':3},
       {'texto': 'Cobra', 'pontuacao':7},
       {'texto': 'Leão', 'pontuacao':2},
      ],
    },
    {
      'texto': 'Qual sua linguagem de programação favorita,',
      'respostas': [
        {'texto': 'JavaScript', 'pontuacao':9},
        {'texto': 'C++', 'pontuacao':4},
        {'texto': 'Python', 'pontuacao':6},
        {'texto': 'C', 'pontuacao':8},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
      // print(_pontuacaoTotal);
    }
  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Perguntas'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: temPerguntaSelecionada
          ? Questionario(
              perguntas: _perguntas,
              perguntaSelecionada: _perguntaSelecionada,
              quandoResponder: _responder,
            )
          : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
    ));
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
