import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:HAMD_Delivery/ui/components/cutom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncomeSreen extends StatefulWidget {
  @override
  _IncomeSreenState createState() => _IncomeSreenState();
}

class _IncomeSreenState extends State<IncomeSreen> {
  int selectedIndex = 0;
  _callContent() {
    switch (selectedIndex) {
      case 0:
        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Text(
                  'За день',
                  style: FontStyles.boldStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    color: Color(0xff232323),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  '1 245 500 сум',
                  style: FontStyles.boldStyle(
                    fontSize: 25,
                    fontFamily: 'Montserrat',
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
        break;
      case 1:
        return Container(
          width: MediaQuery.of(context).size.width,
          
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: Padding(padding: EdgeInsets.symmetric(vertical: 10),
		  child: Column(
            children: [
              Text(
                'За неделю',
                style: FontStyles.boldStyle(
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  color: Color(0xff232323),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                '1 245 500 сум',
                style: FontStyles.boldStyle(
                  fontSize: 25,
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                ),
              ),
            ],
          ),
        
		  )
		
		);
        break;
      default:
        return Container(
          width: MediaQuery.of(context).size.width,
        
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: Padding(padding: EdgeInsets.symmetric(vertical: 10),
		  child: Column(
            children: [
              Text(
                'За месяц',
                style: FontStyles.boldStyle(
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  color: Color(0xff232323),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                '1 245 500 сум',
                style: FontStyles.boldStyle(
                  fontSize: 25,
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                ),
              ),
            ],
          ),
        
		  )
		
		);
    }
  }

  incomeList() {
    switch (selectedIndex) {
      case 0:
        return ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 12),
          itemCount: 11,
          itemBuilder: (context, index) => Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Padding(
              padding:
                  EdgeInsets.only(top: 18, left: 17, right: 17, bottom: 18),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Заказ:',
                        style: FontStyles.boldStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          color: Color(0xff646974),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        'Id 4562455865',
                        style: FontStyles.boldStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          color: Color(0xff323637),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Color(0xffEAECF1),
                  ),
                  Row(
                    children: [
                      Text(
                        'Стоимость доставки:',
                        style: FontStyles.boldStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          color: Color(0xff646974),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        '12 500 сум ',
                        style: FontStyles.boldStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          color: Color(0xff323637),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      case 1:
        return ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 12),
          itemCount: 11,
          itemBuilder: (context, index) => Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Padding(
              padding:
                  EdgeInsets.only(top: 18, left: 17, right: 17, bottom: 18),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Заказ:',
                        style: FontStyles.boldStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          color: Color(0xff646974),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        'Id 4562455865',
                        style: FontStyles.boldStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          color: Color(0xff323637),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Color(0xffEAECF1),
                  ),
                  Row(
                    children: [
                      Text(
                        'Стоимость доставки:',
                        style: FontStyles.boldStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          color: Color(0xff646974),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        '12 500 сум ',
                        style: FontStyles.boldStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          color: Color(0xff323637),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
        break;
      default:
        return ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 12),
          itemCount: 11,
          itemBuilder: (context, index) => Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Padding(
              padding:
                  EdgeInsets.only(top: 18, left: 17, right: 17, bottom: 18),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Заказ:',
                        style: FontStyles.boldStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          color: Color(0xff646974),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        'Id 4562455865',
                        style: FontStyles.boldStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          color: Color(0xff323637),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Color(0xffEAECF1),
                  ),
                  Row(
                    children: [
                      Text(
                        'Стоимость доставки:',
                        style: FontStyles.boldStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          color: Color(0xff646974),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        '12 500 сум ',
                        style: FontStyles.boldStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          color: Color(0xff323637),
                        ),
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

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorPalatte.mainPageColor,
      appBar: PreferredSize(
        child: customAppBar(
          context,
          title: 'Мой заработок',
          onpress1: () => Get.back(),
        ),
        preferredSize: Size.fromHeight(
            kToolbarHeight + MediaQuery.of(context).viewPadding.top),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              color: ColorPalatte.strongRedColor,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 14),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xffC3696F),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  color: ColorPalatte.strongRedColor,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 44,
                        child: RaisedButton(
                          elevation: 0,
                          color: selectedIndex == 0
                              ? Colors.white
                              : Colors.transparent,
                          onPressed: () {
                            if (selectedIndex == 1 || selectedIndex == 2) {
                              setState(() {
                                selectedIndex = 0;
                              });
                              print(selectedIndex.toString());
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            'За день',
                            style: FontStyles.boldStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              color: selectedIndex == 0
                                  ? Colors.black
                                  : Color(
                                      0xffCDE8F4,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 44,
                        child: RaisedButton(
                          elevation: 0,
                          color: selectedIndex == 1
                              ? Colors.white
                              : Colors.transparent,
                          onPressed: () {
                            if (selectedIndex == 0 || selectedIndex == 2) {
                              setState(() {
                                selectedIndex = 1;
                              });
                            }
                            print(selectedIndex.toString());
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child: Text(
                            'За неделю',
                            style: FontStyles.boldStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              color: selectedIndex == 1
                                  ? Colors.black
                                  : Color(
                                      0xffCDE8F4,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: SizedBox(
                      height: 44,
                      child: RaisedButton(
                        elevation: 0,
                        color: selectedIndex == 2
                            ? Colors.white
                            : Colors.transparent,
                        onPressed: () {
                          if (selectedIndex == 0 || selectedIndex == 1) {
                            setState(() {
                              selectedIndex = 2;
                            });
                          }
                          print(selectedIndex.toString());
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: Text(
                          'За месяц',
                          style: FontStyles.boldStyle(
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            color: selectedIndex == 2
                                ? Colors.black
                                : Color(
                                    0xffCDE8F4,
                                  ),
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [_callContent()],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: incomeList(),
          )),
        ],
      ),
    );
  }
}
