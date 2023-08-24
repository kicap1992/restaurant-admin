import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'add_edit_makanan_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../../../../app/themes/app_colors.dart';
import '../../../../../app/themes/app_text.dart';
import '../../../../widgets/my_white_container.dart';

class AddEditMakananView extends HookWidget {
  const AddEditMakananView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final opacity = useState(0.0);
    final theHeight = useState(MediaQuery.of(useContext()).size.height * 0.35);

    checkScrollValue(scrollController, opacity, theHeight);

    return ViewModelBuilder<AddEditMakananViewModel>.reactive(
      viewModelBuilder: () => AddEditMakananViewModel(),
      onViewModelReady: (AddEditMakananViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        AddEditMakananViewModel model,
        Widget? child,
      ) {
        return WillPopScope(
          onWillPop: () async {
            model.log.d('onWillPop ini detail makanan');
            model.globalVar.backPressed = 'exitApp';
            return true;
          },
          child: Scaffold(
            backgroundColor: backgroundColor,
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  ListView.builder(
                    controller: scrollController,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).padding.top,
                          ),
                          const TopMenuWidget(),
                          const SecondWidget(),
                          const SizedBox(
                            height: 10,
                          ),
                          MyWhiteContainer(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Ongkos Kirim',
                                                style: boldTextStyle.copyWith(
                                                  fontSize: 14,
                                                ),
                                              ),
                                              TextSpan(
                                                text: ' Rp. 10.000',
                                                style: boldTextStyle.copyWith(
                                                  fontSize: 14,
                                                  color: dangerColor,
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
                                      // IconButton(
                                      //   onPressed: () async {
                                      //     String? data =
                                      //         await model.addEditDialog(
                                      //       title: 'Ongkos Kirim',
                                      //       description: 'Harga Ongkir Di Sini',
                                      //       keyboardType: true,
                                      //       maxLines: 1,
                                      //     );

                                      //     // model.log.i('data: $data');
                                      //     model.hargaOngkir = data;
                                      //     model.notifyListeners();
                                      //   },
                                      //   icon: const Icon(
                                      //     Icons.edit,
                                      //     color: dangerColor,
                                      //   ),
                                      //   iconSize: 20,
                                      // ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Bisa Dibayar COD sekitar Parepare",
                                    style: regularTextStyle.copyWith(
                                      fontSize: 13,
                                      color: fontGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          MyWhiteContainer(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Deskripsi",
                                          style: boldTextStyle.copyWith(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          String? data =
                                              await model.addEditDialog(
                                                  title: 'Deskripsi',
                                                  description:
                                                      'Deskripsi Makanan Di Sini',
                                                  maxLines: 5);

                                          // model.log.i('data: $data');
                                          model.deskripsi = data;
                                          model.notifyListeners();
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          color: mainGrey,
                                        ),
                                        iconSize: 20,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // bikin dummy text tentang nasi goreng
                                  Text(
                                    model.deskripsi ??
                                        "Deskripsi Makanan Di Sini",
                                    style: regularTextStyle.copyWith(
                                      fontSize: 13,
                                      color: fontGrey,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    },
                  ),
                  TopBarWidget(opacity: opacity),
                ],
              ),
            ),
            bottomNavigationBar: GestureDetector(
              onTap: () {
                model.tambahEditMakanan();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                width: MediaQuery.of(context).size.width,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: dangerColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Tambah Makanan Baru",
                      style: boldTextStyle.copyWith(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void checkScrollValue(
    ScrollController scrollController,
    ValueNotifier<double> opacity,
    ValueNotifier<double> theHeight,
  ) {
    scrollController.addListener(() {
      opacity.value = scrollController.offset / theHeight.value;
      if (opacity.value > 1) {
        opacity.value = 1;
      } else if (opacity.value < 0) {
        opacity.value = 0;
      }
    });
  }
}

class TopBarWidget extends ViewModelWidget<AddEditMakananViewModel> {
  const TopBarWidget({
    super.key,
    required this.opacity,
  });

  final ValueNotifier<double> opacity;

  @override
  Widget build(BuildContext context, AddEditMakananViewModel viewModel) {
    return Positioned(
      top: 0,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        color: Colors.white.withOpacity(opacity.value),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Row(
              // create 3 circle widget, with background color is black and opacity is 0.5, ist icon is back, second icon is cart and third icon is 3 dots
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    onPressed: () {
                      viewModel.globalVar.backPressed = 'exitApp';
                      viewModel.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                // const Expanded(
                //   child: SizedBox(
                //     width: 20,
                //   ),
                // ),
                // Container(
                //   width: 40,
                //   height: 40,
                //   decoration: BoxDecoration(
                //     color: Colors.black.withOpacity(0.5),
                //     borderRadius: BorderRadius.circular(20),
                //   ),
                //   child: IconButton(
                //     onPressed: () {},
                //     icon: const Icon(
                //       Icons.shopping_cart_outlined,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   width: 20,
                // ),
                // Container(
                //   width: 40,
                //   height: 40,
                //   decoration: BoxDecoration(
                //     color: Colors.black.withOpacity(0.5),
                //     borderRadius: BorderRadius.circular(20),
                //   ),
                //   child: IconButton(
                //     onPressed: () {},
                //     icon: const Icon(
                //       Icons.more_vert,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SecondWidget extends ViewModelWidget<AddEditMakananViewModel> {
  const SecondWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, AddEditMakananViewModel viewModel) {
    return MyWhiteContainer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        viewModel.namaMakanan ?? 'Nama Makanan Di Sini',
                        style: regularTextStyle.copyWith(
                          fontSize: 17,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () async {
                        String? data = await viewModel.addEditDialog(
                          title: 'Nama Makanan',
                          description: 'Nama Makanan Di Sini',
                        );

                        // viewModel.log.i('data: $data');
                        viewModel.namaMakanan = data;
                        viewModel.notifyListeners();
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: mainGrey,
                      ),
                      iconSize: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Harga Makanan Di Sini",
                        style: regularTextStyle.copyWith(
                          fontSize: 18,
                          color: dangerColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () async {
                        String? data = await viewModel.addEditDialog(
                          title: 'Harga Makanan',
                          description: 'Harga Makanan Di Sini',
                          keyboardType: true,
                          maxLines: 1,
                        );

                        // viewModel.log.i('data: $data');
                        viewModel.hargaMakanan = data;
                        viewModel.notifyListeners();
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: dangerColor,
                      ),
                      iconSize: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopMenuWidget extends ViewModelWidget<AddEditMakananViewModel> {
  const TopMenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, AddEditMakananViewModel viewModel) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.35,
          // child: Image.network(
          //   'https://a.cdn-hotels.com/gdcs/production0/d1513/35c1c89e-408c-4449-9abe-f109068f40c0.jpg?impolicy=fcrop&w=800&h=533&q=medium',
          //   fit: BoxFit.cover,
          // ),
          child: viewModel.imageBytes != null
              ? Image.memory(
                  viewModel.imageBytes!,
                  fit: BoxFit.cover,
                )
              : Center(
                  child: Text(
                    'Add Image',
                    style: boldTextStyle.copyWith(
                      fontSize: 20,
                    ),
                  ),
                ),
        ),
        // Positioned(
        //   bottom: 10,
        //   right: 10,
        //   child: Container(
        //     padding: const EdgeInsets.symmetric(
        //       horizontal: 5,
        //     ),
        //     // width: 20,
        //     height: 20,
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //     child: const Center(
        //       child: Text(
        //         '1 / 2',
        //         style: TextStyle(
        //           color: fontGrey,
        //           fontSize: 12,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        Positioned(
          bottom: 20,
          right: 20,
          child: GestureDetector(
            onTap: () => viewModel.addImage(),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
