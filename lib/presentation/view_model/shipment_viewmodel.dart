import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moniepoin_shipment/models/calculator_category_model/calculator_category_model.dart';
import 'package:moniepoin_shipment/models/shipment_tab_data_model/shipment_history_tab_data_model.dart';
import 'package:moniepoin_shipment/presentation/views/shipment_history/__export__.dart';

import '../../models/dashboard_tab_data_model/__export__.dart';
import '../../utils/locator.dart';
import '../routes/__export__.dart';
import '../views/calculator_screen/calculator_screen.dart';
import '../views/homescreen/__export__.dart';



final shipmentVMProvider = ChangeNotifierProvider<ShipmentViewModel>((ref) {
  return ShipmentViewModel();
});

class ShipmentViewModel extends ChangeNotifier {
  DashBoardTabModel _selectedDashBoardTab=DashBoardTabModel(page: const HomeScreen()
      , iconUrl: "ic_home", tabName: "Home");
  DashBoardTabModel get selectedDashBoardTab => _selectedDashBoardTab;
  set selectedDashBoardTab(DashBoardTabModel dashBoardTabModel) {
    _selectedDashBoardTab = dashBoardTabModel;
    notifyListeners();
  }
  double buttonScale=1.0;
  void setButtonScale(double value){
    buttonScale=value;
    notifyListeners();
  }
  ShipmentHistoryTabModel _selectedShipmentTab=const ShipmentHistoryTabModel(tabName: "All");
  ShipmentHistoryTabModel get selectedShipmentTab => _selectedShipmentTab;
  set selectedShipmentTab(ShipmentHistoryTabModel selectedShipmentTab) {
    _selectedShipmentTab = selectedShipmentTab;
    notifyListeners();
  }

  CalculatorCategoryModel _selectedCalculatorCategory=const CalculatorCategoryModel(name:"Documents");
  CalculatorCategoryModel get selectedCalculatorCategory => _selectedCalculatorCategory;
  set selectedCalculatorCategory(CalculatorCategoryModel categoryModel) {
    _selectedCalculatorCategory = categoryModel;
    notifyListeners();
  }
  void navigateBack(){
    int index=dashBoardTabsData.indexWhere((element) => element.tabName
        ==selectedDashBoardTab.tabName);
    int tabIndex=index-1;
    if(tabIndex!=-1){
      selectedDashBoardTab=dashBoardTabsData[tabIndex];
      locator<AppRouter>().back();
    }
  }
  List<Map<String,dynamic>>transportVehicles=[{"asset":"ic_ocean_freight",
    "freight":"International"},{
    "asset":"ic_cargo_freight",
    "freight":"Relaible"
  },{"asset":"ic_air_freight",
    "freight":"International"},{"asset":"ic_train_freight",
    "freight":"Multi Service"},{"asset":"ic_drone_freight",
    "freight":"Live"},{"asset":"ic_road_freight",
    "freight":"Local"},{"asset":"ic_instant_freight",
    "freight":"Instant"}];

  List<ShipmentHistoryTabModel>shipmentHistoryTabData=const[
    ShipmentHistoryTabModel(tabName: "All"),
    ShipmentHistoryTabModel(tabName: "Completed"),
    ShipmentHistoryTabModel(tabName: "In-Progress"),
    ShipmentHistoryTabModel(tabName: "Pending")
  ];
  List<CalculatorCategoryModel>calculatorCategoryModelList=const [
    CalculatorCategoryModel(name: 'Documents'),
    CalculatorCategoryModel(name: 'Glass'),
    CalculatorCategoryModel(name: 'Liquid') ,
    CalculatorCategoryModel(name: 'Food'),
    CalculatorCategoryModel(name: 'Electronic') ,
    CalculatorCategoryModel(name: 'Product'),
    CalculatorCategoryModel(name: 'Others')
  ];
  List<DashBoardTabModel>dashBoardTabsData=[
    DashBoardTabModel(page: const HomeScreen()
        , iconUrl: "ic_home", tabName: "Home"),
    DashBoardTabModel(page: const CalculatorScreen()
        , iconUrl: "ic_calculator", tabName: "Calculate"),
    DashBoardTabModel(page: const ShipmentHistoryScreen()
        , iconUrl: "ic_shipment", tabName: "Shipment"),
    DashBoardTabModel(page: const ShipmentHistoryScreen()
        , iconUrl: "ic_profile", tabName: "Profile"),
  ];
}
