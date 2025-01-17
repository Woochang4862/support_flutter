import 'package:flutter/material.dart' hide DateRangePickerDialog;
import 'package:support_flutter/views/widgets/alert_text_dialog.dart';
import 'package:support_flutter/views/widgets/date_range_picker_dialog.dart';

class DialogManager {
  DialogManager._();

  static final DialogManager instance = DialogManager._();

  /// ### showAlertDialog 함수 사용법 :
  /// #### 1. 글씨 종류
  /// * title 은 굵은 글씨
  /// * content 는 가는 글씨
  /// #### 2. 버튼 사용법 (중요!!)
  /// * 버튼 두개 사용시 [leftButtonText]와 [rightButtonText] 인자로 넘겨야함
  /// * 버튼 하나만 사용할 시 [leftButtonText]만 인자로 넘김
  Future<void> showAlertDialog({
    required BuildContext context,
    String? title,
    String? content,
    TextStyle? titleStyle,
    TextStyle? contentStyle,
    String? leftButtonText,
    String? rightButtonText,
    Function()? onLeftButtonPressed,
    Function()? onRightButtonPressed,
    barrierDismissible = true,
  }) async {
    await showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (_) => AlertTextDialog(
        title: title ?? "알림",
        content: content,
        titleStyle: titleStyle,
        contentStyle: contentStyle,
        leftButtonText: rightButtonText == null ? '확인' : leftButtonText,
        rightButtonText: rightButtonText,
        onLeftButtonPressed: onLeftButtonPressed,
        onRightButtonPressed: onRightButtonPressed,
      ),
    );
  }

  Future<void> showDateRangePickerDialog({
    required BuildContext context,
    Function(DateTimeRange? selecteDateRange)? onComplete,
    barrierDismissible = true,
  }) async {
    final result = await showDialog<DateTimeRange?>(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (_) => const DateRangePickerDialog(),
    );
    onComplete?.call(result);
  }
}
