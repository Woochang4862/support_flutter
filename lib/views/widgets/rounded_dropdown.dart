import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:support_flutter/const/data.dart';
import 'package:support_flutter/utils/icons/sign_up_icons_icons.dart';
import 'package:support_flutter/views/widgets/rounded_text_field.dart';
import 'package:support_flutter/views/widgets/text_font_widget.dart';

typedef Item = ({
  String label,
  IconData icon,
});

class RoundedDropdown extends StatefulWidget {
  final double? marginLeft,
      marginTop,
      marginRight,
      marginBottom,
      leftTopCornerRadius,
      rightTopCornerRadius,
      leftBottomCornerRadius,
      rightBottomCornerRadius,
      borderWidth,
      maxHeight,
      height,
      itemIconSize;
  final String? hintText;
  final List<Item> items;
  final Color? borderColor, backgroundColor;
  final bool isBackgroundFilled;
  final String? initValue;
  final TextStyle? hintStyle;
  final Icon? suffixIcon, prefixIcon;

  final Function(String? value) onChanged;

  RoundedDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    this.marginLeft,
    this.marginTop,
    this.marginRight,
    this.marginBottom,
    this.leftTopCornerRadius,
    this.rightTopCornerRadius,
    this.leftBottomCornerRadius,
    this.rightBottomCornerRadius,
    this.borderWidth,
    this.hintText,
    this.borderColor,
    this.backgroundColor,
    this.isBackgroundFilled = false,
    this.initValue,
    this.hintStyle,
    this.suffixIcon,
    this.prefixIcon,
    this.maxHeight,
    this.height,
    this.itemIconSize,
  });

  @override
  _RoundedDropdownState createState() => _RoundedDropdownState();
}

class _RoundedDropdownState extends State<RoundedDropdown> {
  final _layerLink = LayerLink();
  final _globalKey = GlobalKey();
  final _dropdownController = OverlayPortalController();
  String? _selectedValue;

  @override
  void initState() {
    if (widget.initValue != null) {
      _selectedValue = widget.initValue;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      margin: EdgeInsets.only(
        left: widget.marginLeft ?? 0,
        top: widget.marginTop ?? 0,
        right: widget.marginRight ?? 0,
        bottom: widget.marginBottom ?? 0,
      ),
      child: CompositedTransformTarget(
        link: _layerLink,
        child: OverlayPortal(
          controller: _dropdownController,
          overlayChildBuilder: (context) {
            return _dropdown();
          },
          child: RoundedTextField(
            key: _globalKey,
            readOnly: true,
            onTab: () {
              _dropdownController.toggle();
            },
            suffixIcon: widget.suffixIcon ?? Icon(SignUpIcons.ic_down),
            prefixIcon: widget.prefixIcon,
            leftBottomCornerRadius: widget.leftBottomCornerRadius,
            rightBottomCornerRadius: widget.rightBottomCornerRadius,
            leftTopCornerRadius: widget.leftTopCornerRadius,
            rightTopCornerRadius: widget.rightTopCornerRadius,
            borderWidth: widget.borderWidth,
            hintText: _selectedValue ?? widget.hintText,
            hintStyle: widget.hintStyle,
            borderColor: widget.borderColor,
            backgroundColor: widget.backgroundColor,
            isBackgroundFilled: widget.isBackgroundFilled,
          ),
        ),
      ),
    );
  }

  Widget _dropdown() {
    final RenderBox renderBox =
        _globalKey.currentContext!.findRenderObject() as RenderBox;
    return Positioned(
      width: renderBox.size.width,
      child: CompositedTransformFollower(
        offset: Offset(0, 48.h),
        link: _layerLink,
        child: Container(
          constraints: widget.maxHeight != null
              ? BoxConstraints(
                  maxHeight: widget.maxHeight!,
                )
              : null,
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(
              color: Color(0xFFBFBFBF),
              width: 1.w,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: widget.items.map((e) {
                final label = e.label;
                final icon = e.icon;
                return Material(
                  color: mainColor,
                  child: InkWell(
                    onTap: () {
                      _selectedValue = label;
                      _dropdownController.toggle();
                      setState(() {});
                      widget.onChanged(label);
                    },
                    child: Container(
                      height: widget.height,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 1.w,
                          ),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                      ),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(
                            icon,
                            size: widget.itemIconSize,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          TextFontWidget.fontRegular(
                            label,
                            color: Color(0xFF989898),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
