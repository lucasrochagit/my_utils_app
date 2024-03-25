class SearchCEP {
  int? status;
  bool? ok;
  String? code;
  String? state;
  String? city;
  String? district;
  String? address;
  String? statusText;

  SearchCEP({
    this.status,
    this.ok,
    this.code,
    this.state,
    this.city,
    this.district,
    this.address,
    this.statusText,
  });

  SearchCEP.fromJson(Map json) {
    status = json['status'];
    ok = json['ok'];
    code = json['code'];
    state = json['state'];
    city = json['city'];
    district = json['district'];
    address = json['address'];
    statusText = json['statusText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['ok'] = ok;
    data['code'] = code;
    data['state'] = state;
    data['city'] = city;
    data['district'] = district;
    data['address'] = address;
    data['statusText'] = statusText;
    return data;
  }
}
