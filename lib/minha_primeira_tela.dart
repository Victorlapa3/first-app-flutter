import 'package:flutter/material.dart';

class MyFirstWidget extends StatelessWidget {
  const MyFirstWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.cyan,
                  width: 50,
                  height: 50,
                ),
                Container(
                  color: Colors.pinkAccent,
                  width: 50,
                  height: 50,
                ),
                Container(
                  color: Colors.purple,
                  height: 50,
                  width: 50,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.green,
                  width: 50,
                  height: 50,
                ),
                Container(
                  color: Colors.orange,
                  width: 50,
                  height: 50,
                ),
                Container(
                  color: Colors.blueAccent,
                  height: 50,
                  width: 50,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.amberAccent,
                  width: 50,
                  height: 50,
                ),
                Container(
                  color: Colors.greenAccent,
                  width: 50,
                  height: 50,
                ),
                Container(
                  color: Colors.purpleAccent,
                  height: 50,
                  width: 50,
                ),
              ],
            ),
          ),
// Retanguolo escrito: Exemplo
          Container(
            margin: EdgeInsets.only(bottom: 10),
            color: Colors.amber,
            height: 30,
            width: 300,
            child: Text(
              'Exemplo',
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
              ),
              textAlign: TextAlign.center,
            ),
          ),
// Botão
          ElevatedButton(
            onPressed: () {
              print('Você apertou o botão!');
            },
            child: Text('Aperte o botão!'),
          )
        ],
      ),
    );
  }
}
