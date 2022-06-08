import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("images/padrao.jpeg");
  var _mensagem = "Escolha uma opção agora";

  void _opcaoSelecionada(String escolhaUsuario){

    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch( escolhaApp ){
      case "pedra":
      setState(() {
        this._imagemApp =  AssetImage("images/pedra.jpeg");
      });
      break;
      case "papel":
      setState(() {
        this._imagemApp =  AssetImage("images/papel.jpeg");
      });
      break;
      case "tesoura":
      setState(() {
        this._imagemApp =  AssetImage("images/tesoura.jpeg");
      });
      break;
    }
  //validação do ganhador

    if(
    //Usuário ganhador
      (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
          (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
          (escolhaUsuario == "papel" && escolhaApp == "pedra")
    ){
  setState(() {
    this._mensagem = "Parabéns !!! Você ganhou :)";
  });
  }else if(
    //App ganhador
    (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")
    ){
      setState(() {
        this._mensagem = "Foi Mal!!! Você perdeu :(";
      });
    }
    else{
      setState(() {
        this._mensagem = "Empatamos!!! :)";
      });
    }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 10),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
         Image(image: this._imagemApp, ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 10),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("images/pedra.jpeg", height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset("images/papel.jpeg", height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset("images/tesoura.jpeg", height: 100,),
              ),

            ],
          ),
          ],
    ),
    );
  }
}
