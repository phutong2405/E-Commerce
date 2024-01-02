import 'package:ecom_app_2411/model/product_model.dart';
import 'package:ecom_app_2411/model/purchase_product.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AppEvent {
  const AppEvent();
}

class InitialEvent implements AppEvent {
  const InitialEvent();
}

class TapToItemEvent implements AppEvent {
  final Product product;

  const TapToItemEvent({
    required this.product,
  });
}

class FilterTappedEvent implements AppEvent {
  final String filterName;
  const FilterTappedEvent({
    required this.filterName,
  });
}

class FavoriteTappedEvent implements AppEvent {
  final Iterable<Product> entries;
  const FavoriteTappedEvent({required this.entries});
}

enum ControlBarItem {
  like,
  save,
  share,
  cart,
}

Map<ControlBarItem, String> mapControlBarItem = {
  ControlBarItem.like: "heart",
  ControlBarItem.save: "star",
  ControlBarItem.share: "done",
  ControlBarItem.cart: "cartdone"
};

class ControlBarTappedEvent implements AppEvent {
  final Product item;
  final ControlBarItem itemType;

  const ControlBarTappedEvent({required this.itemType, required this.item});
}

class CartDetailTappedEvent implements AppEvent {
  final List<Purchase> purchases;
  final String type;

  CartDetailTappedEvent({
    required this.purchases,
    required this.type,
  });
}

class CheckOutTappedEvent implements AppEvent {
  final List<Purchase> purchase;

  CheckOutTappedEvent({
    required this.purchase,
  });
}

class PlaceOrdersTappedEvent implements AppEvent {
  final List<Purchase> purchases;

  PlaceOrdersTappedEvent({
    required this.purchases,
  });
}

class OtherDetailTappedEvent implements AppEvent {
  final List<Product> products;
  final String type;

  const OtherDetailTappedEvent({
    required this.products,
    required this.type,
  });
}

class LoadMoreProductsEvent implements AppEvent {
  final int lengthToSkip;
  final String filterName;

  const LoadMoreProductsEvent(
      {required this.lengthToSkip, required this.filterName});
}

class RefreshPageEvent implements AppEvent {
  const RefreshPageEvent();
}

// class TranslateTappedEvent implements AppEvent {
//   const TranslateTappedEvent();
// }

// class SettingsTappedEvent implements AppEvent {
//   const SettingsTappedEvent();
// }

// class ChatTappedEvent implements AppEvent {
//   const ChatTappedEvent();
// }

// @immutable
// abstract class DetailItemEvent implements AppEvent {
//   const DetailItemEvent();
// }

// class FavoriteButtonTappedEvent implements DetailItemEvent {
//   final ModalType type;
//   final DictionaryEntry entry;
//   const FavoriteButtonTappedEvent({
//     required this.entry,
//     required this.type,
//   });
// }

// class CopyButtonTappedEvent implements DetailItemEvent {
//   final DictionaryEntry entry;
//   const CopyButtonTappedEvent({
//     required this.entry,
//   });
// }

// class ShareButtonTappedEvent implements DetailItemEvent {
//   final DictionaryEntry entry;
//   const ShareButtonTappedEvent({
//     required this.entry,
//   });
// }

// class AskButtonTappedEvent implements DetailItemEvent {
//   final DictionaryEntry entry;
//   const AskButtonTappedEvent({
//     required this.entry,
//   });
// }

// class DeleteAllEvent implements DetailItemEvent {
//   const DeleteAllEvent();
// }

// enum SwitchType { darkMode, simpleMode, autoLookup, languages }

// class SettingsChangesEvent implements AppEvent {
//   final dynamic data;
//   final SwitchType type;
//   const SettingsChangesEvent({required this.type, required this.data});
// }

// class LanguageChoicesChangesEvent implements AppEvent {
//   final String id;
//   LanguageChoicesChangesEvent({required this.id});
// }

// class SearchingEvent implements AppEvent {
//   final String value;
//   const SearchingEvent({required this.value});
// }

// class LogInEvent implements AppEvent {
//   const LogInEvent();
// }

// class LogInButtonEvent implements AppEvent {
//   final String email;
//   final String password;
//   const LogInButtonEvent({required this.email, required this.password});
// }
