import 'package:flutter/material.dart';
import 'package:reto_bootcamp/services/api_service.dart';

class DetailPokemon extends StatefulWidget {

  @override
  _DetailPokemonState createState() => _DetailPokemonState();
}

class _DetailPokemonState extends State<DetailPokemon> {
  Map detail = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int id = ModalRoute.of(context).settings.arguments as int;
    ApiService().getDetailPokemon(id).then((value) {
      setState(() {
        detail = value;
      });
    });

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          color: Colors.green,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 20,
                            bottom: 30,
                            left: 20,
                            right: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset("assets/img/back.png"),
                              Image.asset("assets/img/favorite.png")
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                detail["name"],
                                style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                "#00${detail["id"]}",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                            color: Color(0xffE5E5E5).withOpacity(0.3),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            detail["type"],
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 150,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                color: Colors.white),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 60,
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "About",
                                        style: TextStyle(
                                            color: Color(0xff303943),
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Base Stats",
                                        style: TextStyle(
                                            color: Color(0xff303943),
                                            fontSize: 14),
                                      ),
                                      Text(
                                        "Evolution",
                                        style: TextStyle(
                                            color: Color(0xff303943),
                                            fontSize: 14),
                                      ),
                                      Text(
                                        "Moves",
                                        style: TextStyle(
                                            color: Color(0xff303943),
                                            fontSize: 14),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    detail["about"],
                                    style: TextStyle(
                                        color: Color(0xff303943), fontSize: 15),
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 150,
                    child: Image.network(detail["photo"]),
                  ),
                ],
              ),
            ],
          )),
    )
    );
  }
}
