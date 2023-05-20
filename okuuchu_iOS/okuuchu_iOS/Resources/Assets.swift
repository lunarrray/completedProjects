// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let accentColor = ColorAsset(name: "AccentColor")
  internal static let darkBlue = ColorAsset(name: "darkBlue")
  internal static let lightBlue = ColorAsset(name: "lightBlue")
  internal static let lightGray = ColorAsset(name: "lightGray")
  internal static let normalTextColor = ColorAsset(name: "normalTextColor")
  internal static let primaryButtonsBlue = ColorAsset(name: "primaryButtonsBlue")
  internal static let primaryGrayBackground = ColorAsset(name: "primaryGrayBackground")
  internal static let redButton = ColorAsset(name: "redButton")
  internal static let secondaryBlueBackground = ColorAsset(name: "secondaryBlueBackground")
  internal static let textBackground = ColorAsset(name: "textBackground")
  internal static let textButton = ColorAsset(name: "textButton")
  internal static let textGrayColor = ColorAsset(name: "textGrayColor")
  internal static let textViewBackground = ColorAsset(name: "textViewBackground")
  internal static let transparentBlack = ColorAsset(name: "transparentBlack")
  internal static let white = ColorAsset(name: "white")
  internal static let aboutAppIcon = ImageAsset(name: "aboutAppIcon")
  internal static let addIcon = ImageAsset(name: "addIcon")
  internal static let avatarIcon = ImageAsset(name: "avatarIcon")
  internal static let backIcon = ImageAsset(name: "backIcon")
  internal static let biology = ImageAsset(name: "biology")
  internal static let boyAndPhoneImage = ImageAsset(name: "boyAndPhoneImage")
  internal static let cameraIcon = ImageAsset(name: "cameraIcon")
  internal static let checkmark = ImageAsset(name: "checkmark")
  internal static let chemistry = ImageAsset(name: "chemistry")
  internal static let contactsIcon = ImageAsset(name: "contactsIcon")
  internal static let doneIcon = ImageAsset(name: "doneIcon")
  internal static let emtyStarIcon = ImageAsset(name: "emtyStarIcon")
  internal static let english = ImageAsset(name: "english")
  internal static let feedbackBlack = ImageAsset(name: "feedback_black")
  internal static let fullStarIcon = ImageAsset(name: "fullStarIcon")
  internal static let geography = ImageAsset(name: "geography")
  internal static let geometry = ImageAsset(name: "geometry")
  internal static let german = ImageAsset(name: "german")
  internal static let germanLiterature = ImageAsset(name: "germanLiterature")
  internal static let halfStarIcon = ImageAsset(name: "halfStarIcon")
  internal static let history = ImageAsset(name: "history")
  internal static let homeIcon = ImageAsset(name: "homeIcon")
  internal static let invisibleIcon = ImageAsset(name: "invisibleIcon")
  internal static let kyrgyz = ImageAsset(name: "kyrgyz")
  internal static let kyrgyzLiterature = ImageAsset(name: "kyrgyzLiterature")
  internal static let logoImage = ImageAsset(name: "logoImage")
  internal static let logoutIcon = ImageAsset(name: "logoutIcon")
  internal static let math = ImageAsset(name: "math")
  internal static let messageIcon = ImageAsset(name: "messageIcon")
  internal static let neutralAvatarIcon = ImageAsset(name: "neutralAvatarIcon")
  internal static let physics = ImageAsset(name: "physics")
  internal static let programming = ImageAsset(name: "programming")
  internal static let rectangleIcon = ImageAsset(name: "rectangleIcon")
  internal static let russian = ImageAsset(name: "russian")
  internal static let russianLiterature = ImageAsset(name: "russianLiterature")
  internal static let saveIcon = ImageAsset(name: "saveIcon")
  internal static let savedIcon = ImageAsset(name: "savedIcon")
  internal static let searchIcon = ImageAsset(name: "searchIcon")
  internal static let shareIcon = ImageAsset(name: "shareIcon")
  internal static let turkish = ImageAsset(name: "turkish")
  internal static let visibleIcon = ImageAsset(name: "visibleIcon")
  internal static let avatarImg = ImageAsset(name: "avatarImg")
  internal static let girlAndInfoImage = ImageAsset(name: "girlAndInfoImage")
  internal static let girlAndPhoneImage = ImageAsset(name: "girlAndPhoneImage")
  internal static let informationScreenImage = ImageAsset(name: "informationScreenImage")
  internal static let leftBlueBalls = ImageAsset(name: "leftBlueBalls")
  internal static let leftBottomBalls = ImageAsset(name: "leftBottomBalls")
  internal static let leftWhiteBalls = ImageAsset(name: "leftWhiteBalls")
  internal static let lessonImage1 = ImageAsset(name: "lessonImage1")
  internal static let lessonImage2 = ImageAsset(name: "lessonImage2")
  internal static let mainIcon = ImageAsset(name: "mainIcon")
  internal static let menAvatar = ImageAsset(name: "menAvatar")
  internal static let rightBlueBalls = ImageAsset(name: "rightBlueBalls")
  internal static let rightBottomBalls = ImageAsset(name: "rightBottomBalls")
  internal static let searchingGirlImage = ImageAsset(name: "searchingGirlImage")
  internal static let videoWatchingGirlImage = ImageAsset(name: "videoWatchingGirlImage")
  internal static let walkingGirlImage = ImageAsset(name: "walkingGirlImage")
  internal static let womenAvatar = ImageAsset(name: "womenAvatar")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal private(set) lazy var swiftUIColor: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Color {
  init(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
