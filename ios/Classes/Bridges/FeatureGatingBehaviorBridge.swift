import Flutter
import SuperwallKit

extension FeatureGatingBehavior {
  func toJson() -> String {
    switch self {
      case .gated:
        return "gated"
      case .nonGated:
        return "nonGated"
    }
  }
}
