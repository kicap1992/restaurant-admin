import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../app/themes/app_colors.dart';
import '../../../../../app/themes/app_text.dart';
import './meja_edit_view_model.dart';

class MejaEditView extends StatelessWidget {
  final String mejaId;
  const MejaEditView({
    Key? key,
    required this.mejaId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MejaEditViewModel>.reactive(
      viewModelBuilder: () => MejaEditViewModel(),
      onViewModelReady: (MejaEditViewModel model) async {
        await model.init(mejaId);
      },
      builder: (
        BuildContext context,
        MejaEditViewModel model,
        Widget? child,
      ) {
        return WillPopScope(
          onWillPop: () async {
            model.log.i(
                'backPressed : ${model.globalVar.backPressed} in MejaEditView');
            if (model.globalVar.backPressed == 'backNormal') {
              // model.globalVar.backPressed = 'exitApp';
              // model.globalVar.backPressed = 'backNormal';
              return true;
            }
            // model.quitApp(context);

            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text('Edit Detail ${model.namaMeja}',
                  style: const TextStyle(color: Colors.white)),
              backgroundColor: mainColor,
              leading: IconButton(
                onPressed: () {
                  if (model.globalVar.backPressed == 'backNormal') {
                    // model.globalVar.backPressed = 'exitApp';
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
                      color: mainGrey,
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            'Insert Image',
                            style: regularTextStyle.copyWith(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
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
                  Row(
                    children: [
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text: 'Kapasitas : ',
                            style: regularTextStyle,
                            children: [
                              TextSpan(
                                text: 'Maksimal 8 Orang',
                                style: regularTextStyle.copyWith(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit),
                      ),
                    ],
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
                  Row(
                    children: [
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text: 'Harga : ',
                            style: regularTextStyle,
                            children: [
                              TextSpan(
                                text: 'Rp. 20.000',
                                style: regularTextStyle.copyWith(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit),
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox(height: 10)),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        model.navigationService.back();
                      },
                      child: const Text('Simpan Perubahan'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
