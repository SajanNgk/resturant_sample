import 'package:hyperce/controllers/product_varient_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OurFlutterDropdownSearch extends StatefulWidget {
  final TextEditingController? textController;
  final String? hintText;
  final List<String>? items;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final TextStyle? dropdownTextStyle;
  final IconData? suffixIcon;
  final double? dropdownHeight;
  final Color? dropdownBgColor;
  final InputBorder? textFieldBorder;
  final EdgeInsetsGeometry? contentPadding;

  OurFlutterDropdownSearch(
      {required this.textController,
      this.hintText,
      required this.items,
      this.hintStyle,
      this.style,
      this.dropdownTextStyle,
      this.suffixIcon,
      this.dropdownHeight,
      this.dropdownBgColor,
      this.textFieldBorder,
      this.contentPadding});

  @override
  _OurFlutterDropdownSearchState createState() =>
      _OurFlutterDropdownSearchState();
}

class _OurFlutterDropdownSearchState extends State<OurFlutterDropdownSearch> {
  bool _isTapped = false;
  List<String> _filteredList = [];
  List<String> _subFilteredList = [];

  initState() {
    super.initState();
    _filteredList = widget.items!;
    _subFilteredList = _filteredList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///Text Field
        TextFormField(
          readOnly: true,
          controller: widget.textController,
          onChanged: (val) {
            setState(() {
              _filteredList = _subFilteredList
                  .where((element) => element
                      .toLowerCase()
                      .contains(widget.textController!.text.toLowerCase()))
                  .toList();
            });
          },
          validator: (val) => val!.isEmpty ? 'Field can\'t empty' : null,
          style: widget.style ??
              TextStyle(color: Colors.grey.shade800, fontSize: 16.0),
          onTap: () {
            print("Hello World Utsav Shrestha");

            setState(() {
              _isTapped = !_isTapped;
            });
          },
          decoration: InputDecoration(
            border: widget.textFieldBorder ?? UnderlineInputBorder(),
            hintText: widget.hintText ?? "Write here...",
            hintStyle: widget.hintStyle ??
                TextStyle(fontSize: 16.0, color: Colors.grey),
            suffixIcon:
                Icon(widget.suffixIcon ?? Icons.arrow_drop_down, size: 25),
            contentPadding: widget.contentPadding ??
                EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            isDense: true,
          ),
        ),

        ///Dropdown Items
        _isTapped && _filteredList.isNotEmpty
            ? Container(
                height: widget.dropdownHeight ?? 150.0,
                color: widget.dropdownBgColor ?? Colors.grey.shade200,
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView.builder(
                  itemCount: _filteredList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        print("Hello World");
                        print(_filteredList[index]);
                        print("Utsav Shrestha");
                        int index1 = Get.find<ProductVarientController>()
                            .productVarientName
                            .indexOf(_filteredList[index]);
                        // String indexlocation =
                        //     Get.find<ProductVarientController>()
                        //         .productVarientId[index1];
                        print("Utsav Shrestha111");
                        print(index1);
                        print("Utsav Shrestha111");

                        Get.find<ProductVarientController>().changeCurrentIndex(
                          index1,
                        );
                        // await APIService().listofPalika(district_id);
                        setState(() => _isTapped = !_isTapped);
                        widget.textController!.text = _filteredList[index];
                        FocusScope.of(context).unfocus();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(_filteredList[index],
                            style: widget.dropdownTextStyle ??
                                TextStyle(
                                    color: Colors.grey.shade800,
                                    fontSize: 16.0)),
                      ),
                    );
                  },
                ),
              )
            : Container(),
      ],
    );
  }
}
