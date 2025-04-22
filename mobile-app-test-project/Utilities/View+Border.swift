//
//  View+Border.swift
//  mobile-app-test-project
//
//  Created by Aji Prakosa on 22/4/25.
//

import Foundation
import SwiftUI

public extension View {
    func background(
        color: Color,
        borderColor: Color = .clear,
        cornerRadius: CGFloat = 0,
        lineWidth: CGFloat = 1
    ) -> some View {
        background(
            RoundedRectangle(cornerRadius: cornerRadius)
                .strokeBorder(borderColor, lineWidth: lineWidth)
                .background(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(color)
                )
        )
    }
}
