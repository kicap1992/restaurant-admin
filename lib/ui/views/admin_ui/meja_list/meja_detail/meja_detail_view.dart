import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../app/themes/app_colors.dart';
import '../../../../../app/themes/app_text.dart';
import '../../../../../app/app.router.dart';
import './meja_detail_view_model.dart';

class MejaDetailView extends StatelessWidget {
  final String mejaId;

  const MejaDetailView({
    Key? key,
    required this.mejaId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MejaDetailViewModel>.reactive(
      viewModelBuilder: () => MejaDetailViewModel(),
      onViewModelReady: (MejaDetailViewModel model) async {
        await model.init(mejaId);
      },
      builder: (
        BuildContext context,
        MejaDetailViewModel model,
        Widget? child,
      ) {
        return WillPopScope(
          onWillPop: () async {
            model.log.i('onWillPop ${model.globalVar.backPressed}');
            if (model.globalVar.backPressed == 'backNormal') {
              model.globalVar.backPressed = 'exitApp';
              return true;
            }
            // model.quitApp(context);

            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text('Detail ${model.namaMeja}',
                  style: const TextStyle(color: Colors.white)),
              backgroundColor: mainColor,
              leading: IconButton(
                onPressed: () {
                  if (model.globalVar.backPressed == 'backNormal') {
                    model.globalVar.backPressed = 'exitApp';
                    model.navigationService.back();
                    // return true;
                  }
                },
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: model.imgAsset == null
                          ? const Center(child: CircularProgressIndicator())
                          : Image.asset(model.imgAsset!, fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    model.namaMeja,
                    style: const TextStyle(
                      fontSize: 20,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: 'Status : ',
                      style: regularTextStyle,
                      children: [
                        TextSpan(
                          text: 'Tersedia',
                          style: regularTextStyle.copyWith(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: 'Kapasitas : ',
                      style: regularTextStyle,
                      children: [
                        TextSpan(
                          text: 'Maksimal 8 Orang',
                          style: regularTextStyle.copyWith(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: 'Lokasi : ',
                      style: regularTextStyle,
                      children: [
                        TextSpan(
                          text: 'Luar Ruangan',
                          style: regularTextStyle.copyWith(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: 'Harga : ',
                      style: regularTextStyle,
                      children: [
                        TextSpan(
                          text: 'Rp. 20.000',
                          style: regularTextStyle.copyWith(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 2,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        // make the color random between red and blue
                        const color = Colors.blue;
                        String pesanStatus = 'Menunggu Pengesahan';
                        return Card(
                          color: color,
                          child: ListTile(
                            // leading: CircleAvatar(
                            //   backgroundColor: Colors.white,
                            //   child: Text(
                            //     index.toString(),
                            //     style: regularTextStyle,
                            //   ),
                            // ),
                            title: Text(
                              'Nama Pemesan',
                              style: regularTextStyle.copyWith(
                                fontSize: 18,
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '08:00.00 - 09:00.00',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  pesanStatus,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios,
                                color: Colors.white),
                            onTap: () {
                              model.log.i('Meja 1');
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              width: MediaQuery.of(context).size.width,
              height: 70,
              decoration: BoxDecoration(
                color: mainColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 5,
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // model.log.i('Edit');
                        model.navigationService
                            .navigateToMejaEditView(mejaId: mejaId);
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Edit',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // divider
                  Container(
                    width: 1,
                    height: 30,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        model.log.i('List');
                        // model.navigationService.navigateToMakananListView();
                        model.navigationService
                            .navigateToMejaHistoryLogView(mejaId: mejaId);
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.list,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'History Booking',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: orangeColor,
              onPressed: () {
                // model.navigationService.navigateToAddEditMakananView();
              },
              // create a add product button
              child: const Icon(
                Icons.edit_calendar_outlined,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniEndTop,
          ),
        );
      },
    );
  }
}
