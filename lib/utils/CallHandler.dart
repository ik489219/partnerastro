// ignore_for_file: file_names

import 'package:astromeet/utils/CallUtils.dart';

class CallHandler {
  void handleIncomingCall(var messagedata) {
    CallUtils.showIncomingCall(messagedata);
  }
}
