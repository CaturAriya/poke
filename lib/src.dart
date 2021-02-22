import 'package:pokemon/Ability.dart';
import 'package:pokemon/Detail.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/PokeLink.dart';

class Find extends StatefulWidget {
  final String src;
  Find({Key key, @required this.src}) : super(key: key);
  @override
  _State createState() => _State();
}

class _State extends State<Find> {
  List<Detail> search;

  getSrc() async {
    if (search == null) {
      // ignore: deprecated_member_use
      search = new List<Detail>();
    }

    print("pulling search");
    var pull = await Pokepull.fetchpokemon(widget.src.toString());
    if (pull != null) {
      setState(() {
        search.add(Detail.detafromJson(pull));
      });
    }

    print(search.length);
    return search;
  }

  @override
  void initState() {
    super.initState();
    getSrc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Result :"),
        ),
        body: Container(
            child: search.length > 0
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 2,
                        childAspectRatio: 1.5),
                    itemCount: search.length,
                    itemBuilder: (
                      BuildContext context,
                      int index,
                    ) {
                      return Card(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        margin: EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(children: [
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Ability(
                                                pokedetail: search[index],
                                              )));
                                  SizedBox(height: 6.0);
                                },
                                child: Container(
                                  width: 100,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            NetworkImage(search[index].sprites),
                                        scale: 0.6,
                                        fit: BoxFit.cover),
                                  ),
                                )),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "#${search[index].num} ${search[index].name}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),
                                ))
                          ]),
                        ),
                      );
                    },
                  )
                : Container(
                    child: Center(
                    child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                  ))));
  }
}
