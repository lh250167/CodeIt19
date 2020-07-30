# swagger.api.CatalogApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *https://virtserver.swaggerhub.com/codeit19/catalog/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**searchInventory**](CatalogApi.md#searchInventory) | **GET** /catalog | searches inventory


# **searchInventory**
> List<Product> searchInventory(searchString, skip, limit)

searches inventory

By passing in the appropriate options, you can search for available inventory in the system 

### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new CatalogApi();
var searchString = searchString_example; // String | pass an optional search string for looking up inventory
var skip = 56; // int | number of records to skip for pagination
var limit = 56; // int | maximum number of records to return

try { 
    var result = api_instance.searchInventory(searchString, skip, limit);
    print(result);
} catch (e) {
    print("Exception when calling CatalogApi->searchInventory: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **searchString** | **String**| pass an optional search string for looking up inventory | [optional] 
 **skip** | **int**| number of records to skip for pagination | [optional] 
 **limit** | **int**| maximum number of records to return | [optional] 

### Return type

[**List<Product>**](Product.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

