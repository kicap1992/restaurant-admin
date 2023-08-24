import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../app/app.dialogs.dart';
import '../../../../../app/app.logger.dart';
import '../../../../../app/core/custom_base_view_model.dart';

class AddEditMakananViewModel extends CustomBaseViewModel {
  final log = getLogger('AddMakananViewModel');

  String? namaMakanan;
  String? hargaMakanan;
  // String? hargaOngkir;
  String? deskripsi;

  String? _imagePath;
  final ImagePicker _picker = ImagePicker();
  XFile? imageFile;
  Uint8List? imageBytes;

  Future<void> init() async {
    globalVar.backPressed = 'backNormal';
  }

  void addImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        imageFile = image;
        _imagePath = image.path;
        imageBytes = await image.readAsBytes();

        log.i('image path: $_imagePath');
        notifyListeners();
      }
    } catch (e) {
      log.e(e);
    }
  }

  Future<String?> addEditDialog(
      {required String title,
      required String description,
      int maxLines = 2,
      bool keyboardType = false}) async {
    var res = await dialogService.showCustomDialog(
      variant: DialogType.addEditMakananTextFormDialogView,
      data: {
        'title': title,
        'description': description,
        'maxLines': maxLines,
        'keyboardType': keyboardType,
      },
    );

    if (res!.confirmed) {
      return res.data;
    } else {
      return null;
    }
  }

  tambahEditMakanan() async {
    if (namaMakanan == null ||
        hargaMakanan == null ||
        // hargaOngkir == null ||
        deskripsi == null ||
        imageFile == null) {
      await dialogService.showDialog(
        title: 'Error',
        description: 'Semua field harus diisi',
      );
    } else {
      easyLoading.customLoading('Tambah Makanan');
      setBusy(true);
      try {
        var formData = FormData.fromMap({
          'nama_makanan': namaMakanan,
          'harga_makanan': hargaMakanan,
          // 'harga_ongkir': hargaOngkir,
          'deskripsi_makanan': deskripsi,
          'image': await MultipartFile.fromFile(_imagePath!),
        });

        var res = await httpService.postWithFormData('table/makanan', formData);
        log.i(res.data);
        setBusy(false);
        easyLoading.dismiss();
        dialogService.showDialog(
          title: 'Berhasil',
          description: 'Makanan berhasil ditambahkan',
        );
        globalVar.backPressed = 'exitApp';
        navigationService.back();
        navigationService.back();
      } catch (e) {
        log.e(e);
      } finally {
        setBusy(false);
        easyLoading.dismiss();
      }
    }
  }
}
