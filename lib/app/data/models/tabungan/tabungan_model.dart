import 'package:nova_by_bkc/app/domain/entity/tabungan/tabungan_entity.dart';

class TabunganModel extends TabunganEntity {
  TabunganModel({
    required int nasabahId,
    required String namaNasabah,
    required String noRekening,
    required String telpon,
    required String alamat,
    required String namaKantor,
    required int status,
    required String deskripsiProduk,
  }) : super(
          nasabahId: nasabahId,
          namaNasabah: namaNasabah,
          noRekening: noRekening,
          telpon: telpon,
          alamat: alamat,
          namaKantor: namaKantor,
          status: status,
          deskripsiProduk: deskripsiProduk,
        );

  factory TabunganModel.fromJson(Map<String, dynamic> json) {
    int parseStringToInt(dynamic value) {
      if (value is int) return value;
      if (value is String) return int.tryParse(value) ?? 0;
      return 0;
    }

    return TabunganModel(
      nasabahId: parseStringToInt(json['nasabah_id']),
      namaNasabah: json['nama_nasabah'] ?? '',
      noRekening: json['no_rekening'] ?? '',
      telpon: json['telpon'] ?? '-',
      alamat: json['alamat'] ?? '',
      namaKantor: json['nama_kantor'] ?? '',
      status: parseStringToInt(json['status']),
      deskripsiProduk: json['DESKRIPSI_PRODUK'] ?? '',
    );
  }
}
