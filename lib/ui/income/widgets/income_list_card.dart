import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:flutter/material.dart';

class IncomeListCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          padding: EdgeInsets.only(top: 18, left: 17, right: 17, bottom: 18),
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
