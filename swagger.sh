rm -r MarvelApp/swagger/Marvel
SwagGen generate marvel.yaml --destination PruebaTecnica/swagger/Marvel --option name:MarvelClient
pod install