import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String price(Object price) {
    return 'AED $price';
  }

  @override
  String range_price(Object highPrice, Object lowPrice) {
    return 'AED $lowPrice à $highPrice';
  }

  @override
  String get form_price => 'Prix (AED):';

  @override
  String get total => 'Total';

  @override
  String get city_placeholder_dubai => 'Dubai';

  @override
  String get city_placeholder_abu_dhabi => 'Abu Dhabi';

  @override
  String get city_placeholder_sharjah => 'Sharjah';

  @override
  String get drawer_home => 'Accueil';

  @override
  String get drawer_guest => 'Invité';

  @override
  String get drawer_events => 'Events';

  @override
  String get drawer_profile => 'Mon profil';

  @override
  String get full_name => 'Nom complet';

  @override
  String get city => 'Ville';

  @override
  String get email => 'Email';

  @override
  String get phone => 'Téléphone';

  @override
  String get field_required_error_message => 'Le champ est requis';

  @override
  String get size_required_error_message => 'Sélectionnez au moins une taille';

  @override
  String get follow => 'Suivre';

  @override
  String get unfollow => 'Ne plus suivre';

  @override
  String get share => 'Partager';

  @override
  String get ok => 'OK';

  @override
  String get yes => 'Oui';

  @override
  String get no => 'Non';

  @override
  String get add => 'Ajouter';

  @override
  String get skip => 'Passer';

  @override
  String get change => 'Changer';

  @override
  String get update => 'Mettre à jour';

  @override
  String get delete => 'Supprimer';

  @override
  String get disable => 'Désactiver';

  @override
  String get logout => 'Se déconnecter';

  @override
  String get save => 'Enregistrer';

  @override
  String get select_year => 'Sélectionner une année';

  @override
  String get see_all => 'Voir tout';

  @override
  String get cancel => 'Annuler';

  @override
  String get common_error_title => 'Erreur technique : demande impossible à traiter';

  @override
  String get common_error_message => 'Nous nous excusons, mais votre demande ne peut pas être traitée pour le moment en raison d\'une erreur technique. Notre équipe a été informée du problème et travaille à le résoudre dès que possible. Veuillez réessayer plus tard ou contacter notre équipe de support pour obtenir de l\'aide. Merci pour votre patience et votre compréhension.';

  @override
  String get common_empty_message => 'There is no data to display';

  @override
  String get signup_title => 'Profil';

  @override
  String get signup_phone_number => 'Numéro de téléphone';

  @override
  String get signup_button => 'S\'inscrire';

  @override
  String get inactive_account_title => 'Compte inactif';

  @override
  String get inactive_account_message => 'Votre compte est actuellement inactif. Veuillez contacter le support pour obtenir de l\'aide.';

  @override
  String get additional_profile_information_title => 'S\'inscrire';

  @override
  String get additional_profile_information_label_profile => 'Photo de profil';

  @override
  String get additional_profile_information_label_you_are => 'Vous êtes :';

  @override
  String get delete_account => 'Supprimer le compte';

  @override
  String get delete_account_message => 'Voulez-vous vraiment supprimer votre compte ?';

  @override
  String get login_title => 'Se connecter';

  @override
  String get login_error_title => 'Échec de la connexion';

  @override
  String get login_error_message => 'Nous sommes désolés, mais nous n\'avons pas pu vous connecter.\nCela peut être dû à une erreur dans la saisie de votre email ou de votre mot de passe. Si vous avez oublié votre mot de passe, vous pouvez le réinitialiser en cliquant sur le bouton \'mot de passe oublié\'.';

  @override
  String get login_form_email => 'Email';

  @override
  String get login_form_password => 'Mot de passe';

  @override
  String get login_form_validation_button => 'Se connecter';

  @override
  String login_form_forget_password(Object clickable) {
    return 'Mot de passe oublié ? #$clickable# pour le réinitialiser';
  }

  @override
  String get login_form_forget_password_clickable => 'Cliquez ici';

  @override
  String get forget_password_title => 'Mot de passe oublié';

  @override
  String get forget_password_information_message => 'Vous recevrez des instructions de réinitialisation du mot de passe à l\'adresse email que vous allez entrer ci-dessous';

  @override
  String get forget_password_form_email => 'Email';

  @override
  String get forget_password_form_validation_button => 'Réinitialiser';

  @override
  String get forget_password_error_title => 'Échec de la réinitialisation du mot de passe';

  @override
  String get forget_password_error_message => 'Une erreur s\'est produite lors de l\'envoi du lien de réinitialisation. Veuillez réessayer';

  @override
  String get my_profile_title => 'Profil';

  @override
  String get my_profile_informations => 'Informations';

  @override
  String get my_profile_privacy_policy => 'Politique de confidentialité';

  @override
  String get my_profile_cgv => 'CGV';

  @override
  String get phone_number_verification_title => 'Se connecter avec le numéro de téléphone';

  @override
  String get phone_number_verification_verify => 'Vérifier';

  @override
  String get phone_number_verification_invalid_phone_number_title => 'Numéro de téléphone invalide';

  @override
  String get phone_number_verification_invalid_phone_number_message => 'Assurez-vous que le numéro de téléphone est valide';

  @override
  String get phone_number_verification_invalid_code_title => 'Code invalide';

  @override
  String get phone_number_verification_invalid_code_message => 'Assurez-vous que le code que vous entrez est valide';

  @override
  String get phone_number_verification_code => 'Entrez le code SMS';

  @override
  String get coming_soon_title => 'Bientôt disponible';

  @override
  String get coming_soon_message => 'Vous pourrez bientôt utiliser cette fonctionnalité';

  @override
  String get marketplace_title_with_no_user => 'Bienvenue !';

  @override
  String marketplace_title_with_user(Object user) {
    return 'Bon retour, $user !';
  }

  @override
  String get marketplace_list_section_title => 'Liste';
}
