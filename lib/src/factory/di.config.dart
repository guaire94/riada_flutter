// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:template_flutter_app/src/features/common/datasource/google_place_data_source.dart'
    as _i23;
import 'package:template_flutter_app/src/features/common/datasource/local/env_configuration_data_source.dart'
    as _i10;
import 'package:template_flutter_app/src/features/common/repository/google_place_repository.dart'
    as _i24;
import 'package:template_flutter_app/src/features/drawer/presentation/bloc/drawer_bloc.dart'
    as _i12;
import 'package:template_flutter_app/src/features/home/presentation/bloc/home_bloc.dart'
    as _i30;
import 'package:template_flutter_app/src/features/list/datasource/product_data_source.dart'
    as _i9;
import 'package:template_flutter_app/src/features/list/presentation/details/bloc/details_bloc.dart'
    as _i27;
import 'package:template_flutter_app/src/features/list/presentation/list/bloc/list_bloc.dart'
    as _i28;
import 'package:template_flutter_app/src/features/list/repository/product_repository.dart'
    as _i20;
import 'package:template_flutter_app/src/features/marketplace/presentation/carousel/bloc/marketplace_carousel_bloc.dart'
    as _i21;
import 'package:template_flutter_app/src/features/marketplace/presentation/list/bloc/marketplace_bloc.dart'
    as _i13;
import 'package:template_flutter_app/src/features/marketplace/repository/marketplace_carousel_repository.dart'
    as _i19;
import 'package:template_flutter_app/src/features/user/datasource/apple_sign_in_data_source.dart'
    as _i4;
import 'package:template_flutter_app/src/features/user/datasource/auth_data_source.dart'
    as _i6;
import 'package:template_flutter_app/src/features/user/datasource/google_sign_in_data_source.dart'
    as _i7;
import 'package:template_flutter_app/src/features/user/datasource/notifications_data_source.dart'
    as _i3;
import 'package:template_flutter_app/src/features/user/datasource/phone_number_sign_in_data_source.dart'
    as _i5;
import 'package:template_flutter_app/src/features/user/datasource/user_data_source.dart'
    as _i8;
import 'package:template_flutter_app/src/features/user/presentation/additional_profile_information/bloc/additional_profile_information_bloc.dart'
    as _i17;
import 'package:template_flutter_app/src/features/user/presentation/forget_password/bloc/forget_password_bloc.dart'
    as _i22;
import 'package:template_flutter_app/src/features/user/presentation/my_profile/bloc/my_profile_bloc.dart'
    as _i16;
import 'package:template_flutter_app/src/features/user/presentation/sign_up/bloc/sign_up_bloc.dart'
    as _i31;
import 'package:template_flutter_app/src/features/user/presentation/update_additional_profile_information/bloc/update_additional_profile_information_bloc.dart'
    as _i29;
import 'package:template_flutter_app/src/features/user/repository/auth_repository.dart'
    as _i18;
import 'package:template_flutter_app/src/features/user/repository/notifications_repository.dart'
    as _i26;
import 'package:template_flutter_app/src/features/user/repository/phone_number_verification_repository.dart'
    as _i25;
import 'package:template_flutter_app/src/features/user/repository/user_repository.dart'
    as _i11;
import 'package:template_flutter_app/src/features/user/usecase/get_user_city_usecase.dart'
    as _i15;
import 'package:template_flutter_app/src/features/user/usecase/get_user_country_usecase.dart'
    as _i14;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.NotificationsDataSource>(
        () => _i3.NotificationsDataSource());
    gh.factory<_i4.AppleSignInDataSource>(() => _i4.AppleSignInDataSource());
    gh.factory<_i5.PhoneNumberSignInDataSource>(
        () => _i5.PhoneNumberSignInDataSource());
    gh.factory<_i6.AuthDataSource>(() => _i6.AuthDataSource());
    gh.factory<_i7.GoogleSignInDataSource>(() => _i7.GoogleSignInDataSource());
    gh.factory<_i8.UserDataSource>(() => _i8.UserDataSource());
    gh.factory<_i9.ProductDataSource>(() => _i9.ProductDataSource());
    gh.factory<_i10.EnvConfigurationDataSource>(() =>
        _i10.EnvConfigurationDataSource(
            configuration: gh<_i10.EnvConfiguration>()));
    gh.factory<_i11.UserRepository>(() => _i11.UserRepository(
          userDataSource: gh<_i8.UserDataSource>(),
          authDataSource: gh<_i6.AuthDataSource>(),
        ));
    gh.factory<_i12.DrawerBloc>(
        () => _i12.DrawerBloc(userRepository: gh<_i11.UserRepository>()));
    gh.factory<_i13.MarketplaceBloc>(
        () => _i13.MarketplaceBloc(userRepository: gh<_i11.UserRepository>()));
    gh.factory<_i14.GetUserCountryUseCase>(() =>
        _i14.GetUserCountryUseCase(userRepository: gh<_i11.UserRepository>()));
    gh.factory<_i15.GetUserCityUseCase>(() =>
        _i15.GetUserCityUseCase(userRepository: gh<_i11.UserRepository>()));
    gh.factory<_i16.MyProfileBloc>(
        () => _i16.MyProfileBloc(userRepository: gh<_i11.UserRepository>()));
    gh.factory<_i17.AdditionalProfileInformationBloc>(() =>
        _i17.AdditionalProfileInformationBloc(
            userRepository: gh<_i11.UserRepository>()));
    gh.factory<_i18.AuthRepository>(() => _i18.AuthRepository(
          authDataSource: gh<_i6.AuthDataSource>(),
          googleSignInDataSource: gh<_i7.GoogleSignInDataSource>(),
          appleSignInDataSource: gh<_i4.AppleSignInDataSource>(),
        ));
    gh.factory<_i19.MarketplaceCarouselRepository>(() =>
        _i19.MarketplaceCarouselRepository(
            productDataSource: gh<_i9.ProductDataSource>()));
    gh.factory<_i20.ProductRepository>(() =>
        _i20.ProductRepository(productDataSource: gh<_i9.ProductDataSource>()));
    gh.factory<_i21.MarketplaceCarouselBloc>(() => _i21.MarketplaceCarouselBloc(
        marketplaceCarouselRepository:
            gh<_i19.MarketplaceCarouselRepository>()));
    gh.factory<_i22.ForgetPasswordBloc>(() =>
        _i22.ForgetPasswordBloc(authRepository: gh<_i18.AuthRepository>()));
    gh.factory<_i23.GooglePlaceDataSource>(() => _i23.GooglePlaceDataSource(
        configurationDataSource: gh<_i10.EnvConfigurationDataSource>()));
    gh.factory<_i24.GooglePlaceRepository>(() => _i24.GooglePlaceRepository(
        dataSource: gh<_i23.GooglePlaceDataSource>()));
    gh.factory<_i25.PhoneNumberVerificationRepository>(() =>
        _i25.PhoneNumberVerificationRepository(
            phoneNumberSignInDataSource:
                gh<_i5.PhoneNumberSignInDataSource>()));
    gh.factory<_i26.NotificationsRepository>(() => _i26.NotificationsRepository(
        notificationsDataSource: gh<_i3.NotificationsDataSource>()));
    gh.factory<_i27.DetailsBloc>(() =>
        _i27.DetailsBloc(productRepository: gh<_i20.ProductRepository>()));
    gh.factory<_i28.ListBloc>(
        () => _i28.ListBloc(productRepository: gh<_i20.ProductRepository>()));
    gh.factory<_i29.UpdateAdditionalProfileInformationBloc>(() =>
        _i29.UpdateAdditionalProfileInformationBloc(gh<_i11.UserRepository>()));
    gh.factory<_i30.HomeBloc>(() => _i30.HomeBloc(
          userRepository: gh<_i11.UserRepository>(),
          notificationsRepository: gh<_i26.NotificationsRepository>(),
        ));
    gh.factory<_i31.SignUpBloc>(() => _i31.SignUpBloc(
          authRepository: gh<_i18.AuthRepository>(),
          phoneNumberVerificationRepository:
              gh<_i25.PhoneNumberVerificationRepository>(),
          userRepository: gh<_i11.UserRepository>(),
        ));
    return this;
  }
}
