import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class PaymentSuccessFullScreen extends StatefulWidget {
  final String? paymentId;
  const PaymentSuccessFullScreen({Key? key,this.paymentId}) : super(key: key);

  @override
  _PaymentSuccessFullScreenState createState() => _PaymentSuccessFullScreenState();
}

class _PaymentSuccessFullScreenState extends State<PaymentSuccessFullScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: Icon(Icons.arrow_back,color: Colors.black,),
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text("Checkout (3/3)",style: TextStyle(color: Colors.black),),
          ),
          body: Container(
            color: Colors.white,
              padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.check_circle),
                        Text("Delivery address")
                      ],
                    ),
                    DottedLine(
                      direction: Axis.horizontal,
                      lineLength: 20.0,
                      lineThickness: 1.0,
                      dashLength: 4.0,
                      dashColor: Colors.black,
                      dashGradient: [Colors.black, Colors.black],
                      dashRadius: 0.0,
                      dashGapLength: 4.0,
                      dashGapColor: Colors.transparent,
                      dashGapGradient: [Colors.black, Colors.black],
                      dashGapRadius: 0.0,
                    ),
                    Column(
                      children: [
                        Icon(Icons.check_circle),
                        Text("Payment")
                      ],
                    ),
                    DottedLine(
                      direction: Axis.horizontal,
                      lineLength: 20.0,
                      lineThickness: 1.0,
                      dashLength: 4.0,
                      dashColor: Colors.black,
                      dashGradient: [Colors.black, Colors.black],
                      dashRadius: 0.0,
                      dashGapLength: 4.0,
                      dashGapColor: Colors.transparent,
                      dashGapGradient: [Colors.black, Colors.black],
                      dashGapRadius: 0.0,
                    ),
                    Column(
                      children: [
                        Icon(Icons.adjust,color: Colors.orange,),
                        Text("Order Placed")
                      ],
                    )
                  ],
                ),
                Divider(),
                Container(
                  height: 190,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/order_placed.jpg"))
                  ),
                ),
                Text("Order Placed Successfully!",style: TextStyle(fontWeight: FontWeight.bold),),
                Text("Congratulations! Your order has been placed."),
                Text("You can track your order no. ${widget.paymentId} "),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.grey[100]
                          ),
                          onPressed: (){}, child: Text("Continue shopping",style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12),)),
                    ),
                    SizedBox(width: 5,),
                    Flexible(
                       flex: 2,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.orange
                          ),
                          onPressed: (){}, child: Text("Track order",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,  fontSize: 12),)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
