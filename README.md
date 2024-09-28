# template

A new Flutter Template project.

## Versioning

### Flutter
'''
3.22.2
'''

### Dart
'''
2.19.1
'''

### Xcode
'''
15.3.0
'''

## Generate  

### L10N
'''
flutter gen-l10n 
'''

### Routes, assets, di and json serializers  
'''
dart run build_runner build --delete-conflicting-output
'''

## Set up

### Configure firebase

#### Prod
'''
Create prod environnement, named it "ProjectName" from firebase console
Set up authentication to accept email and phone auth
Set up cloud firestore
Set up storage features
'''

'''
Download google-services.json from firebase console and place it in android/app/src/prod
Download GoogleService-Info.plist from firebase console and place it in ios/config/prod and ios/Runner/
Modify lib/firebase/prod/firebase_options.dart to match prod environnement
Modify lib/firebase_options.dart to match prod environnement
'''

#### Staging
'''
Create prod environnement, named it "ProjectName-Staging" from firebase console
Set up authentication to accept email and phone auth
Set up cloud firestore
Set up storage features
'''

'''
Download google-services.json from firebase console and place it in android/app/src/staging
Download GoogleService-Info.plist from firebase console and place it in ios/Runner/config/staging
Modify lib/firebase/staging/firebase_options.dart to match staging environnement
'''

### Change logo
'''
Update home feature to change logo
Update marketplace to change logo
Update sign_up to background
'''
