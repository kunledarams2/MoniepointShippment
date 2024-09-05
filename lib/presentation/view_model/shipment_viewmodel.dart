import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moniepoin_shipment/models/calculator_category_model/calculator_category_model.dart';
import 'package:moniepoin_shipment/models/shipment_tab_data_model/shipment_history_tab_data_model.dart';
import 'package:moniepoin_shipment/presentation/views/shipment_history/__export__.dart';

import '../../models/dashboard_tab_data_model/__export__.dart';
import '../../models/search_shipment_item_model/search_shipment_item_model.dart';
import '../../models/shipping_history_model.dart';
import '../../utils/locator.dart';
import '../routes/__export__.dart';
import '../views/calculator_screen/calculator_screen.dart';
import '../views/homescreen/__export__.dart';



final shipmentVMProvider = ChangeNotifierProvider<ShipmentViewModel>((ref) {
  return ShipmentViewModel();
});

class ShipmentViewModel extends ChangeNotifier {

  // Constructor
  shipmentVMProvider() {
    // Automatically read the shipping history JSON on initialization
    _initShippingHistory();
  }
  // Private method to initialize shipping history
  void _initShippingHistory() async {
    await readShippingHistoryJson();
  }

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

  List<Map<String,dynamic>>transportVehicles=[
    {"asset":"ic_ocean_freight",
    "freight":"International"},
    {
    "asset":"ic_cargo_freight",
    "freight":"Relaible"
  },
    {"asset":"ic_air_freight",
    "freight":"International"},
    {"asset":"ic_train_freight",
    "freight":"Multi Service"},
    {"asset":"ic_drone_freight",
    "freight":"Live"},
    {"asset":"ic_road_freight",
    "freight":"Local"},

    {"asset":"ic_instant_freight",
    "freight":"Instant"}];

  List<SearchShipmentItemModel>searchHistoryItems=[
    const SearchShipmentItemModel(itemDescription: '#NEJ20089934122231 • Barcelona → Paris',
        itemName: 'Summer linen jacket'),
    const SearchShipmentItemModel(itemDescription: '#DGHJ2488383939393 • Barcelona → London',
        itemName: 'Summer linen Shirt'),
    const SearchShipmentItemModel(itemDescription: '#NEJ20089934122231 • Barcelona → Paris',
        itemName: 'Winter linen jacket'),
    const SearchShipmentItemModel(itemDescription: '#DGHJ2488383939393 • Barcelona → London',
        itemName: 'Summer linen Shirt'),
    const SearchShipmentItemModel(itemDescription: '#NEJ20089934122231 • United Kingdom → Paris',
        itemName: 'Autumn linen jacket'),
    const SearchShipmentItemModel(itemDescription: '#DGHJ2488383939393 • Barcelona → London',
        itemName: 'Winter linen Shirt'),
    const SearchShipmentItemModel(itemDescription: '#NEJ20089934122231 • Paris → Barcelona',
        itemName: 'Autumn linen jacket'),
    const SearchShipmentItemModel(itemDescription: '#DGHJ2488383939393 • Barcelona → London',
        itemName: 'Summer linen Shirt'),
    const SearchShipmentItemModel(itemDescription: '#DGHJ2488383939393 • Barcelona → London',
        itemName: 'Winter linen Shirt'),
    const SearchShipmentItemModel(itemDescription: '#NEJ20089934122231 • Paris → Barcelona',
        itemName: 'Autumn linen jacket'),
    const SearchShipmentItemModel(itemDescription: '#DGHJ2488383939393 • Barcelona → London',
        itemName: 'Summer linen Shirt'),
    const SearchShipmentItemModel(itemDescription: '#NEJ20089934122231 • Barcelona → Paris',
        itemName: 'Summer linen jacket'),
    const SearchShipmentItemModel(itemDescription: '#DGHJ2488383939393 • Barcelona → London',
        itemName: 'Summer linen Shirt'),
    const SearchShipmentItemModel(itemDescription: '#NEJ20089934122231 • Barcelona → Paris',
        itemName: 'Winter linen jacket'),
  ];

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

  List<Map<String,dynamic>>shippingHistory= [];

  // ShippingHistory get selectedShippingHistory => _selectedShippingHistory;
  // set selectedShippingHistory(ShippingHistory dashBoardTabModel) {
  //   _selectedShippingHistory = dashBoardTabModel;
  //   notifyListeners();
  // }
  // Future<void> readShippingHistoryJson() async {
  //   final String response = await rootBundle.loadString('assets/jsons/shippinghistory.json');
  //   final data = await json.decode(response);
  //   final shippingData = ShippingHistory.fromJson(data);
  //
  //   if (shippingData.success){
  //
  //   }
  //
  //   // countryList.value  =  data["items"].map((e) => e['name']).toList();
  //
  // }


  ShippingHistory? _selectedShippingHistory;

  // Getter for selectedShippingHistory
  ShippingHistory? get selectedShippingHistory => _selectedShippingHistory;

  // Setter for selectedShippingHistory with notifyListeners()
  set selectedShippingHistory(ShippingHistory? shippingHistory) {
    _selectedShippingHistory = shippingHistory;
    notifyListeners();
  }

  var listHolder = useState<List<ShippingDatum>?>([]);

  // double allShippingHistory=0;
  // void setAllShippingHistory(double value){
  //   allShippingHistory=value;
  //   notifyListeners();
  // }

  // Function to read JSON data and update ShippingHistory
  Future<void> readShippingHistoryJson() async {
    try {
      final String response = await rootBundle.loadString('assets/jsons/shippinghistory.json');
      final Map<String, dynamic> data = json.decode(response);
      final ShippingHistory shippingData = ShippingHistory.fromJson(data);

      // Handling the success case
      if (shippingData.success) {
        // Update selectedShippingHistory or perform other actions
        selectedShippingHistory = shippingData;


        // If you need to update another list or value, you can do so here.
        // Example: countryList = shippingData.items;
      }
    } catch (e) {
      // Handle any errors that occur during the JSON parsing
      print('Error loading shipping history: $e');
    }
  }

  int  calculateTotalForStatus(List<ShippingDatum> shipments, String status) {

    int pendingCount = 0;

    if (status =="All"){
      return shipments.length;
    }
    for (var item in shipments) {
      if (item.status == status) {
        pendingCount++;
      }
    }
    return pendingCount;
  }

  Future<double> calculateTotalPendingAmount(String status) async {
    final String response = await rootBundle.loadString('assets/jsons/shippinghistory.json');
    final Map<String, dynamic> data = json.decode(response);
    final ShippingHistory shippingHistory = ShippingHistory.fromJson(data);

    // Calculate total amount for "Pending" status
    double totalPending = 0;
    for (var item in shippingHistory.data) {
      if (item.status == status) {
        totalPending += double.tryParse(item.amount) ?? 0;
      }
    }

    return totalPending;
  }
}
