class TabunganEntity {
  final int nasabahId;
  final String namaNasabah;
  final String noRekening;
  final String telpon;
  final String alamat;
  final String namaKantor;
  final int status;
  final String deskripsiProduk;

  TabunganEntity({
    required this.nasabahId,
    required this.namaNasabah,
    required this.noRekening,
    required this.telpon,
    required this.alamat,
    required this.namaKantor,
    required this.status,
    required this.deskripsiProduk,
  });

  factory TabunganEntity.fromJson(Map<String, dynamic>? json) {
    int parseStringToInt(dynamic value) {
      if (value is int) return value;
      return int.tryParse(value.toString()) ?? 0;
    }

    return TabunganEntity(
      nasabahId: parseStringToInt(json?['nasabah_id']),
      namaNasabah: json?['nama_nasabah'] ?? '',
      noRekening: json?['no_rekening'] ?? '',
      telpon: json?['telpon'] ?? '-',
      alamat: json?['alamat'] ?? '',
      namaKantor: json?['nama_kantor'] ?? '',
      status: parseStringToInt(json?['status']),
      deskripsiProduk: json?['DESKRIPSI_PRODUK'] ?? '',
    );
  }
}
