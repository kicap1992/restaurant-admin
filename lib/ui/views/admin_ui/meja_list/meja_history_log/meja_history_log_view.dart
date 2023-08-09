import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../app/themes/app_colors.dart';
import '../../../../../app/themes/app_text.dart';
import './meja_history_log_view_model.dart';

class MejaHistoryLogView extends StatelessWidget {
  final String mejaId;
  const MejaHistoryLogView({Key? key, required this.mejaId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MejaHistoryLogViewModel>.reactive(
      viewModelBuilder: () => MejaHistoryLogViewModel(),
      onViewModelReady: (MejaHistoryLogViewModel model) async {
        await model.init(mejaId);
      },
      builder: (
        BuildContext context,
        MejaHistoryLogViewModel model,
        Widget? child,
      ) {
        return WillPopScope(
          onWillPop: () async {
            model.log.i(
                'backPressed : ${model.globalVar.backPressed} in MejaHistoryLogView');
            if (model.globalVar.backPressed == 'backNormal') {
              // model.globalVar.backPressed = 'exitApp';
              return true;
            }
            // model.quitApp(context);

            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text('History Log ${model.namaMeja}',
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
              padding: const EdgeInsets.all(15),
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
          ),
        );
      },
    );
  }
}
