import 'package:flutter/material.dart';


class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  
  double _valorSlider = 100;
  bool _bloquearCheck = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Slider'),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 50.0),
           child: Column(
             children: <Widget>[
               _crearSlider(),
               _crearChexbox(),
               _crearSwitch(),
               Expanded(
                 child: _crearImagen()
                 ),
             ],
           )
        ),
    );
  }

  Widget _crearSlider(){
    return Slider(
       activeColor: Colors.indigoAccent,
       label: 'Tamano de la imagen',
      // divisions: 20,
       value: _valorSlider,
       min: 10.0,
       max: 400.0,
       onChanged:(_bloquearCheck) ? null : (valor){
          setState(() {
             _valorSlider = valor;  
          });
       },
    );
  }
  Widget _crearImagen(){
    return Image(
      image: NetworkImage('https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/the-batman-noventa-90-matt-reeves-1552916303.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }
  Widget _crearChexbox(){
    //  return  Checkbox(
    //     value: _bloquearCheck,
    //     onChanged: (valor){
    //       setState(() {
    //        _bloquearCheck = valor;            
    //       });
    //     },
    //  );
    return CheckboxListTile(
      title: Text('bloquear slider'),
      value: _bloquearCheck,
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor; 
        });
      },
    );
  }
  Widget _crearSwitch(){
     return SwitchListTile(
      title: Text('bloquear slider'),
      value: _bloquearCheck,
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor; 
        });
      },
    );
  }

}
