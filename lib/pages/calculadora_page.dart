import 'package:flutter/material.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

enum operaciones{sumar, resta, multiplicar, division_entera}
class _CalculadoraPageState extends State<CalculadoraPage> {
  int _total = 0;
  final _numero1 = TextEditingController();
  final _numero2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Calculadora'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Image(image:AssetImage('assets/images/logo.jpg'),
                  height: 150,
                  width: 150,
              ),
              const SizedBox(
                height: 26.0,
              ),
              
              TextFormField(
                controller: _numero1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Digite el primer número: ",
                ),
                keyboardType: TextInputType.number,
              ),

              const SizedBox(
                height: 16.0,
              ),

              TextFormField(
                controller: _numero2,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Digite el segundo número: ",
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 16.0,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                      onPressed: (){_calcular(operaciones.sumar);},
                      label: const Text("+")
                  ),
                  const SizedBox(
                    width: 16.0,),

                  ElevatedButton.icon(
                      onPressed: (){_calcular(operaciones.resta);},
                      label: const Text("-")
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  ElevatedButton.icon(
                      onPressed: (){_calcular(operaciones.multiplicar);},
                      label: const Text("*")
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  ElevatedButton.icon(
                      onPressed: (){_calcular(operaciones.division_entera);},
                      label: const Text("/")
                  ),
                ],
              ),





              const SizedBox(
                height: 16.0,
              ),

              Text(
                "El total de la suma es: $_total ",
                style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Función para ejecutar el tipo de cálculo a realizar.

void _calcular( Enum operacion){
   setState(() {
     if(operacion==operaciones.sumar){
       _total= int.parse(_numero1.text)+ int.parse(_numero2.text);
     }
     else if(operacion==operaciones.resta){
       _total= int.parse(_numero1.text)- int.parse(_numero2.text);
     }
     else if(operacion==operaciones.multiplicar){
       _total= int.parse(_numero1.text)* int.parse(_numero2.text);
     }
     else {
       _total= int.parse(_numero1.text)~/ int.parse(_numero2.text);
     }



   });
}


}
