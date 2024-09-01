import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:support_flutter/utils/logging/logger.dart';
import 'package:support_flutter/views/widgets/notice_item.dart';
import 'package:support_flutter/views/widgets/support_app_date_range_picker.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class NoticeScreen extends ConsumerStatefulWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  _NoticeScreenState createState() => _NoticeScreenState();
}

class _NoticeScreenState extends ConsumerState<NoticeScreen> {
  final _dateRangePickerController = DateRangePickerController();
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () => context.go('/edit_notice'),
                backgroundColor: Colors.white,
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.add,
                  color: Color(0xFF000000),
                ),
              ),
              body: Padding(
                  padding: EdgeInsets.fromLTRB(24.w, 24.w, 24.h, 0),
                  child: Column(
                    children: [
                      SupportAppDateRangePicker(
                        controller: _dateRangePickerController,
                        onSelectionChanged: (args) {
                          logger.d(args.value);
                        },
                      ),
                      Flexible(
                        flex: 1,
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: 80,
                          itemBuilder: (context, index) {
                            return NoticeItem(title: 'data', onItemClick:(){
                              context.go('/notice_detail');
                            });
                          },
                          separatorBuilder:
                              (BuildContext context, int index) {
                                return Divider(thickness: 1.h,);
                              },
                        ),
                      ),
                    ],
                  )),
            );
          });
    });
  }

  @override
  void dispose() {
    _dateRangePickerController.dispose();
    super.dispose();
  }
}
