////
////  PreviewState.swift
////  Example
////
////  Created by Nick Trienens on 3/25/25.
////
//
//import SwiftUI
//
//struct PreviewState: NamedPreviewState {
//    internal init(colorScheme: ColorScheme, dynamicFontSize: DynamicTypeSize, name: String? = nil) {
//        self.colorScheme = colorScheme
//        self.dynamicFontSize = dynamicFontSize
//        if let name {
//            self.name = name
//        } else {
//            self.name = "_\(colorScheme)_\(Int(dynamicFontSize.percentageIncreaseFromMedium*100))"
//        }
//    }
//    
//    let colorScheme: ColorScheme
//    let dynamicFontSize: DynamicTypeSize
//    let name: String
//    
//    
//    static func all(named: String? = nil) -> [PreviewState] {
//        DynamicTypeSize.allCases.map {
//            return [ PreviewState(colorScheme: .light, dynamicFontSize: $0),
//                     PreviewState(colorScheme: .dark, dynamicFontSize: $0)
//                    ]
//        }
//        
//        .flatMap({ $0 })
//
//    }
//}
//
//extension DynamicTypeSize {
//    /// Returns the percentage increase from `.medium` as a value like 1.0 (100%), 1.3 (130%), etc.
//    var percentageIncreaseFromMedium: CGFloat {
//        switch self {
//        case .xSmall:          return 0.82
//        case .small:           return 0.88
//        case .medium:          return 1.0
//        case .large:           return 1.12
//        case .xLarge:          return 1.23
//        case .xxLarge:         return 1.35
//        case .xxxLarge:        return 1.47
//        case .accessibility1:  return 1.61
//        case .accessibility2:  return 1.76
//        case .accessibility3:  return 1.94
//        case .accessibility4:  return 2.12
//        case .accessibility5:  return 2.35
//        @unknown default:
//            return 1.0
//        }
//    }
//}
