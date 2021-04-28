import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:HAMD_Delivery/controllers/my_income_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncomeListCard extends StatefulWidget {
  final int selected;

  const IncomeListCard({Key key, @required this.selected}) : super(key: key);

  @override
  _IncomeListCardState createState() => _IncomeListCardState();
}

class _IncomeListCardState extends State<IncomeListCard> {
  final MyIncomeController myIncomeController = Get.find<MyIncomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var day = myIncomeController.myIncomeDayList.first;
        var week = myIncomeController.myIncomeWeekList.first;
        var month = myIncomeController.myIncomeMonthList.first;
        if (myIncomeController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                ColorPalatte.strongRedColor,
              ),
            ),
          );
        }
        if (widget.selected == 0) {
          if (day.orders == null && !myIncomeController.isLoading.value) {
            return Center(
              child: Text('Вы ещё не заработали'),
            );
          }
        } else if (widget.selected == 1) {
          if (week.orders == null && !myIncomeController.isLoading.value) {
            return Center(
              child: Text('Вы ещё не заработали'),
            );
          }
        } else if (widget.selected == 2) {
          if (month.orders == null && !myIncomeController.isLoading.value) {
            return Center(
              child: Text('Вы ещё не заработали'),
            );
          }
        }
        return RefreshIndicator(
          color: ColorPalatte.strongRedColor,
          onRefresh: () {
            if (widget.selected == 0)
              return myIncomeController.fetchMyIncomeDay();
            else if (widget.selected == 1)
              return myIncomeController.fetchMyIncomeWeek();
            return myIncomeController.fetchMyIncomeMonth();
          },
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
            itemCount: widget.selected == 0
                ? day.orders.length
                : widget.selected == 1
                    ? week.orders.length
                    : month.orders.length,
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
                          'Id ${widget.selected == 0 ? day.orders[index].id : widget.selected == 1 ? week.orders[index].id : month.orders[index].id}',
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
                          "12 500 сум",
                          // '${widget.selected == 0 ? day.orders[index].productTotalSum : widget.selected == 1 ? week.orders[index].productTotalSum : month.orders[index].productTotalSum}',
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
      },
    );
  }
}
