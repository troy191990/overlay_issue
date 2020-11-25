class HomeOption {
  HomeOption(
      {this.id,
      this.pageName,
      this.uiOrderId,
      this.iconCode,
      this.textOne,
      this.textTwo,
      this.isActive});

  final String id;
  final String pageName;
  final int uiOrderId;
  final String iconCode;
  final String textOne;
  final String textTwo;
  final bool isActive;

  HomeOption.initial()
      : pageName = '',
        uiOrderId = 0,
        iconCode = '',
        textOne = '',
        textTwo = '',
        isActive = false,
        id = '';

  HomeOption.fromJson(Map jsonMap)
      : pageName = jsonMap['PageName'],
        uiOrderId = jsonMap['UiOrderId'],
        iconCode = jsonMap['IconCode'],
        textOne = jsonMap['TextOne'],
        textTwo = jsonMap['TextTwo'],
        isActive = jsonMap['IsActive'],
        id = jsonMap['HomeOptionObjectId'];
}
