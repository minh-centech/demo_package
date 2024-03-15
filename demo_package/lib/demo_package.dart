library demo_package;

import 'package:demo_package/model/danhmuc_doituong.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class myDropDown extends StatefulWidget {
  final String nameDropDown;
  final String hintText;
  final List<DanhMucDoiTuongModel> list;
  final String? initValue;
  final TextEditingController controller;
  final ValueChanged<String> onChange;

  const myDropDown(
      {super.key,
      required this.nameDropDown,
      required this.hintText,
      required this.list,
      required this.initValue,
      required this.controller,
      required this.onChange});

  @override
  State<myDropDown> createState() => _myDropDownState();
}

class _myDropDownState extends State<myDropDown> {
  String? curValue;

  @override
  void initState() {
    // TODO: implement initState
    if (widget.initValue == null) {
      return;
    } else {
      curValue = widget.initValue;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          widget.nameDropDown,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),

        items: widget.list
            .map((item) => DropdownMenuItem<String>(
                  value: item.ID,
                  child: Text(
                    item.Ten,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: curValue,
        onChanged: (value) {
          setState(() {
            curValue = value;
          });
          widget.onChange(value.toString());
        },

        buttonStyleData: ButtonStyleData(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), border: Border.all()),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 54,
          width: 200,
        ),
        dropdownStyleData: const DropdownStyleData(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          maxHeight: 200,
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),

        dropdownSearchData: DropdownSearchData(
          searchController: widget.controller,
          searchInnerWidgetHeight: 50,
          searchInnerWidget: Container(
            height: 50,
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 4,
              right: 8,
              left: 8,
            ),
            child: TextFormField(
              expands: true,
              maxLines: null,
              controller: widget.controller,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                hintText: widget.hintText,
                hintStyle: const TextStyle(fontSize: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          searchMatchFn: (item, searchValue) {
            // .child để chỉ đag tìm ở phần hiển thị
            return item.child
                .toString()
                .toUpperCase()
                .contains(searchValue.toUpperCase());
          },
        ),
        //This to clear the search value when you close the menu
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            widget.controller.clear();
          }
        },
      ),
    );
  }
}
