import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:society_resident/constants/global_variables.dart';
import 'package:society_resident/services/auth_service.dart';
import 'package:society_resident/services/complain.dart';
import 'package:toast/toast.dart';

class moneyManagement extends StatefulWidget {
  @override
  _moneyManagementState createState() => _moneyManagementState();
}

class _moneyManagementState extends State<moneyManagement> {
  TextEditingController _contributedMoneyInput = TextEditingController();
  TextEditingController _spendMoneyInput = TextEditingController();

  double _currentMoney = 0.0;
  double _spendMoney = 0.0;
  double _totalEarnedMoney = 0.0;
  String spendErrorText;
  bool spendError=false;

  @override
  void initState() {
    super.initState();
    print("EMAil OF USER");
    user.email = prefs.getString('email');
    print(user.email);
    AuthService().getCurrentUser();
    ComplainServices().getMyComplains();


  }

  void updateMoneyPool2(TextEditingController spendMoney) {
    setState(() {
      // _currentMoney = double.parse(contributedMoney.text) + double.parse(_currentMoney.toString());
      // print(_currentMoney);
      _currentMoney = _currentMoney - double.parse(spendMoney.text);
      print(_currentMoney);
      _spendMoney = double.parse(spendMoney.text) + _spendMoney;
      _spendMoneyInput.clear();

    });
  }

  void updateMoneyPool(TextEditingController contributedMoney) {
    setState(() {
      _currentMoney = double.parse(contributedMoney.text) +
          double.parse(_currentMoney.toString());
      print(_currentMoney);
      // _currentMoney = double.parse(spendMoney.text) - _currentMoney;
      //     print(_currentMoney);
      // _spendMoney +=   double.parse(spendMoney.text) + _spendMoney;
      _totalEarnedMoney = _currentMoney + _spendMoney;
      _contributedMoneyInput.clear();
    });
  }

  bool isCurrentorSpend = false;

  _settingModalBottomSheet(
      BuildContext context, TextEditingController controller, bool iscurrent) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
                decoration: new BoxDecoration(
                    color: Colors.white, //new Color.fromRGBO(255, 0, 0, 0.0),
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(40.0),
                        topRight: const Radius.circular(40.0))),
                child: new Wrap(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Enter The Price You Want To Contribute:",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child:
                      // text_input(_price,
                      //     'Enter Your Price', Icons.contact_mail, false),
                      TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          //labelText: 'Email',
                          hintText: 'Enter Your Price',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                          errorText: spendError?spendErrorText:null,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 42, vertical: 20),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.grey),
                              gapPadding: 10),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.grey),
                              gapPadding: 10),
                          errorBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.grey),
                              gapPadding: 10),
                          focusedErrorBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.grey),
                              gapPadding: 10),
                          prefixIcon: Icon(
                            Icons.attach_money,
                            color: Colors.grey,
                          ),
                        ),

                        onChanged: (value) {
                          if (!iscurrent) {
                            setState(() {
                              if (double.parse(value) > _currentMoney) {
                                spendError = true;
                                spendErrorText = 'high value';
                              }
                              else
                                spendError = false;
                            });
                          }

                        },



                        obscureText: false,
                      ),

                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: MaterialButton(
                          elevation: 5.0,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
                            child: Text(
                              "Select",
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          onPressed: () {
                            if (iscurrent)
                            {updateMoneyPool(_contributedMoneyInput);

                            print(_currentMoney);
                            // MoneyPoolServices().updateCurrentMoney(_currentMoney)
                            // .then((value){
                            //   if(value['success'])
                            //   {
                            //     Toast.show(value['msg'], context,
                            //     duration: Toast.LENGTH_LONG,
                            //     gravity: Toast.BOTTOM);
                            //   }
                            // });
                            Navigator.pop(context);
                            Toast.show("Price Contributed", context,
                                duration: Toast.LENGTH_LONG,
                                gravity: Toast.CENTER);


                            }else
                            {

                              if(!spendError && !controller.toString().isEmpty){
                                updateMoneyPool2(_spendMoneyInput);
                                print(_spendMoney);
                                //  MoneyPoolServices().updateSpendMoney(_spendMoney)
                                //  .then((value){
                                //    print(value);
                                //    if(value['success'])
                                //    {
                                //      Toast.show(value['msg'], context,
                                //      duration: Toast.LENGTH_LONG,
                                //      gravity: Toast.BOTTOM);
                                //        print(_currentMoney);
                                //  MoneyPoolServices().updateCurrentMoney(_currentMoney)
                                //  .then((value){
                                //    if(value['success'])
                                //    {
                                //      Toast.show(value['msg'], context,
                                //      duration: Toast.LENGTH_LONG,
                                //      gravity: Toast.BOTTOM);
                                //    }
                                //  });
                                //    }
                                //  });
                                Navigator.pop(context);
                                Toast.show("Price Spended", context,
                                    duration: Toast.LENGTH_LONG,
                                    gravity: Toast.CENTER);

                              }


                            }

                          },
                        )),
                  ],
                )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(left: 18, right: 18, top: 22, bottom: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Account OverView:",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Container(
                // width:MediaQuery.of(context).size.width*0.8,
                padding:
                EdgeInsets.only(left: 10, right: 18, top: 22, bottom: 22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xffF8F9F9),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width:MediaQuery.of(context).size.width*0.35,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AutoSizeText(
                            _currentMoney.toString(),
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          Text(
                            "Current Balance",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          MaterialButton(
                            onPressed: () {
                              _settingModalBottomSheet(
                                  context, _contributedMoneyInput, true);
                            },
                            elevation: 0,
                            padding: EdgeInsets.all(12),
                            child: Text(
                              "+",
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                            shape: CircleBorder(),
                            color: Colors.yellow,
                          ),
//                          RaisedButton(
//
//                            onPressed: () {
//                              _settingModalBottomSheet(
//                                  context, _spendMoneyInput, false);
//                            },
//                            elevation: 0,
//                            padding: EdgeInsets.all(12),
//                            child: Text(
//                              "-",
//                              style: TextStyle(
//                                fontSize: 22,
//                              ),
//                            ),
//                            shape: CircleBorder(),
//                            color: Colors.yellow,
//                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 34,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "List Of Contributors",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Icon(
                    Icons.line_style,
                  ),
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                height: 150,
                color: Color(0xffF8F9F9),
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Card(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 80.0,
                                width: 80.0,
                                margin: EdgeInsets.only(left: 5.0, right: 5.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.0),
                                    border: Border.all(
                                        width: 2.0,
                                        style: BorderStyle.solid,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                    // ignore: missing_required_param
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          'https://images.unsplash.com/photo-1541647376583-8934aaf3448a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
                                    )),
                              ),
                            ),
                            Text('User Name'),
                            SizedBox(height: 10),
                            Text('Contributed Money'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Cash Flow:",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Card(
                  elevation: 5.0,
                  borderOnForeground: true,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.line_style,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Total Money Earned",
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Text(
                              _totalEarnedMoney.toString(),
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 5.0,
                  borderOnForeground: true,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.line_style,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Total Money Spent",
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Text(
                              _spendMoney.toString(),
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.w600),
                            ),
                          ],
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
}
