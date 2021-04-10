import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:HAMD_Delivery/controllers/my_income_controller.dart';
import 'package:HAMD_Delivery/ui/components/cutom_appbar.dart';
import 'package:HAMD_Delivery/ui/income/widgets/income_list_card.dart';
import 'package:HAMD_Delivery/ui/income/widgets/income_list_card_day.dart';
import 'package:HAMD_Delivery/ui/income/widgets/income_list_card_month.dart';
import 'package:HAMD_Delivery/ui/income/widgets/income_list_card_week.dart';
import 'package:HAMD_Delivery/ui/income/widgets/tab_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncomeSreen extends StatefulWidget {
  @override
  _IncomeSreenState createState() => _IncomeSreenState();
}

class _IncomeSreenState extends State<IncomeSreen> {
  final MyIncomeController myIncomeController = Get.find<MyIncomeController>();

  @override
  void initState() {
    myIncomeController.fetchMyIncomeDay();
    myIncomeController.fetchMyIncomeWeek();
    myIncomeController.fetchMyIncomeMonth();
    super.initState();
  }

  int selectedIndex = 0;
  _callContent() {
    return Obx(
      () {
        if (myIncomeController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                ColorPalatte.strongRedColor,
              ),
            ),
          );
        } else if (selectedIndex == 0) {
          return TabButton(
            title: 'За день',
            income:
                myIncomeController.myIncomeDayList[0].total.toString() + ' сум',
          );
        } else if (selectedIndex == 1) {
          return TabButton(
            title: 'За неделю',
            income: myIncomeController.myIncomeWeekList[0].total.toString() +
                ' сум',
          );
        }

        return TabButton(
          title: 'За месяц',
          income:
              myIncomeController.myIncomeMonthList[0].total.toString() + ' сум',
        );
      },
    );

    // switch (selectedIndex) {
    //   case 0:
    //     return Obx(() {
    //       if (myIncomeController.isLoading.value) {
    //         return Center(
    //           child: CircularProgressIndicator(
    //             valueColor: AlwaysStoppedAnimation<Color>(
    //               ColorPalatte.strongRedColor,
    //             ),
    //           ),
    //         );
    //       } else {
    //         return TabButton(
    //           title: 'За день',
    //           income: myIncomeController.myIncomeDayList[0].total.toString() +
    //               ' сум',
    //         );
    //       }
    //     });
    //     break;
    //   case 1:
    //     return Obx(() {
    //       if (myIncomeController.isLoading.value) {
    //         return Center(
    //           child: CircularProgressIndicator(
    //             valueColor: AlwaysStoppedAnimation<Color>(
    //               ColorPalatte.strongRedColor,
    //             ),
    //           ),
    //         );
    //       } else {
    //         return TabButton(
    //           title: 'За неделю',
    //           income: myIncomeController.myIncomeWeekList[0].total.toString() +
    //               ' сум',
    //         );
    //       }
    //     });
    //     break;
    //   default:
    //     return Obx(() {
    //       if (myIncomeController.isLoading.value) {
    //         return Center(
    //           child: CircularProgressIndicator(
    //             valueColor: AlwaysStoppedAnimation<Color>(
    //               ColorPalatte.strongRedColor,
    //             ),
    //           ),
    //         );
    //       } else {
    //         return TabButton(
    //           title: 'За месяц',
    //           income: myIncomeController.myIncomeMonthList[0].total.toString() +
    //               ' сум',
    //         );
    //       }
    //     });
    // }
  }

  // incomeList() {
  //   switch (selectedIndex) {
  //     case 0:
  //       return IncomeListCardDay();
  //     case 1:
  //       return IncomeListCardWeek();
  //       break;
  //     default:
  //       return IncomeListCardMonth();
  //   }
  // }
  //
  @override
  Widget build(BuildContext context) {
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
                              myIncomeController.fetchMyIncomeDay();
                              print(selectedIndex.toString());
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            'За день',
                            style: FontStyles.boldStyle(
                              fontSize: 13,
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
                              myIncomeController.fetchMyIncomeWeek();
                            }
                            print(selectedIndex.toString());
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child: Text(
                            'За неделю',
                            style: FontStyles.boldStyle(
                              fontSize: 13,
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
                            myIncomeController.fetchMyIncomeMonth();
                          }
                          print(selectedIndex.toString());
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: Text(
                          'За месяц',
                          style: FontStyles.boldStyle(
                            fontSize: 13,
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
          const SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [_callContent()],
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: IncomeListCard(selected: selectedIndex),
          )),
        ],
      ),
    );
  }
}
