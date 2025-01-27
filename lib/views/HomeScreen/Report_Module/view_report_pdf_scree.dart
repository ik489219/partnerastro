import 'package:astromeet/constants/colorConst.dart';
import 'package:astromeet/controllers/Authentication/signup_controller.dart';
import 'package:astromeet/models/History/report_history_model.dart';
import 'package:astromeet/utils/config.dart';
import 'package:astromeet/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ViewReportPdfScreen extends StatelessWidget {
  final ReportHistoryModel? reportHistoryData;
  ViewReportPdfScreen({super.key, this.reportHistoryData});
  final SignupController signupController = Get.find<SignupController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyCustomAppBar(
          height: 80,
          backgroundColor: COLORS().primaryColor,
          title: const Text("PDF"),
        ),
        body: SfPdfViewer.network(
          '$pdfBaseurl${reportHistoryData!.reportFile}',
          enableDocumentLinkAnnotation: false,
        ),
      ),
    );
  }
}
