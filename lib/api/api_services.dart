import 'dart:convert';

import 'package:money/models/lotto_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<LottoModel> fetchLottoNumbers(int drawNo) async {
    final url = Uri.parse(
        "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=$drawNo");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final lottoNumbers = jsonDecode(response.body);
      return LottoModel.fromJson(lottoNumbers);
    }
    throw Exception('API 요청 실패: ${response.statusCode}');
  }
}
