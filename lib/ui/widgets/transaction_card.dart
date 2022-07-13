import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'booking_details_item.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionCard(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kWhiteColor,
      ),
      child: Column(
        children: [
          // DESTINATION TILE
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                margin: EdgeInsets.only(right: 18),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(transaction.destination.imageUrl),
                    )),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.destination.name,
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: medium),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      transaction.destination.city,
                      style: greyTextStyle.copyWith(fontWeight: light),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.only(right: 2),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/icon_star.png',
                        ),
                      ),
                    ),
                  ),
                  Text(
                    transaction.destination.rating.toString(),
                    style: blackTextStyle.copyWith(
                        fontWeight: medium, fontSize: 14),
                  )
                ],
              ),
            ],
          ),
          // BOOKING DETAILS TEXT
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              'Booking Details',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),

          // BOOKING DETAILS ITEM
          BookingDetailsItem(
            title: 'Traveler',
            valueColor: kBlackColor,
            valueText: '${transaction.amountOfTraveler} person',
          ),
          BookingDetailsItem(
            title: 'Seat',
            valueColor: kBlackColor,
            valueText: transaction.selectedSeat,
          ),
          BookingDetailsItem(
            title: 'Insurance',
            valueColor: transaction.insurance ? kGreenColor : kRedColor,
            valueText: transaction.insurance ? 'YES' : 'NO',
          ),
          BookingDetailsItem(
            title: 'Refundable',
            valueColor: transaction.refundable ? kGreenColor : kRedColor,
            valueText: transaction.refundable ? 'YES' : 'NO',
          ),
          BookingDetailsItem(
            title: 'VAT',
            valueColor: kBlackColor,
            valueText: '${(transaction.vat * 100).toStringAsFixed(0)}%',
          ),
          BookingDetailsItem(
            title: 'Price',
            valueColor: kBlackColor,
            valueText: NumberFormat.currency(
                    locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                .format(transaction.price),
          ),
          BookingDetailsItem(
            title: 'Grand Total',
            valueColor: kPrimaryColor,
            valueText: NumberFormat.currency(
                    locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                .format(transaction.grandTotal),
          ),
        ],
      ),
    );
  }
}
