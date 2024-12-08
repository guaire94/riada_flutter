// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:riada/src/features/common/datasource/base_firestore_data_source.dart'
    as _i28;
import 'package:riada/src/features/common/datasource/google_place_data_source.dart'
    as _i130;
import 'package:riada/src/features/common/datasource/local/env_configuration_data_source.dart'
    as _i131;
import 'package:riada/src/features/common/datasource/sport_data_source.dart'
    as _i684;
import 'package:riada/src/features/common/repository/google_place_repository.dart'
    as _i497;
import 'package:riada/src/features/common/repository/sport_repository.dart'
    as _i987;
import 'package:riada/src/features/drawer/presentation/bloc/drawer_bloc.dart'
    as _i738;
import 'package:riada/src/features/event/datasource/event_data_source.dart'
    as _i1025;
import 'package:riada/src/features/event/helper/distance_helper.dart' as _i769;
import 'package:riada/src/features/event/presentation/details/bloc/event_details_bloc.dart'
    as _i560;
import 'package:riada/src/features/event/presentation/list/bloc/event_list_bloc.dart'
    as _i793;
import 'package:riada/src/features/event/repository/event_repository.dart'
    as _i162;
import 'package:riada/src/features/home/presentation/bloc/home_bloc.dart'
    as _i835;
import 'package:riada/src/features/marketplace/presentation/carousel/bloc/marketplace_carousel_bloc.dart'
    as _i876;
import 'package:riada/src/features/marketplace/presentation/list/bloc/marketplace_bloc.dart'
    as _i281;
import 'package:riada/src/features/marketplace/repository/marketplace_carousel_repository.dart'
    as _i1062;
import 'package:riada/src/features/user/datasource/apple_sign_in_data_source.dart'
    as _i926;
import 'package:riada/src/features/user/datasource/auth_data_source.dart'
    as _i1056;
import 'package:riada/src/features/user/datasource/google_sign_in_data_source.dart'
    as _i500;
import 'package:riada/src/features/user/datasource/notifications_data_source.dart'
    as _i898;
import 'package:riada/src/features/user/datasource/phone_number_sign_in_data_source.dart'
    as _i488;
import 'package:riada/src/features/user/datasource/user_data_source.dart'
    as _i795;
import 'package:riada/src/features/user/presentation/additional_profile_information/bloc/additional_profile_information_bloc.dart'
    as _i217;
import 'package:riada/src/features/user/presentation/forget_password/bloc/forget_password_bloc.dart'
    as _i38;
import 'package:riada/src/features/user/presentation/my_profile/bloc/my_profile_bloc.dart'
    as _i161;
import 'package:riada/src/features/user/presentation/sign_up/bloc/sign_up_bloc.dart'
    as _i6;
import 'package:riada/src/features/user/presentation/update_additional_profile_information/bloc/update_additional_profile_information_bloc.dart'
    as _i903;
import 'package:riada/src/features/user/repository/auth_repository.dart'
    as _i807;
import 'package:riada/src/features/user/repository/city_repository.dart'
    as _i514;
import 'package:riada/src/features/user/repository/notifications_repository.dart'
    as _i1070;
import 'package:riada/src/features/user/repository/phone_number_verification_repository.dart'
    as _i372;
import 'package:riada/src/features/user/repository/user_repository.dart'
    as _i45;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i926.AppleSignInDataSource>(
        () => _i926.AppleSignInDataSource());
    gh.factory<_i488.PhoneNumberSignInDataSource>(
        () => _i488.PhoneNumberSignInDataSource());
    gh.factory<_i1056.AuthDataSource>(() => _i1056.AuthDataSource());
    gh.factory<_i500.GoogleSignInDataSource>(
        () => _i500.GoogleSignInDataSource());
    gh.factory<_i769.DistanceHelper>(() => _i769.DistanceHelper());
    gh.singleton<_i514.CityRepository>(() => _i514.CityRepository());
    gh.factory<_i281.MarketplaceBloc>(() =>
        _i281.MarketplaceBloc(cityRepository: gh<_i514.CityRepository>()));
    gh.factory<_i807.AuthRepository>(() => _i807.AuthRepository(
          authDataSource: gh<_i1056.AuthDataSource>(),
          googleSignInDataSource: gh<_i500.GoogleSignInDataSource>(),
          appleSignInDataSource: gh<_i926.AppleSignInDataSource>(),
        ));
    gh.factory<_i131.EnvConfigurationDataSource>(() =>
        _i131.EnvConfigurationDataSource(
            configuration: gh<_i131.EnvConfiguration>()));
    gh.factory<_i130.GooglePlaceDataSource>(() => _i130.GooglePlaceDataSource(
        configurationDataSource: gh<_i131.EnvConfigurationDataSource>()));
    gh.factory<_i898.NotificationsDataSource>(() =>
        _i898.NotificationsDataSource(
            envConfigurationDataSource:
                gh<_i131.EnvConfigurationDataSource>()));
    gh.factory<_i795.UserDataSource>(() => _i795.UserDataSource(
        envConfigurationDataSource: gh<_i131.EnvConfigurationDataSource>()));
    gh.factory<_i28.BaseFirestoreDataSource>(() => _i28.BaseFirestoreDataSource(
        envConfigurationDataSource: gh<_i131.EnvConfigurationDataSource>()));
    gh.factory<_i684.SportDataSource>(() => _i684.SportDataSource(
        envConfigurationDataSource: gh<_i131.EnvConfigurationDataSource>()));
    gh.factory<_i372.PhoneNumberVerificationRepository>(() =>
        _i372.PhoneNumberVerificationRepository(
            phoneNumberSignInDataSource:
                gh<_i488.PhoneNumberSignInDataSource>()));
    gh.factory<_i497.GooglePlaceRepository>(() => _i497.GooglePlaceRepository(
        dataSource: gh<_i130.GooglePlaceDataSource>()));
    gh.factory<_i45.UserRepository>(() => _i45.UserRepository(
          userDataSource: gh<_i795.UserDataSource>(),
          authDataSource: gh<_i1056.AuthDataSource>(),
        ));
    gh.factory<_i38.ForgetPasswordBloc>(() =>
        _i38.ForgetPasswordBloc(authRepository: gh<_i807.AuthRepository>()));
    gh.factory<_i903.UpdateAdditionalProfileInformationBloc>(() =>
        _i903.UpdateAdditionalProfileInformationBloc(
            gh<_i45.UserRepository>()));
    gh.factory<_i1070.NotificationsRepository>(() =>
        _i1070.NotificationsRepository(
            notificationsDataSource: gh<_i898.NotificationsDataSource>()));
    gh.factory<_i738.DrawerBloc>(
        () => _i738.DrawerBloc(userRepository: gh<_i45.UserRepository>()));
    gh.factory<_i161.MyProfileBloc>(
        () => _i161.MyProfileBloc(userRepository: gh<_i45.UserRepository>()));
    gh.factory<_i217.AdditionalProfileInformationBloc>(() =>
        _i217.AdditionalProfileInformationBloc(
            userRepository: gh<_i45.UserRepository>()));
    gh.singleton<_i987.SportRepository>(
        () => _i987.SportRepository(gh<_i684.SportDataSource>()));
    gh.factory<_i6.SignUpBloc>(() => _i6.SignUpBloc(
          authRepository: gh<_i807.AuthRepository>(),
          phoneNumberVerificationRepository:
              gh<_i372.PhoneNumberVerificationRepository>(),
          userRepository: gh<_i45.UserRepository>(),
        ));
    gh.factory<_i1025.EventDataSource>(() => _i1025.EventDataSource(
          envConfigurationDataSource: gh<_i131.EnvConfigurationDataSource>(),
          distanceHelper: gh<_i769.DistanceHelper>(),
        ));
    gh.factory<_i835.HomeBloc>(() => _i835.HomeBloc(
          userRepository: gh<_i45.UserRepository>(),
          notificationsRepository: gh<_i1070.NotificationsRepository>(),
          sportRepository: gh<_i987.SportRepository>(),
        ));
    gh.factory<_i1062.MarketplaceCarouselRepository>(
        () => _i1062.MarketplaceCarouselRepository(
              eventDataSource: gh<_i1025.EventDataSource>(),
              authDataSource: gh<_i1056.AuthDataSource>(),
              cityRepository: gh<_i514.CityRepository>(),
              sportRepository: gh<_i987.SportRepository>(),
            ));
    gh.factory<_i162.EventRepository>(() =>
        _i162.EventRepository(eventDataSource: gh<_i1025.EventDataSource>()));
    gh.factory<_i560.EventDetailsBloc>(() =>
        _i560.EventDetailsBloc(eventRepository: gh<_i162.EventRepository>()));
    gh.factory<_i793.EventListBloc>(() =>
        _i793.EventListBloc(eventRepository: gh<_i162.EventRepository>()));
    gh.factory<_i876.MarketplaceCarouselBloc>(() =>
        _i876.MarketplaceCarouselBloc(
            marketplaceCarouselRepository:
                gh<_i1062.MarketplaceCarouselRepository>()));
    return this;
  }
}
