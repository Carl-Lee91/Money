class LottoModel {
  final int? firstWinamnt,
      drwtNo1,
      drwtNo2,
      drwtNo3,
      drwtNo4,
      drwtNo5,
      drwtNo6,
      bnusNo,
      drwNo;
  final String? drwNoDate;

  LottoModel.fromJson(Map<String, dynamic> json)
      : bnusNo = json["bnusNo"],
        drwNo = json["drwNo"],
        drwNoDate = json["drwNoDate"],
        drwtNo1 = json["drwtNo1"],
        drwtNo2 = json["drwtNo2"],
        drwtNo3 = json["drwtNo3"],
        drwtNo4 = json["drwtNo4"],
        drwtNo5 = json["drwtNo5"],
        drwtNo6 = json["drwtNo6"],
        firstWinamnt = json["firstWinamnt"];
}
