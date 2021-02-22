import 'package:flutter/material.dart';
import 'package:pokemon/Detail.dart';

class Ability extends StatelessWidget {
  final Detail pokedetail;
  const Ability({Key key, this.pokedetail}) : super(key: key);

  bodyWidget() => Container();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.red,
          title: Text(
            pokedetail.name,
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
                child: Card(
          child: Column(
            children: [
              Image(
                image: NetworkImage(pokedetail.sprites, scale: 0.5),
              ),
              Row(
                children: [
                  Container(
                    child: Column(
                      children: [],
                    ),
                  ),
                  Text("Pokemon Name : ", style: TextStyle(fontSize: 20)),
                  Text(
                    pokedetail.name,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Text(
                "",
                style: TextStyle(fontSize: 20),
              ),
              Row(
                children: [
                  Text("Pokemon Height : ", style: TextStyle(fontSize: 20)),
                  Text(
                    '${pokedetail.height / 10} m',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Pokemon Weight : ", style: TextStyle(fontSize: 20)),
                  Text(
                    '${pokedetail.weight / 10} kg',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Text(
                "",
                style: TextStyle(fontSize: 20),
              ),
              Container(
                  child: Text(
                "Types : ",
                style: TextStyle(fontSize: 20),
              )),
              //types
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      child: ListView.builder(
                        itemCount: pokedetail.types.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Container(
                                child: Text(
                                  "-${pokedetail.types[index]}",
                                  style: TextStyle(fontSize: 20),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    )
                  ],
                )
              ]),
              Container(
                  child: Text(
                "Moves : ",
                style: TextStyle(fontSize: 20),
              )),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Column(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      child: ListView.builder(
                        itemCount: pokedetail.moves.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Container(
                                child: Text(
                                  "-${pokedetail.moves[index]}",
                                  style: TextStyle(fontSize: 20),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    )
                  ],
                )
              ])
            ],
          ),
        ))));
  }
}
