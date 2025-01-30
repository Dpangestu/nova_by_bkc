class AuthModel {
  final int id;
  final String? idjabatan;
  final String username;
  final String name;
  final String? idrole;
  final String nik;
  final String kode_kantor;
  final String email;
  final String telepon;
  final String? divisi;
  final String? url;
  final int? status_aktif;
  final int? status_user;
  final int? usercore;
  final String kodeGroup1;
  final String password;

  AuthModel({
    required this.id,
    required this.idjabatan,
    required this.username,
    required this.name,
    required this.idrole,
    required this.nik,
    required this.kode_kantor,
    required this.email,
    required this.telepon,
    required this.divisi,
    required this.url,
    required this.status_aktif,
    required this.status_user,
    required this.usercore,
    required this.kodeGroup1,
    required this.password,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      id: json['id'] ?? 0,
      idjabatan: json['idjabatan'].toString(),
      username: json['username'] ?? '',
      name: json['name'] ?? '',
      idrole: json['idrole']?.toString() ?? '',
      kode_kantor: json['kode_kantor'] ?? '',
      nik: json['nik'] ?? '',
      email: json['email'] ?? '',
      telepon: json['telepon'] ?? '',
      divisi: json['divisi'] ?? '',
      url: json['url'] ?? '',
      status_aktif: int.tryParse(json['status_aktif']?.toString() ?? '0') ?? 0,
      status_user: int.tryParse(json['status_user']?.toString() ?? '0') ?? 0,
      usercore: int.tryParse(json['usercore']?.toString() ?? '0') ?? 0,
      kodeGroup1: json['kode_group1'] ?? '',
      password: json['password'] ?? '',
    );
  }

  get kode_group1 => null;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'name': name,
      'email': email,
      'kode_kantor': kode_kantor,
      'idrole': idrole,
      'nik': nik,
      'usercore': usercore,
      'password': password,
      'kode_group1': kodeGroup1,
      'telepon': telepon,
      'divisi': divisi,
      'url': url,
      'status_aktif': status_aktif,
      'status_user': status_user,
    };
  }

  static AuthModel? fromMap(Map<String, dynamic> data) {
    if (data.isEmpty) return null;

    int parseStringToInt(dynamic value) {
      if (value is int) return value;
      if (value is String) return int.tryParse(value) ?? 0;
      return 0;
    }

    String parseIntToString(dynamic value) {
      if (value is String) return value;
      if (value is int) return value.toString();
      return '';
    }

    return AuthModel(
      id: parseStringToInt(data['id']),
      idjabatan: data['idjabatan']?.toString(),
      username: data['username'] ?? '',
      name: data['name'] ?? '',
      idrole: data['idrole']?.toString() ?? '',
      nik: data['nik'] ?? '',
      kode_kantor: data['kode_kantor'] ?? '',
      email: data['email'] ?? '',
      telepon: data['telepon'] ?? '',
      divisi: data['divisi'] ?? '',
      url: data['url'] ?? '',
      status_aktif: parseStringToInt(data['status_aktif']),
      status_user: parseStringToInt(data['status_user']),
      usercore: parseStringToInt(data['usercore']),
      kodeGroup1: data['kode_group1'] ?? '',
      password: data['password'] ?? '',
    );
  }
}
