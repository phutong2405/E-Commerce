import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ecom_app_2411/bloc/app_bloc_event.dart';
import 'package:ecom_app_2411/bloc/app_bloc_state.dart';
import 'package:ecom_app_2411/model/product_model.dart';
import 'package:ecom_app_2411/model/purchase_product.dart';
import 'package:ecom_app_2411/repo/fetch_product_data.dart';
import 'package:ecom_app_2411/repo/local_data.dart';
import 'package:share_plus/share_plus.dart';

const String url2 = 'https://dummyjson.com/products?limit=100';
const String url = 'http://127.0.0.1:5500/lib/json/product_data.json';

class AppBloc extends Bloc<AppEvent, AppState> {
  late Iterable<Product> dataInBloc;
  late Iterable<Product> dataInBlocFiltered = [];
  late List<String> items;
  late String filterName;
  AppBloc() : super(const InitialState()) {
    on<InitialEvent>(initialEvent);

    on<TapToItemEvent>(tapToItemEvent);

    on<FavoriteTappedEvent>(favoriteTappedEvent);
    on<ControlBarTappedEvent>(controlBarTappedEvent);

    on<CartDetailTappedEvent>(cartDetailTappedEvent);
    on<OtherDetailTappedEvent>(otherDetailTappedEvent);

    on<CheckOutTappedEvent>(checkOutTappedEvent);
    on<PlaceOrdersTappedEvent>(placeOrdersTappedEvent);

    on<FilterTappedEvent>(filterTappedEvent);

    on<LoadMoreProductsEvent>(loadMoreProductsEvent);
    on<RefreshPageEvent>(refreshPageEvent);
  }

  FutureOr<void> initialEvent(
      InitialEvent event, Emitter<AppState> emit) async {
    emit(const LoadingState());

    filterName = "everything";
    LocalData.instance().initial();
    favList =
        LocalData.instance().getData(dataType: LocalDataType.favoritedProducts);
    saveList =
        LocalData.instance().getData(dataType: LocalDataType.savedProducts);
    dataInBloc = await FetchProduct.instance().initialFetchProduct(url2);
    items = List.generate(
      3,
      (index) => '',
    );
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        emit(LoadedState(data: dataInBloc));
      },
    );
  }

  FutureOr<void> favoriteTappedEvent(
      FavoriteTappedEvent event, Emitter<AppState> emit) {}

  FutureOr<void> tapToItemEvent(TapToItemEvent event, Emitter<AppState> emit) {
    bool isFavorited = favList.contains(
      event.product,
    );
    bool isSaved = saveList.contains(
      event.product,
    );
    emit(
      TapToItemState(
        product: event.product,
        isFavorited: isFavorited,
        isSaved: isSaved,
      ),
    );
    emit(const OutState());
  }

  FutureOr<void> controlBarTappedEvent(
      ControlBarTappedEvent event, Emitter<AppState> emit) {
    Duration duration;
    switch (event.itemType) {
      case ControlBarItem.cart:
        duration = const Duration(seconds: 2, milliseconds: 0);
        LocalData.instance().addData(
          dataType: LocalDataType.purchase,
          product: event.item,
        );
        break;

      case ControlBarItem.like:
        duration = const Duration(
          seconds: 1,
          milliseconds: 100,
        );
        // LocalData.instance().addData(
        //   dataType: LocalDataType.favoritedProducts,
        //   product: event.item,
        // );
        break;

      case ControlBarItem.save:
        duration = const Duration(seconds: 1, milliseconds: 500);
        // LocalData.instance().addData(
        //   dataType: LocalDataType.savedProducts,
        //   product: event.item,
        // );
        break;

      case ControlBarItem.share:
        duration = const Duration(seconds: 0, milliseconds: 0);
        Share.share('Hello Welcome to Logz',
            subject: '${event.item.title} - \$${event.item.actualPrice}');
        break;
      default:
        duration = const Duration(
          seconds: 0,
          milliseconds: 100,
        );
    }

    emit(
      ControlBarTappedState(
        animateIconString: mapControlBarItem[event.itemType]!,
        duration: duration,
      ),
    );
  }

  FutureOr<void> cartDetailTappedEvent(
      CartDetailTappedEvent event, Emitter<AppState> emit) {
    emit(
      CartDetailTappedState(
        purchase: event.purchases,
        type: event.type,
      ),
    );
  }

  FutureOr<void> filterTappedEvent(
      FilterTappedEvent event, Emitter<AppState> emit) async {
    filterName = event.filterName;
    items.clear();
    emit(const FilterTappedState());
    if (filterName == "everything") {
      await Future.delayed(
        const Duration(
          milliseconds: 500,
        ),
        () {
          dataInBlocFiltered = dataInBloc;
        },
      );
    } else {
      dataInBlocFiltered = await FetchProduct.instance().fetchProduct(
          url: 'https://dummyjson.com/products/category/$filterName',
          lengthToSkip: 0);
    }
    if (dataInBlocFiltered.length < 10) {
      items.addAll(
        List.generate(
          dataInBlocFiltered.length,
          (index) => '',
        ),
      );
    } else {
      items.addAll(
        List.generate(
          5,
          (index) => '',
        ),
      );
    }
    emit(LoadedState(data: dataInBlocFiltered));
  }

  FutureOr<void> loadMoreProductsEvent(
      LoadMoreProductsEvent event, Emitter<AppState> emit) {}

  FutureOr<void> refreshPageEvent(
      RefreshPageEvent event, Emitter<AppState> emit) {}

  FutureOr<void> otherDetailTappedEvent(
      OtherDetailTappedEvent event, Emitter<AppState> emit) {
    emit(
      OtherDetailTappedState(
        products: event.products,
        type: event.type,
      ),
    );
  }

  FutureOr<void> checkOutTappedEvent(
      CheckOutTappedEvent event, Emitter<AppState> emit) {
    emit(
      CheckOutTappedState(purchase: event.purchase),
    );
  }

  FutureOr<void> placeOrdersTappedEvent(
      PlaceOrdersTappedEvent event, Emitter<AppState> emit) {
    LocalData localData = LocalData.instance();
    localData.updateProgress(
      fromProgress: Progress.inCart,
      toProgress: Progress.inDelivery,
      purchaseList: event.purchases,
    );
    emit(LoadedState(data: dataInBloc));
    emit(const PlaceOrdersTappedState());
  }
}
