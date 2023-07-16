// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "7b9316a171df6178cf0a56eb47c8734c"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: MinapDBEntry.self)
  }
}