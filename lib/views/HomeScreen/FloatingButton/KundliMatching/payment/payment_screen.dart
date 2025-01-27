// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:astromeet/views/HomeScreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../../controllers/HomeController/home_controller.dart';
import '../../../../../utils/config.dart';

class PaymentScreen extends StatefulWidget {
  String url;
  PaymentScreen({Key? key, required this.url}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late InAppWebViewController _controller;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Container(
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: WebUri(widget.url)),
          initialSettings: InAppWebViewSettings(
              cacheEnabled: true,
              javaScriptEnabled: true,
              javaScriptCanOpenWindowsAutomatically: true,
              useShouldOverrideUrlLoading: true,
              useShouldInterceptRequest: true
          ),
          shouldOverrideUrlLoading: (controller, navigationAction) async {
            var url = navigationAction.request.url.toString();
            if (url.startsWith('upi://') || url.startsWith('intent://')) {
              try {
                await launchUrl(Uri.parse(url),
                    mode: LaunchMode.externalApplication);
                return NavigationActionPolicy.CANCEL;
              } catch (e) {
                log('Error launching URL: $e');
              }
            }
            return NavigationActionPolicy.ALLOW;
          },
          onReceivedError: (controller, request, error) {
            log('error: ${error.toString()}');
          },
          onLoadResource: (controller, resource) {
            log('onLoadResource : ${resource}');
          },
          onLoadStart: (controller, url) {
            log('start url: ${url.toString()}');
          },
          onReceivedHttpError: (controller, request, error) {
            log('http error: ${error.toString()} and req is $request');
          },
          onLoadStop: (controller, url)async {
            log('onLoadStop called: ${url.toString()}');
            // log('check: ${imgBaseurl}payment-success');

            if (url
                .toString()
                .startsWith("${imgBaseurl}payment-success")) {
              Get.find<HomeController>().homeTabIndex = 0;
              Get.find<HomeController>().update();
              Get.offAll(() => const HomeScreen());
              Fluttertoast.showToast(
                msg: "Payment Success!",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                fontSize: 14.sp,
              );
            } else if (url
                .toString()
                .startsWith("${imgBaseurl}payment-failed")) {
              Get.find<HomeController>().homeTabIndex = 0;
              Get.find<HomeController>().update();
              Get.offAll(() => const HomeScreen());

              Fluttertoast.showToast(
                msg: "Payment Failed!",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                fontSize: 14.sp,
              );
            }
          },
          onWebViewCreated: (webviewcontroller) {
            _controller = webviewcontroller;

            log('onWebViewCreated: }');

            _controller.addJavaScriptHandler(
              handlerName: 'PaymentSuccess',
              callback: (args) {
                log('loaded PaymentSuccess: ${args.toString()}');

                Get.find<HomeController>().homeTabIndex = 0;
                Get.find<HomeController>().update();
                Get.offAll(() => const HomeScreen());
                Fluttertoast.showToast(
                  msg: "Payment Success!",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  fontSize: 14.sp,
                );
              },
            );
            _controller.addJavaScriptHandler(
              handlerName: 'PaymentFailed',
              callback: (args) {
                log('loaded PaymentFailed: ${args.toString()}');

    Get.find<HomeController>().homeTabIndex = 0;
    Get.find<HomeController>().update();
    Get.offAll(() => const HomeScreen());

    Fluttertoast.showToast(
    msg: "Payment Failed!",
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    fontSize: 14.sp,
    );
    }
            );
          },
        ),
      ),
    );
  }


}
