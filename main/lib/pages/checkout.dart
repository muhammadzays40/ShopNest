// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, use_key_in_widget_constructors, prefer_initializing_formals, must_be_immutable, no_logic_in_create_state, unnecessary_this

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:main/pages/generateorder.dart';

class CheckOut extends StatefulWidget {
  String? name;
  int? price;
  int? quantity;
  String? image;

  CheckOut.value(String? name, int? price, int? quantity, String? image) {
    this.name = name;
    this.price = price;
    this.quantity = quantity;
    this.image = image;
  }

  @override
  State<CheckOut> createState() => CheckOutState(name, price, quantity, image);
}

class CheckOutState extends State<CheckOut> {
  String? customerName;
  String? customerAddress;
  String? phoneNumber;
  String? name;
  String? image;
  String? paymentMethod;
  int? price;
  int? quantity;
  int? payAble;

  int _paymentMethod = 0;

  CheckOutState(String? name, int? price, int? quantity, String? image) {
    this.name = name;
    this.price = price;
    this.quantity = quantity;
    this.image = image;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    payAble = (price! * quantity!);
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
              SingleChildScrollView(
                child: Container(
                  width: size.width,
                  height: 470,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                        child: Text(
                          'Enter Delivery Details',
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 238, 240, 143),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: TextField(
                          onChanged: (value) {
                            customerName = value;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            label: Text('Name'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 238, 240, 143),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: TextField(
                          onChanged: (value) {
                            customerAddress = value;
                          },
                          maxLines: 3,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            label: Text('Address'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 238, 240, 143),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: TextField(
                          onChanged: (value) {
                            phoneNumber = value;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            label: Text('Phone Number'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          'Select payment method:',
                          style: GoogleFonts.roboto(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Row(
                          children: [
                            Radio(
                                activeColor: Colors.red,
                                value: 0,
                                groupValue: _paymentMethod,
                                onChanged: (value) {
                                  setState(() {
                                    _paymentMethod = 0;
                                    paymentMethod = "Cash";
                                  });
                                }),
                            Text('Cash on delivery'),
                            SizedBox(
                              width: 10,
                            ),
                            Radio(
                                activeColor: Colors.red,
                                value: 1,
                                groupValue: _paymentMethod,
                                onChanged: (value) {
                                  setState(() {
                                    _paymentMethod = 1;
                                    paymentMethod = "Card";
                                  });
                                }),
                            Text('Card'),
                          ],
                        ),
                      ),
                      Container(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                          ),
                          child: Text(
                            'Submit',
                            style: GoogleFonts.roboto(
                              fontSize: 15,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GenerateOrder(
                                        customerName,
                                        customerAddress,
                                        phoneNumber,
                                        paymentMethod,
                                        name,
                                        price,
                                        image,
                                        quantity,
                                        payAble)));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: Row(
                  children: [
                    Image.memory(base64Decode(image.toString())),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
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
                            'Payable Amount: $payAble',
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
            ],
          ),
        ),
      ),
    );
  }
}
