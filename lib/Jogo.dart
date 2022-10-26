import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";



  void _opcaoSelecionada(String escolhaUsuario){
        var opcoes = [ "pedra", "papel", "tesoura" ];
        var numero = Random().nextInt(3);
        var escolhaApp = opcoes[numero];


        print("Escolha do App: $escolhaApp");
        print("Escolha do Usuario: $escolhaUsuario");

        switch( escolhaApp ){
          case "pedra" :
            setState(() {
             this._imagemApp = AssetImage("images/pedra.png");
            });
            break;
          case "papel" :
            setState(() {
             this._imagemApp = AssetImage("images/papel.png");
            });
            break;
          case "tesoura" :
            setState(() {
             this._imagemApp = AssetImage("images/tesoura.png");
            });
            break;
        }
        if(
          (escolhaUsuario == "pedra" && escolhaApp == "tesoura" ) ||
          (escolhaUsuario == "tesoura" && escolhaApp == "papel" ) ||
          (escolhaUsuario == "papel" && escolhaApp == "pedra" )
        ){
          _mensagem = "Parabens!Você ganhou 👏";
        }else if(
          (escolhaApp == "pedra" && escolhaUsuario == "tesoura" ) ||
          (escolhaApp == "tesoura" && escolhaUsuario == "papel" ) ||
          (escolhaApp == "papel" && escolhaUsuario == "pedra" )
        ){
          _mensagem = "A maquina ganhou 😭";
        }else{
          _mensagem = "empatou!! 😱";
        }
  }
  void researJogo(){
    setState(() {
      this._imagemApp =  AssetImage("images/padrao.png");
      this._mensagem = "Escolha uma opção abaixo";
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Joken Pô"),
        backgroundColor: Colors.grey[800],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(90, 90, 90, 0),
            child: Text(
                "Escolha do App:",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(90, 30, 90, 0),
            child: Image(image: _imagemApp,),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(90, 50, 90, 60),
            child: Text(
              this._mensagem,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 17.5,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("images/pedra.png", width: 110,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset("images/papel.png", width: 110,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset("images/tesoura.png", width: 110,),
              ),
              /*
              Image.asset("images/pedra.png", width: 110,),
              Image.asset("images/papel.png", width: 110,),
              Image.asset("images/tesoura.png", width: 110,),
              */
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 30)),
          Center(
            child: RaisedButton(
                child: Text(
                  "resetar Jogo",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
                color: Colors.grey[800],
                onPressed: () => this.researJogo()
            ),
          )
        ],
      ),
    );
  }
}
