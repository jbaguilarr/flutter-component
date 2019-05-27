import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  
  ScrollController _scrollController = new ScrollController();
  
  List<int> _listaNumero;// = [1,2,3,4,5];
  int _ultimoItem =0;
  bool _isLoading = false;
  
  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener((){
       if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        //  _agregar10();
        fetchData();
       }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading()
        ],
      )
    );
  }

  Widget _crearLista(){
      return RefreshIndicator(
           onRefresh: obtenerPagina1,
           child: ListView.builder(
           itemCount: _listaNumero.length,
           itemBuilder: (BuildContext context,int index){
             final imagen = _listaNumero[index];
              return FadeInImage(
                 image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
                 placeholder: AssetImage('assets/jar-loading.gif'),
              );
           },
        ),
      );  
  }

  Future<Null> obtenerPagina1() async{

    final duration = new Duration(seconds: 2);

    new Timer(duration,(){
         _listaNumero.clear();
         _ultimoItem++;
         _agregar10();
      }
    );
     return Future.delayed(duration);
  }

  void _agregar10(){
     for(var i;i<10;i++){
       _ultimoItem++;
       _listaNumero.add(_ultimoItem);
     }
     setState(() {
       
     });
  }
  Future<Null> fetchData() async{
    _isLoading = true;
    setState(() {
    });
        final duration = new Duration(seconds: 2);
        
        return new Timer(duration,respuestaHTTP);
  }
  void respuestaHTTP(){
    _isLoading = false;

    _scrollController.animateTo(
       _scrollController.position.pixels + 100,
       curve: Curves.fastOutSlowIn,
       duration: Duration(microseconds: 250)
    );

    _agregar10();
  }

  Widget _crearLoading(){
     if(_isLoading){
       return Column(
         mainAxisSize: MainAxisSize.max,
         mainAxisAlignment: MainAxisAlignment.end,
         children: <Widget>[
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               CircularProgressIndicator(),
             ],
           ),
           SizedBox(height: 15.0,)
         ],
       );
     }else{
       return Container();
     }
  }
}