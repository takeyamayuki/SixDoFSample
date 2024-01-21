//
//  ARViewContainer.swift
//  SixDoFSample
//
//  Created by 武山侑輝 on 2024/01/20.
//

import SwiftUI

struct ARViewContainer: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ARViewController {
        return ARViewController()
    }

    func updateUIViewController(_ uiViewController: ARViewController, context: Context) {}
}
