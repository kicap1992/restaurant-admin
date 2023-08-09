import 'package:flutter/material.dart';
import 'package:reza_admin/app/app.router.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/themes/app_colors.dart';
import '../../../widgets/my_textformfield.dart';
import '../../../widgets/my_white_container.dart';
import './makanan_list_view_model.dart';

class MakananListView extends StatelessWidget {
  const MakananListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MakananListViewModel>.reactive(
      viewModelBuilder: () => MakananListViewModel(),
      onViewModelReady: (MakananListViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        MakananListViewModel model,
        Widget? child,
      ) {
        return WillPopScope(
          onWillPop: () async {
            model.log.d('onWillPop ini makanan');
            if (model.globalVar.backPressed == 'exitApp') {
              model.quitApp(context);
              model.globalVar.backPressed = 'exitApp';
              return false;
            }
            return false;
          },
          child: Scaffold(
            backgroundColor: backgroundColor,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // get the top height of the notification bar
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),
                MyWhiteContainer(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: IconButton(
                          onPressed: () => model.back(),
                          icon: const Icon(Icons.arrow_back),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 10,
                        child: MyTextFormField(
                          // controller: model.searchController,
                          hintText: 'Cari Makanan',
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.filter_list),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Filter'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                MyWhiteContainer(
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text('Terbaru'),
                          ),
                        ),
                        const VerticalDivider(
                          color: mainGrey,
                          thickness: 1,
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Terlaris',
                              style: TextStyle(
                                color: mainGrey,
                              ),
                            ),
                          ),
                        ),
                        const VerticalDivider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            child: const Row(
                              children: [
                                Text(
                                  'Harga',
                                  style: TextStyle(
                                    color: mainGrey,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: mainGrey,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          for (var i = 0; i < 10; i++)
                            GestureDetector(
                              onTap: () => model.goToDetailMakanan(),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.46,
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      'https://a.cdn-hotels.com/gdcs/production0/d1513/35c1c89e-408c-4449-9abe-f109068f40c0.jpg?impolicy=fcrop&w=800&h=533&q=medium',
                                      height: 150,
                                      width: double.infinity,
                                      fit: BoxFit.fill,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        left: 5,
                                      ),
                                      child: Text(
                                        'Product Name',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        left: 5,
                                      ),
                                      child: Text(
                                        'Rp. 100.000',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                model.navigationService.navigateToAddEditMakananView();
              },
              // create a add product button
              child: const Icon(Icons.add),
            ),
          ),
        );
      },
    );
  }
}
