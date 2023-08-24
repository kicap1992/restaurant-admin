import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:reza_admin/app/app.router.dart';
import 'package:reza_admin/app/themes/app_colors.dart';
import 'package:reza_admin/app/themes/app_text.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';

import './meja_list_view_model.dart';

class MejaListView extends StatelessWidget {
  const MejaListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MejaListViewModel>.reactive(
      viewModelBuilder: () => MejaListViewModel(),
      onViewModelReady: (MejaListViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        MejaListViewModel model,
        Widget? child,
      ) {
        return WillPopScope(
          onWillPop: () async {
            model.log.d('onWillPop ini meja');
            if (model.globalVar.backPressed == 'exitApp') {
              model.quitApp(context);
              model.globalVar.backPressed = 'exitApp';
              return false;
            }
            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Reservasi Meja',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              backgroundColor: mainColor,
              automaticallyImplyLeading: false,
            ),
            body: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: WebView(
                    initialUrl: dotenv.env['table_url'],
                    // initialUrl: 'http://172.29.85.181/parkir/user',
                    // initialUrl: 'https://rekam-medis.airlangga-it.com/',
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (WebViewController webViewController) {
                      model.webViewController = webViewController;
                    },
                    onProgress: (int progress) {
                      // model.log.i('WebView is loading (progress : $progress%)');
                      // show a loading indicator when the WebView is loading using circular progress indicator
                      model.easyLoading.customLoading('Loading Data Meja');
                    },
                    // javascriptChannels: <JavascriptChannel>{
                    //   _toasterJavascriptChannel(context),
                    // },
                    javascriptChannels: <JavascriptChannel>{
                      JavascriptChannel(
                        name: 'messageHandler',
                        onMessageReceived: (JavascriptMessage message) async {
                          model.log.i('messageHandler : ${message.message}');
                          model.navigationService.navigateToMejaDetailView(
                            mejaId: message.message,
                          );
                        },
                      ),
                      JavascriptChannel(
                        name: 'messageHandler1',
                        onMessageReceived: (JavascriptMessage message) async {
                          // String no_telpon = message.message;
                          // dev.i('no_telpon : $no_telpon');
                          // await launchUrl(Uri.parse('tel:$no_telpon'));
                        },
                      ),
                    },
                    navigationDelegate: (NavigationRequest request) async {
                      // if (request.url.startsWith('https://www.youtube.com/')) {
                      //   dev.log('blocking navigation to $request}');
                      //   return NavigationDecision.prevent;
                      // }
                      // check if request.url has 'nrm'

                      return NavigationDecision.navigate;
                    },
                    onPageStarted: (String url) {
                      model.log.i('Page started loading: $url');
                    },
                    onPageFinished: (String url) {
                      model.log.i('Page finished loading: $url');
                      model.easyLoading.dismiss();
                    },
                    gestureNavigationEnabled: true,
                    backgroundColor: const Color(0x00000000),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // create 3 circle color
                        Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(223, 216, 214, 1),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Text('Tersedia'),
                        const SizedBox(width: 10),

                        Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Text('Dibooking'),

                        const SizedBox(width: 10),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Text('Menunggu'),
                        const SizedBox(width: 10),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.grey[600],
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Text('Tidak Tersedia'),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: model.isBusy
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: model.reservasiMejaList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            // make the color random between red and blue

                            final color =
                                model.reservasiMejaList[index].status ==
                                        'booking'
                                    ? Colors.red
                                    : (model.reservasiMejaList[index].status ==
                                            'Tidak Tersedia'
                                        ? Colors.grey[600]
                                        : Colors.green);
                            String pesanStatus = model
                                .reservasiMejaList[index].status!
                                .toUpperCase();
                            return Card(
                              color: color,
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Text(
                                    model.reservasiMejaList[index].idMeja
                                        .toString(),
                                    style: regularTextStyle,
                                  ),
                                ),
                                title: Text(
                                  model.userModelList[index] != null
                                      ? model.userModelList[index]!.nama ?? '-'
                                      : '-',
                                  style: regularTextStyle.copyWith(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      model.reservasiMejaList[index]
                                              .jamBooking ??
                                          '',
                                      style: const TextStyle(
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
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () async {
            //     await model.webViewController!.reload();
            //   },
            //   backgroundColor: mainColor,
            //   child: const Icon(Icons.add),
            // ),
          ),
        );
      },
    );
  }
}
