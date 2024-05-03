import 'dart:async';

import 'package:graduation_mobile/helper/api.dart';
import 'package:graduation_mobile/models/has_id.dart';
import 'package:graduation_mobile/models/completed_device_model.dart';
import 'package:graduation_mobile/models/customer_model.dart';
import 'package:graduation_mobile/models/device_model.dart';
import 'package:graduation_mobile/models/order_model.dart';
import 'package:graduation_mobile/models/permission_model.dart';
import 'package:graduation_mobile/models/user_model.dart';
import 'package:graduation_mobile/models/service_model.dart';

class CrudController<T extends HasId> {
  CrudController();

  Future<List<T>?> getAll(Map<String, dynamic>? queryParams) async {
    try {
      String? table = getTable<T>();
      final Map<String, dynamic> response =
          await Api().get(path: 'api/$table', queryParams: queryParams);
      final body = response['body'];
      if (body is List) {
        final items = body.map((itemData) => _fromJson<T>(itemData)).toList();
        return items.cast<T>(); 
      } else {
        print('Error: expected the body to be a List');
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<T?> getById(int id, Map<String, dynamic>? queryParams) async {
    String? table = getTable<T>();
    final dynamic response =
        await Api().get(path: 'api/$table/$id', queryParams: queryParams);
    if (response == null) {
      return null;
    }
    final T item = _fromJson<T>(response);
    return item;
  }

  Future<T?> create(T item) async {
    try {
      String? table = getTable<T>();
      final body = _toJson<T>(item);
      final dynamic response =
          await Api().post(path: "/api/$table", body: body);
      if (response == null) {
        return null;
      }
      T addedItem = response.containsKey('user')
          ? _fromJson<T>(response['user'])
          : response.containsKey('client')
              ? _fromJson<T>(response['client'])
              : _fromJson<T>(response);

      return addedItem;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<T?> update(int id, Map<String, dynamic> body) async {
    String? table = getTable<T>();
    final dynamic response =
        await Api().put(path: 'api/$table', id: id, body: body);
    if (response != null) {
      final T updatedItem = _fromJson<T>(response);
      return updatedItem;
    }
    return null;
  }

  Future<void> delete(int id) async {
    String? table = getTable<T>();
    await Api().delete(path: 'api/$table', id: id);
  }

  T _fromJson<T>(Map<String, dynamic> json) {
    final modelFactories = <Type, Function>{
      Device: (json) => Device.fromJson(json),
      User: (json) => User.fromJson(json),
      CompletedDevice: (json) => CompletedDevice.fromJson(json),
      Permission: (json) => Permission.fromJson(json),
      Service: (json) => Service.fromJson(json),
      Order: (json) => Order.fromJson(json),
      Customer: (json) => Customer.fromJson(json),
    };

    final factoryFunction = modelFactories[T];
    if (factoryFunction != null) {
      return factoryFunction(json) as T;
    }
    throw Exception('Unknown model type');
  }

  String getTable<T>() {
    final modelFactories = <Type, String>{
      Device: Device.table,
      User: User.table,
      CompletedDevice: CompletedDevice.table,
      Permission: Permission.table,
      Service: Service.table,
      Order: Order.table,
      Customer: Customer.table,
    };

    final factoryTable = modelFactories[T];
    if (factoryTable != null) {
      return factoryTable;
    }
    throw Exception('Unknown model type');
  }

  Map<String, dynamic> _toJson<T>(T item) {
    if (item is User) {
      return (item as User).toJson();
    } else if (item is Device) {
      return (item as Device).toJson();
    } else if (item is CompletedDevice) {
      return (item as CompletedDevice).toJson();
    } else if (item is Permission) {
      return (item as Permission).toJson();
    } else if (item is Service) {
      return (item as Service).toJson();
    } else if (item is Order) {
      return (item as Order).toJson();
    } else if (item is Customer) {
      return (item as Customer).toJson();
    }

    throw Exception('Unknown model type');
  }
}
