// ignore_for_file: use_key_in_widget_constructors, empty_constructor_bodies, prefer_initializing_formals, prefer_const_constructors, unused_import, must_be_immutable, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class GenerateOrder extends StatelessWidget {
  String? customerName;
  String? customerAddress;
  String? phoneNumber;
  String? paymentMethod;
  String? name;
  String? image;
  int? price;
  int? quantity;
  int? payableAmount;

  GenerateOrder(
      String? customerName,
      String? customerAddress,
      String? phoneNumber,
      String? paymentMethod,
      String? name,
      int? price,
      String? image,
      int? quantity,
      int? payableAmount) {
    this.customerName = customerName;
    this.customerAddress = customerAddress;
    this.phoneNumber = phoneNumber;
    this.paymentMethod = paymentMethod;
    this.name = name;
    this.price = price;
    this.image = image;
    this.quantity = quantity;
    this.payableAmount = payableAmount;
  }

  Future post() async {
    Uri url = Uri.parse('http://10.0.2.2:3000/addOrder');
    var response = http.post(
    url,
    headers: {'Content-Type' : 'application/json'},
    body: json.encode({
      'customerName': customerName.toString(),
      'customerAddress': customerAddress.toString(),
      'phoneNumber': phoneNumber.toString(),
      'paymentMethod': paymentMethod.toString(),
      'name': name.toString(),
      'image': image.toString(),
      'price': price.toString(),
      'quantity': quantity.toString(),
      'payableAmount': payableAmount.toString()
    }));

    print(response);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 245, 199, 114),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 20),
              child: Text(
                'Check Out',
                style: GoogleFonts.pacifico(
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: size.width,
              height: size.height * 0.875,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text(
                      'Delivery Details',
                      style: GoogleFonts.roboto(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text(
                      'Your Name: $customerName',
                      style: GoogleFonts.roboto(
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text(
                      'Your Address: $customerAddress',
                      style: GoogleFonts.roboto(
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text(
                      'Your Phone Number: $phoneNumber',
                      style: GoogleFonts.roboto(
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text(
                      'Selected Payment Method: $paymentMethod',
                      style: GoogleFonts.roboto(
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Row(
                      children: [
                        Image.memory(base64Decode(image.toString())),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Column(
                            children: [
                              Text(
                                'Name: $name',
                                style: GoogleFonts.roboto(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Price: $price',
                                style: GoogleFonts.roboto(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Quantity: $quantity',
                                style: GoogleFonts.roboto(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Payable Amount: $payableAmount',
                                style: GoogleFonts.roboto(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    onPressed: () {
                      post();
                    },
                    child: Text(
                      'Place Order',
                      style: GoogleFonts.roboto(
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
