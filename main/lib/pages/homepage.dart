// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_const_constructors_in_immutables, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:main/pages/productdisplay.dart';
import 'package:main/product.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> productList = [];
  int i = 0;

  Future get() async {
    Uri url = Uri.parse('http://10.0.2.2:3000/allProducts');

    var response = await http.get(
      url,
    );

    List<dynamic> body = json.decode(response.body);
    productList = body.map((dynamic item) => Product.fromJson(item)).toList();
    print(response.body);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    for (; i < 1; i++) {
      get();
    }
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 245, 199, 114),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(25),
                child: Text(
                  'Shopnest',
                  style: GoogleFonts.pacifico(
                    fontSize: 30,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  'Available Products',
                  style: GoogleFonts.arvo(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: productList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) =>
                            ProductDisplay.value(
                              productList[index].name,
                              productList[index].description,
                              productList[index].price,
                              productList[index].image,
                            )
                          ));
                          print('Item Tapped');
                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(5),
                                child: Image.memory(base64Decode(
                                    productList[index].image.toString())),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                productList[index].name.toString(),
                                style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Rs${productList[index].price}',
                                style: GoogleFonts.roboto(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
