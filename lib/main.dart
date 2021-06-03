import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Abc(),
  ));
}
class Abc extends StatefulWidget {
  const Abc({Key key}) : super(key: key);

  @override
  _AbcState createState() => _AbcState();
}
bool flag;
class _AbcState extends State<Abc> {
  dynamic res=0;
  dynamic res2=0;
  String op='';
  dynamic p='';
  double ex=10;
  String output='0';
  String t='';
  List<Widget> lis=[Container()];
  int o=0;
  void outp(){
    lis.add (Text('$output',
      textAlign: TextAlign.right,
      style: TextStyle(
        color: Colors.red,
        fontSize: 50,
      ),

    ));
    o=1;
  }
  Widget fun(String v)
  {
    return RawMaterialButton(

      onPressed: (){
              if(t.isNotEmpty)
                {
                  op='';res=0;res2=0;p='';
                  t='';
                  output='0';
                  o=0;
                  lis.removeAt(1);
                }
              setState(() {
                if(v=='=') {
                  t=v;
                  if (op == '+') {
                    dynamic temp = res + res2;
                    output = temp.toString();
                    outp();
                  }
                  else if (op == '-') {
                    dynamic temp = res - res2;
                    output = temp.toString();
                    outp();
                  }
                  else if (op == '/') {
                    dynamic temp = res / res2;
                    output = temp.toString();
                    outp();
                  }
                  else if (op == 'x') {
                    dynamic temp = res * res2;
                    output = temp.toString();
                    outp();
                  }
                }
                if((v.codeUnitAt(0)>=48 && v.codeUnitAt(0)<=57) || v=='.' || v=='<-') {
                    // print(flag);
                  if(v=='.')
                    flag=true;
                  else {
                    if (op.isEmpty) {
                      if (flag != true)
                        if(v=='<-') {
                          res = res / 10;

                        }
                          else
                        res = res * 10 + int.parse(v);
                      else {
                        res = (res * ex + int.parse(v)) / (ex);
                        ex = ex * 10;
                        print(ex);
                      }
                    }
                    else {
                      res2 = res2 * 10 + int.parse(v);
                      p = res2;
                    }
                  }
                }
                else if(v=='+' || v=='-' || v=='/' || v=='x')
                  {
                    op=v;

                  }


              });
      },
      highlightColor: Colors.blue,
      shape: Border.all(color: Colors.white,width: 2),
      fillColor: Colors.grey,
      child: Text('$v',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight:FontWeight.bold,
        ),
      ),
      padding:EdgeInsets.all(20.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Center(child: Text('Calculator')),


      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children:[
          Text('$res'+' $op ' + '$p',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.red,
              fontSize: 50,
            ),

          ),
          lis[o],
          Row(
            children: [
              Expanded(child:fun('.')),
              Expanded(child:fun('0')),
              Expanded(child:fun('=')),
              Expanded(child:fun('<-')),

            ],
          ),
          Row(
            children: [
              Expanded(child:fun('9')),
              Expanded(child:fun('8')),
              Expanded(child:fun('7')),
              Expanded(child:fun('/')),

            ],
          ),
          Row(
            children: [
              Expanded(child:fun('6')),
              Expanded(child:fun('5')),
              Expanded(child:fun('4')),
              Expanded(child:fun('x')),

            ],
          ),
          Row(
            children: [
              Expanded(child:fun('3')),
              Expanded(child:fun('2')),
              Expanded(child:fun('1')),
              Expanded(child:fun('-')),

            ],
          ),
          Row(
            children: [
              Expanded(child:fun('.')),
              Expanded(child:fun('0')),
              Expanded(child:fun('=')),
              Expanded(child:fun('+')),

            ],
          ),


        ],
      ),
    );
  }
}










