import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:function_tree/function_tree.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var Expression = "";
  var Ans;

  @override
  void initState() {
    super.initState();
    Ans = 0;
  }

  void eval(){
    try{
      Ans = (Expression.interpret())%1==0?(Expression.interpret()).round():Expression.interpret();
    }catch(e){
      Expression = "Error";
      Fluttertoast.showToast(
          msg: "$e",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: const Color.fromRGBO(0, 0, 0, 0.5),
          textColor: Colors.white,
          fontSize: 16.0
      );
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       content: Text('Hello This is Snackbar'),
      //     )
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(fontSize: 28,color: Colors.blue),
        ),
        elevation: 0,
        backgroundColor: HexColor.fromHex('#17181a'),
        centerTitle: true,
      ),
      //AppBar End
      body: Container(
        color: HexColor.fromHex('#17181a'),
        child: Padding(
          padding: const EdgeInsets.only(left: 22,right: 22,bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8,bottom: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                            Expression,
                            maxLines: 5,
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight:
                                FontWeight.w400,
                                color: Colors.white24,
                            )
                        ),
                        SizedBox(height: 8,),
                        Text(
                          "$Ans",
                            textAlign: TextAlign.right,
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 45,
                              fontWeight:
                              FontWeight.w400,
                              color: Colors.white,
                            )
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // SizedBox(width: 20,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UpperButton(textName: "√",callBack: (){setState(() {
                        if(Ans==null || Ans==0){
                          Expression+='sqrt(';
                        }
                        else{
                          Expression='$Ans√';
                        }
                      });}),
                      SizedBox(width: 20,),
                      UpperButton(textName: "^",callBack: (){setState(() {
                        if(Ans==null || Ans==0){
                          Expression+='^';
                        }
                        else{
                          Expression='$Ans^';
                        }
                      });}),
                      SizedBox(width: 20,),
                      UpperButton(textName: "(",callBack: (){setState(() {
                        Expression+='(';
                      });}),
                      SizedBox(width: 20,),
                      UpperButton(textName: ")",callBack: (){setState(() {
                        Expression+=')';
                      });}),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: RoundButton(
                                  btnName: "Ac",
                                  btnColor: Color.fromRGBO(225, 241, 254, 0.3),
                                  textStyle: TextStyle(fontSize: 30,color: Colors.white38,fontWeight: FontWeight.w700),
                                  callBack: (){setState(() {
                                    Expression = "";
                                    Ans = 0;
                                  });}
                                ),
                              ),SizedBox(width: 20,),
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: RoundButton(
                                    btnIcon: FaIcon(FontAwesomeIcons.deleteLeft,color: Colors.white38),
                                    btnColor: Color.fromRGBO(225, 241, 254, 0.3),
                                    callBack: (){setState(() {
                                      if (Expression != null && Expression.length > 0) {
                                        Expression = Expression.substring(0, Expression.length - 1);
                                      }
                                    });}
                                ),
                              ),SizedBox(width: 20,),
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: RoundButton(
                                    btnName: "/",
                                    btnColor: Color.fromRGBO(28, 143, 255, 0.5),
                                    textStyle: TextStyle(fontSize: 45,color: Colors.blue,fontWeight: FontWeight.w500),
                                    callBack: (){setState(() {
                                      if(Ans==null || Ans==0){
                                        Expression+='/';
                                      }
                                      else{
                                        Expression='$Ans/';
                                      }
                                    });}
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: RoundButton(
                                    btnName: "7",
                                    btnColor: Color.fromRGBO(48, 49, 54, .5),
                                    textStyle: TextStyle(fontSize: 45,color: Colors.blue,fontWeight: FontWeight.w500),
                                    callBack: (){setState(() {
                                      Expression+='7';
                                    });}
                                ),
                              ),SizedBox(width: 20,),
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: RoundButton(
                                    btnName: "8",
                                    btnColor: Color.fromRGBO(48, 49, 54, .5),
                                    textStyle: TextStyle(fontSize: 45,color: Colors.blue,fontWeight: FontWeight.w500),
                                    callBack: (){setState(() {
                                      Expression+='8';
                                    });}
                                ),
                              ),SizedBox(width: 20,),
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: RoundButton(
                                    btnName: "9",
                                    btnColor: Color.fromRGBO(48, 49, 54, .5),
                                    textStyle: TextStyle(fontSize: 45,color: Colors.blue,fontWeight: FontWeight.w500),
                                    callBack: (){setState(() {
                                      Expression+='9';
                                    });}
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: RoundButton(
                                    btnName: "4",
                                    btnColor: Color.fromRGBO(48, 49, 54, .5),
                                    textStyle: TextStyle(fontSize: 45,color: Colors.blue,fontWeight: FontWeight.w500),
                                    callBack: (){setState(() {
                                      Expression+='4';
                                    });}
                                ),
                              ),SizedBox(width: 20,),
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: RoundButton(
                                    btnName: "5",
                                    btnColor: Color.fromRGBO(48, 49, 54, .5),
                                    textStyle: TextStyle(fontSize: 45,color: Colors.blue,fontWeight: FontWeight.w500),
                                    callBack: (){setState(() {
                                      Expression+='5';
                                    });}
                                ),
                              ),SizedBox(width: 20,),
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: RoundButton(
                                    btnName: "6",
                                    btnColor: Color.fromRGBO(48, 49, 54, .5),
                                    textStyle: TextStyle(fontSize: 45,color: Colors.blue,fontWeight: FontWeight.w500),
                                    callBack: (){setState(() {
                                      Expression+='6';
                                    });}
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: RoundButton(
                                    btnName: "1",
                                    btnColor: Color.fromRGBO(48, 49, 54, .5),
                                    textStyle: TextStyle(fontSize: 45,color: Colors.blue,fontWeight: FontWeight.w500),
                                    callBack: (){setState(() {
                                      Expression+='1';
                                    });}
                                ),
                              ),SizedBox(width: 20,),
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: RoundButton(
                                    btnName: "2",
                                    btnColor: Color.fromRGBO(48, 49, 54, .5),
                                    textStyle: TextStyle(fontSize: 45,color: Colors.blue,fontWeight: FontWeight.w500),
                                    callBack: (){setState(() {
                                      Expression+='2';
                                    });}
                                ),
                              ),SizedBox(width: 20,),
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: RoundButton(
                                    btnName: "3",
                                    btnColor: Color.fromRGBO(48, 49, 54, .5),
                                    textStyle: TextStyle(fontSize: 45,color: Colors.blue,fontWeight: FontWeight.w500),
                                    callBack: (){setState(() {
                                      Expression+='3';
                                    });}
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 160,
                                height: 70,
                                child: RoundButton(
                                    btnName: "0",
                                    btnColor: Color.fromRGBO(48, 49, 54, .5),
                                    textStyle: TextStyle(fontSize: 45,color: Colors.blue,fontWeight: FontWeight.w500),
                                    callBack: (){setState(() {
                                      Expression+='0';
                                    });}
                                ),
                              ),SizedBox(width: 20,),
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: RoundButton(
                                    btnName: ".",
                                    btnColor: Color.fromRGBO(48, 49, 54, .5),
                                    textStyle: TextStyle(fontSize: 45,color: Colors.blue,fontWeight: FontWeight.w500),
                                    callBack: (){setState(() {
                                      Expression+='.';
                                    });}
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 20,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 70,
                            height: 70,
                            child: RoundButton(
                                btnName: "*",
                                btnColor: Color.fromRGBO(28, 143, 255, 0.5),
                                textStyle: TextStyle(fontSize: 45,color: Colors.blue,fontWeight: FontWeight.w500),
                                callBack: (){setState(() {
                                  if(Ans==null || Ans==0){
                                    Expression+='*';
                                  }
                                  else{
                                    Expression='$Ans*';
                                  }
                                });}
                            ),
                          ),
                          SizedBox(height: 15,),
                          SizedBox(
                            width: 70,
                            height: 70,
                            child: RoundButton(
                                btnName: "-",
                                btnColor: Color.fromRGBO(28, 143, 255, 0.5),
                                textStyle: TextStyle(fontSize: 45,color: Colors.blue,fontWeight: FontWeight.w500),
                                callBack: (){setState(() {
                                  if(Ans==null || Ans==0){
                                    Expression+='-';
                                  }
                                  else{
                                    Expression='$Ans-';
                                  }
                                });}
                            ),
                          ),
                          SizedBox(height: 15,),
                          SizedBox(
                            width: 70,
                            height: 110,
                            child: RoundButton(
                                btnName: "+",
                                btnColor: Color.fromRGBO(28, 143, 255, 0.5),
                                textStyle: TextStyle(fontSize: 45,color: Colors.blue,fontWeight: FontWeight.w500),
                                callBack: (){setState(() {
                                  if(Ans==null || Ans==0){
                                    Expression+='+';
                                  }
                                  else{
                                    Expression='$Ans+';
                                  }
                                });}
                            ),
                          ),
                          SizedBox(height: 15,),
                          SizedBox(
                            width: 70,
                            height: 110,
                            child: RoundButton(
                                btnName: "=",
                                btnColor: Color.fromRGBO(28, 143, 255, 0.9),
                                textStyle: TextStyle(fontSize: 45,color: Colors.white,fontWeight: FontWeight.w500),
                                callBack: (){setState(() {
                                  eval();
                                });}
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}







//Rounded Button
class RoundButton extends StatelessWidget {
  final String? btnName;
  final FaIcon? btnIcon;
  final Color? btnColor;
  final TextStyle? textStyle;
  final VoidCallback? callBack;

  const RoundButton({
    this.btnName,
    this.btnIcon,
    this.btnColor = Colors.blue,
    this.textStyle,
    this.callBack,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
    onTap: (){callBack!();},
      child: Container(
        decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(18)),color: btnColor),
        child: Center(child: btnName!=null?Text("$btnName",style: textStyle,):btnIcon),
      ),
    );
  }
}

//Upper Button
class UpperButton extends StatelessWidget{
  final String? textName;
  final VoidCallback? callBack;

  UpperButton({this.textName, this.callBack});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){callBack!();},
      child: Container(
        width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color.fromRGBO(48, 49, 54, .5),
          ),
          child: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 8,
                    bottom: 7,
                    left: 8,
                    top: 7),
                child: Text(
                  "$textName",
                  style: TextStyle(
                      color:
                      HexColor.fromHex('#29a8ff'),
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
              ))),
    );
  }

}

//Hex Color
extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
