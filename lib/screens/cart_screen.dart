
import 'package:flutter_razorpay_demo/model/data_model.dart';
import 'package:flutter_razorpay_demo/styles/text_styles.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter/material.dart';
import 'payment_successfull_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Razorpay? _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back,color: Colors.black,),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Shopping Cart",style: AppTextStyles.headingTextStyle,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Text("Your Cart",style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(width: 5,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.orange
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text("2 items",style: TextStyle(color: Colors.white),),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                    color: Colors.grey[100]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("The Jeans Shop",style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  Icon(Icons.more_vert,color: Colors.grey,)
                ],
              ),
            ),
            cartItemsList(),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Sub Total",
                            style: TextStyle(
                                fontWeight: FontWeight.bold),),
                          Text(
                            "Rs. 1500",
                            style: TextStyle(
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          Text("Value Added Tax(VAT)",style: TextStyle(
                          fontWeight: FontWeight.bold),),
                          Text(
                            "0",
                            style: TextStyle(
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Delivery Charges",
                            style: TextStyle(
                                fontWeight: FontWeight.bold),),
                          Text(
                            "0",
                            style: TextStyle(
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Order Total",style: TextStyle(
                          fontWeight: FontWeight.bold,color: Colors.orange),),
                          Text(
                            "Rs. 1500",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,color: Colors.orange),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: Container(
            height: 70,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text("2 items in cart",style: TextStyle(color: Colors.grey),),
                      Text("Rs. 1500",style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange
                      ),
                      onPressed: openCheckout, child: Text("Place order")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cartItemsList() {
    return ListView.separated(
      separatorBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.fromLTRB(8,0,8,0),
          child: Divider(),
        );
      },
      itemCount: data.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return cartItem(data,index);
      },
    );
  }

  Widget cartItem(List<DataModel> data,int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  width: 50,
                  child: Image.asset(
                      data[index].image,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(data[index].productName,style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("Size: ${data[index].size}",style: TextStyle(color: Colors.grey),),
                    Text("Color: ${data[index].color}",style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Rs. ${data[index].price}",style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade300,
                                
                          ),
                          borderRadius: BorderRadius.circular(3)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 3, 8, 3),
                          child: Row(
                            children: [
                              Text("01"),
                              Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                        ),
                      ),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Image(image: AssetImage("assets/images/edit_icon.png"),height: 18),
                            Text("Edit")
                          ],
                        ),
                        SizedBox(width: 20,),
                        Row(
                          children: [
                            Icon(Icons.delete_outline),
                            Text("Remove")
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          // Divider(
          //   thickness: 1,
          // )
        ],
      ),
    );
  }

  void openCheckout() async {
    double price = 150000.0000;
    print(price);

    var options = {
      'key': 'rzp_test_qWoRx4NMLA90hH',
      'amount': price,
      'name': 'Test Payment',
      'description': 'This is Test Payment',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay!.open(options);

    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print(response.orderId);

    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!);

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return PaymentSuccessFullScreen(paymentId: response.paymentId!);
    }));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print(response.message);

    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print(response);
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!);
  }
}
