import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wosul_app/controllers/userController.dart';
import 'package:wosul_app/providers/currentStore.dart';

class FilterBar extends ConsumerStatefulWidget {
  final Function reverseLoad;

  const FilterBar(this.reverseLoad, {super.key});

  @override
  ConsumerState<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends ConsumerState<FilterBar>
    with SingleTickerProviderStateMixin {
  var period = 0;
  var color = MaterialStateColor.resolveWith((states) => Color(0xffE4E9F9));
  @override
  Widget build(BuildContext context) {
    var storeList = ref.watch(userControllerProvider)!.storeList;

    // print(storeList[0]['name']);
    var firstElement = storeList.firstWhere(
        (element) => element['id'] == ref.watch(currentStoreProvider));

    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 10),
      child: Row(
        children: [
          SizedBox(
            height: 35,
            width: 45,
            child: TextButton(
                style: ButtonStyle(
                  backgroundColor: period == 0 ? color : null,
                ),
                onPressed: () {
                  setState(() {
                    period = 0;
                  });
                },
                child: AutoSizeText(
                  "Day",
                  style: TextStyle(
                      color: period == 0 ? null : Color(0xff4B5B73),
                      fontSize: 10),
                )),
          ),
          SizedBox(
            height: 35,
            width: 60,
            child: TextButton(
                style: ButtonStyle(backgroundColor: period == 1 ? color : null),
                onPressed: () {
                  setState(() {
                    period = 1;
                  });
                },
                child: AutoSizeText("Week",
                    style: TextStyle(
                      color: period == 1 ? null : Color(0xff4B5B73),
                    ))),
          ),
          SizedBox(
            height: 35,
            width: 70,
            child: TextButton(
                style: ButtonStyle(backgroundColor: period == 2 ? color : null),
                onPressed: () {
                  setState(() {
                    period = 2;
                  });
                },
                child: AutoSizeText("Month",
                    style: TextStyle(
                        color: period == 2 ? null : Color(0xff4B5B73)))),
          ),
          // Expanded(
          //   child: DropdownButton<int>(
          //     iconSize: 30,
          //     borderRadius: BorderRadius.circular(12),
          //     padding: const EdgeInsets.symmetric(horizontal: 50),
          //     isExpanded: true,
          //     menuMaxHeight: 300,
          //     value: 2,
          //     items: [1, 2, 3]
          //         .map((store) => DropdownMenuItem(
          //             value: store, child: Text(store.toString())))
          //         .toList(),
          //     onChanged: (value) {
          //       setState(() {
          //         // StoreId = value;
          //       });
          //     },
          //   ),
          // ),
          SizedBox(width: 10),
          Expanded(
            child: SizedBox(
              height: 40,
              child: DropdownButtonFormField2<int>(
                isExpanded: true,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                ),
                hint: Text(
                  firstElement['name'],
                  style: TextStyle(fontSize: 14),
                ),
                items: storeList
                    .map((item) => DropdownMenuItem<int>(
                          value: item['id'],
                          child: Text(
                            item['name'],
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: (value) async {
                  widget.reverseLoad();

                  await ref
                      .watch(userControllerProvider.notifier)
                      .changeStore(value!);

                  widget.reverseLoad();
                },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.only(right: 8),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                  iconSize: 24,
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
          ),

          // Container(
          //   width: 100,
          //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          //   margin: const EdgeInsets.all(8),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(8),
          //   ),
          //   child: const FittedBox(
          //     child: Row(
          //       children: [
          //         Text(
          //           "2023-03-27",
          //           style: TextStyle(
          //               color: Colors.grey,
          //               fontWeight: FontWeight.bold,
          //               fontSize: 12),
          //         ),
          //         SizedBox(width: 5),
          //         Icon(Icons.calendar_today_outlined, color: Colors.grey)
          //       ],
          //     ),
          //   ),
          // ),
          // CircleAvatar(
          //   backgroundColor: Color(0xffE4E9F9),
          //   radius: 15,
          //   child: IconButton(
          //     onPressed: () {},
          //     icon: const Icon(Icons.filter_alt,
          //         color: Color(0xff1E40AF), size: 15),
          //   ),
          // )
        ],
      ),
    );
  }
}
