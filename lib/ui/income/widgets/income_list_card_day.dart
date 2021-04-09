import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:HAMD_Delivery/controllers/my_income_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncomeListCardDay extends StatefulWidget {
  @override
  _IncomeListCardDayState createState() => _IncomeListCardDayState();
}

class _IncomeListCardDayState extends State<IncomeListCardDay> {
  final MyIncomeController myIncomeController = Get.find<MyIncomeController>();
  @override
  void initState() {
    print('my icome for day');
    myIncomeController.myIncomeDayList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        } else {
          return RefreshIndicator(
            onRefresh: () => myIncomeController.fetchMyIncomeDay(),
            color: ColorPalatte.strongRedColor,
            child: ListView.separated(
              separatorBuilder: (context, index) => index.remainder(3) == 1
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            '10.03.2021',
                            style: FontStyles.regularStyle(
                              fontSize: 13,
                              fontFamily: 'Montserrat',
                              color: Color(0xff323637),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    )
                  : SizedBox(height: 12),
              itemCount: myIncomeController.myIncomeDayList[0].orders.length,
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
                            'Id ' +
                                myIncomeController
                                    .myIncomeDayList[0].orders[index].id
                                    .toString(),
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
                            myIncomeController.myIncomeDayList[0].orders[index]
                                .productTotalSum
                                .toString(),
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
            ),
          );
        }
      },
    );
  }
}
