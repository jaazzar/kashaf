import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:wosul_app/controllers/userController.dart';
import 'package:wosul_app/views/widgets/Dashboard/chart.dart';
import 'package:wosul_app/views/widgets/Dashboard/oneNumberInfo.dart';
import 'package:wosul_app/views/widgets/Dashboard/wideOneValuePops.dart';

class InventoryTab extends ConsumerWidget {
  const InventoryTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(children: [
      InventoryItem(
          url:
              "https://singerindonesia.com//_assets/cimage/webroot/img.php?src=images/temp/1599724183_71gmSrfAWCH38Fdq2zXt.jpg",
          name: "زيت",
          price: 12.99),
      InventoryItem(
          url:
              "https://cameroontimberexport.com/wp-content/uploads/2022/03/mahogany-wood-1024x683.jpg",
          name: "خشب",
          price: 6.99),
      InventoryItem(
          url: "https://m.media-amazon.com/images/I/61G2hAR+ggS.jpg",
          name: "غراء",
          price: 22.99),
      InventoryItem(
          url:
              "https://singerindonesia.com//_assets/cimage/webroot/img.php?src=images/temp/1599724183_71gmSrfAWCH38Fdq2zXt.jpg",
          name: "زيت",
          price: 12.99),
      InventoryItem(
          url:
              "https://cameroontimberexport.com/wp-content/uploads/2022/03/mahogany-wood-1024x683.jpg",
          name: "خشب",
          price: 12.99),
      InventoryItem(
          url: "https://m.media-amazon.com/images/I/61G2hAR+ggS.jpg",
          name: "زيت",
          price: 12.99),
      InventoryItem(
          url:
              "https://singerindonesia.com//_assets/cimage/webroot/img.php?src=images/temp/1599724183_71gmSrfAWCH38Fdq2zXt.jpg",
          name: "زيت",
          price: 12.99),
      InventoryItem(
          url:
              "https://cameroontimberexport.com/wp-content/uploads/2022/03/mahogany-wood-1024x683.jpg",
          name: "خشب",
          price: 12.99),
      InventoryItem(
          url: "https://m.media-amazon.com/images/I/61G2hAR+ggS.jpg",
          name: "زيت",
          price: 12.99),
      InventoryItem(
          url:
              "https://singerindonesia.com//_assets/cimage/webroot/img.php?src=images/temp/1599724183_71gmSrfAWCH38Fdq2zXt.jpg",
          name: "زيت",
          price: 12.99),
      InventoryItem(
          url:
              "https://cameroontimberexport.com/wp-content/uploads/2022/03/mahogany-wood-1024x683.jpg",
          name: "خشب",
          price: 12.99),
      InventoryItem(
          url: "https://m.media-amazon.com/images/I/61G2hAR+ggS.jpg",
          name: "زيت",
          price: 12.99),
    ]);
  }
}

// return SingleChildScrollView(
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       const Padding(
//         padding: EdgeInsets.only(left: 16.0, top: 5),
//         child: Text(
//           "Inventory",
//           style: TextStyle(
//               fontWeight: FontWeight.bold,
//               color: Colors.black54,
//               fontSize: 25),
//         ),
//       ),
//       const WideOneValuePops(),
//       Container(
//           height: 180,
//           padding: const EdgeInsets.only(left: 12, right: 10, top: 5),
//           margin: const EdgeInsets.symmetric(horizontal: 8),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const Text(
//                     "Hourly Sales",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black54,
//                         fontSize: 14),
//                   ),
//                   InkWell(
//                     onTap: () {},
//                     child: Container(
//                       padding:
//                           const EdgeInsets.only(left: 8, top: 2, bottom: 2),
//                       margin: EdgeInsets.only(top: 1),
//                       decoration: BoxDecoration(
//                         color: Color(0xffEDEFF4),
//                         borderRadius: BorderRadius.circular(4),
//                       ),
//                       child: const Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "view report",
//                             style: TextStyle(
//                                 color: Color(0xff4B5B73),
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 12),
//                           ),
//                           Icon(
//                             Icons.keyboard_arrow_right_rounded,
//                             color: Color(0xff4B5B73),
//                             size: 20,
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const Expanded(child: LineChartSample2()),
//             ],
//           )),
//       const Row(
//         children: [
//           OneNumberInfo(
//               name: "Top Wasted Items by Cost",
//               value: "(INR 0)",
//               rising: true,
//               linesPictureNumber: 1),
//           OneNumberInfo(
//               name: "Top Consumed Items by Cost",
//               value: "(INR 0)",
//               rising: true,
//               linesPictureNumber: 1),
//         ],
//       ),
//     ],
//   ),
// );
class InventoryItem extends StatefulWidget {
  const InventoryItem(
      {super.key, required this.url, required this.name, required this.price});
  final String url;
  final String name;
  final double price;

  @override
  State<InventoryItem> createState() => _InventoryItemState();
}

class _InventoryItemState extends State<InventoryItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width / 2) - 20,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 120,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            // width: 200,
            child: Column(
              children: [
                SizedBox(
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("طلب"),
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor:
                            const Color.fromARGB(255, 187, 251, 211)),
                  ),
                ),
                SizedBox(
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("تبليغ احتياج"),
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Color.fromARGB(255, 255, 185, 177)),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.name,
                style: TextStyle(fontSize: 27),
              ),
              Text(widget.price.toString())
            ],
          ),
          Gap(10),
          SizedBox(
            width: 110,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  widget.url,
                  fit: BoxFit.cover,
                )),
          ),
        ],
      ),
    );
  }
}
