## TESTAPP

- As mentioned on the interview target iOS15 was picked, so new SwiftUI features couldnt be used (Deprecated modifiers like foregroundColor have been avoided)
- Created using MVVM architecture
- Managers added for data handling from API and DB
- NetworkMonitor added for handling connection changes and offline mode.
- Some Unit Tests added for testing offline mode
- Developed on portrait mode only with system colors and fonts (dark mode supported)
- Random videos added from [this repo][l1] locally
- DB implemented using RealmSwift package
- Mocked data used from the [JsonPlaceholder api][l2]
- Async await approach implemented for asynchronous calls
- AVKit VideoPlayer have been used for showing the video
- AsyncImage without disk image caching was implemented, this could be improved with external libraries

### To Impove:

- Developing a custom VideoPlayer must be implemented, it will allow more flexibility and controll over the video. The recomended apporach is to create a UIViewController with an AVPlayerViewController exposed to SwiftUI with a UIViewRepresentable.
- Localizable String Variables could be added
- Error handling could be improve
- Generics could be used if more views are added, especially to the Banner
- More UITests can be added

  [l1]: https://gist.github.com/poudyalanil/ca84582cbeb4fc123a13290a586da925
  [l2]: https://jsonplaceholder.typicode.com
