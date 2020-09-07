import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:reto_bootcamp/services/api_service.dart';

class ListPokemon extends StatefulWidget {
  @override
  _ListPokemonState createState() => _ListPokemonState();
}

class _ListPokemonState extends State<ListPokemon> {
  List listPokemon = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ApiService().getListPokemon().then((value) {
      setState(() {
        listPokemon = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  height: 200,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Image.asset("assets/img/pokeball.png"),
                      ),
                      Positioned(
                        top: 60,
                        right: 28,
                        child: Image.asset("assets/img/list.png"),
                      ),
                      Positioned(
                        top: 80,
                        left: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pokedex",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Color(0XFF303943),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              listPokemonComponent()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listPokemonComponent() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.93,
      height: MediaQuery.of(context).size.height * 0.7,
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(listPokemon.length, (index) {
          return Container(
            child: Card(
              color: Color(convertColor(listPokemon.elementAt(index)["type"])),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: InkWell(
                onTap: () {
                  int args = listPokemon.elementAt(index)["id"];
                  Navigator.of(context)
                      .pushNamed('detail-pokemon', arguments: args);
                },
                child: Container(
                    child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          margin: EdgeInsets.only(top: 15),
                          child: Text(
                            listPokemon.elementAt(index)["name"],
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Color(0xffE5E5E5).withOpacity(0.3),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            listPokemon.elementAt(index)["type"],
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      alignment: Alignment.bottomRight,
                      child:
                          Image.network(listPokemon.elementAt(index)["photo"]),
                    )
                  ],
                )),
              ),
            ),
          );
        }),
      ),
    );
  }

  int convertColor(String type) {
    switch (type) {
      case "fire":
        {
          return 0xFFfb6c6c;
        }
        break;

      case "grass":
        {
          return 0XFF48d0b0;
        }
        break;

      case "water":
        {
          return 0xff77bdfe;
        }
        break;

      case "water":
        {
          return 0xff77bdfe;
        }
        break;

      default:
        {
          return 0xff77bdfe;
        }
    }
  }
}
