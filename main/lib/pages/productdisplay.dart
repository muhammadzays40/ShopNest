// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, unused_local_variable, use_key_in_widget_constructors, must_be_immutable, unused_element, no_logic_in_create_state, prefer_initializing_formals, avoid_unnecessary_containers, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:main/pages/checkout.dart';

class ProductDisplay extends StatefulWidget {
  String? name;
  String? description;
  int? price;
  String? image;

  ProductDisplay();
  ProductDisplay.value(
      String? name, String? description, int? price, String? image) {
    this.name = name;
    this.description = description;
    this.price = price;
    this.image = image;
  }

  @override
  State<ProductDisplay> createState() => _ProductDisplayState(
      name: name, description: description, price: price, image: image);
}

String addOrRemoveFromCart(bool addedToCart) {
  if (addedToCart) {
    return 'Remove from Cart';
  } else {
    return 'Add to Cart';
  }
}

class _ProductDisplayState extends State<ProductDisplay> {
  int Quantity = 0;

  String? name;
  String? description;
  int? price;
  String? image;

  _ProductDisplayState({this.name, this.description, this.price, this.image});

  bool addedToCart = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 199, 114),
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: 40,
          ),
          Text(
            'Product Display',
            style: GoogleFonts.arvo(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                alignment: Alignment.center,
                height: 620,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.memory(base64Decode(image.toString())),
                    Text(
                      '$name',
                      style: GoogleFonts.roboto(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$description',
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Rs$price',
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    Quantity--;
                                  });
                                },
                                child: Text(
                                  '-',
                                  style: GoogleFonts.roboto(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black38),
                                ),
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    Quantity++;
                                  });
                                },
                                child: Text(
                                  '+',
                                  style: GoogleFonts.roboto(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black38),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            'Quantity: $Quantity',
                            style: GoogleFonts.roboto(
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back'),
              ),
              SizedBox(
                width: 30,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => 
                  CheckOut.value(name, price, Quantity, image)));
                },
                child: Text('Check Out'),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
