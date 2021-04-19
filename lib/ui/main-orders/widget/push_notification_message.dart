import 'package:flutter/material.dart';

class PushNotificationMessage {
  final String title;
  final String body;
  final String type;
  final int orderId;

  const PushNotificationMessage({
    @required this.title,
    @required this.body,
    @required this.type,
    @required this.orderId,
  });
}
