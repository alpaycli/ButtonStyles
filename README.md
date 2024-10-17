# ButtonStyles

ButtonStyles is a simple, reusable Swift package for creating custom button styles using SwiftUI. Currently, it includes the DuolingoButtonStyle, a 3D button style similar to used in Duolingo app.

![](https://github.com/alpaycli/ButtonStyles/blob/main/DuolingoStylePreview.mov)

## Features

- Setting background color.
- Supports `ButtonRole` parameter.
- Disabled state.

## Installation

#### Requirements

- iOS 15.0+

#### Via Swift Package Manager

- Go to File > Add Package Dependencies...
- Paste https://github.com/alpaycli/ButtonStyles.git
- Select the version and add the package to your project.

## Usage

### Basic Usage
```Swift
import SwiftUI

Button("Tap Me") {}
    .buttonStyle(.duolingo(color: .green))
    .foregroundStyle(.white)
    .padding()
```

### Different states

```Swift
    VStack(spacing: 20) {
        Button("Tap Me") {}
            .buttonStyle(.duolingo(color: .green))
        
        Button("Tap Me", role: .destructive) {}
            .buttonStyle(.duolingo(color: .green))
        
        Button("Tap Me", role: .destructive) {}
            .buttonStyle(.duolingo(color: .green))
            .disabled(true)
        
    }
    .padding()
    .foregroundStyle(.white)
```

![](https://github.com/alpaycli/ButtonStyles/blob/main/DuolingoStyleStatesPrev.mov)

## License

ButtonStyles is available under the MIT license. See the LICENSE file for more info.

## Contributions

Contributions are welcome! If you have any suggestions or improvements, please create an issue or submit a pull request.
