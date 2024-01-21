//
//  ARViewController.swift
//  SixDoFSample
//
//  Created by 武山侑輝 on 2024/01/20.
//

import ARKit
import SceneKit

class ARViewController: UIViewController, ARSCNViewDelegate, ARSessionDelegate {

    var sceneView: ARSCNView!
    var initialTransform: simd_float4x4?

    override func viewDidLoad() {
        super.viewDidLoad()

        sceneView = ARSCNView(frame: self.view.bounds)
        self.view.addSubview(sceneView)

        sceneView.session.delegate = self
        sceneView.scene = SCNScene()

        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        sceneView.session.pause()
    }

    @objc(session:didUpdateFrame:) func session(_ session: ARSession, didUpdate frame: ARFrame) {
        let currentTransform = frame.camera.transform

        if initialTransform == nil {
            initialTransform = currentTransform
        }

        if let initialTransform = initialTransform {
            // 座標の変化とクオータニオンの計算
            let initialPosition = initialTransform.columns.3
            let currentPosition = currentTransform.columns.3
            let deltaPosition = currentPosition - initialPosition
            let deltaQuaternion = simd_quaternion(currentTransform)

            print("座標移動量: Δx = \(deltaPosition.x), Δy = \(deltaPosition.y), Δz = \(deltaPosition.z), クオータニオン: qw = \(deltaQuaternion.vector.w), qx = \(deltaQuaternion.vector.x), qy = \(deltaQuaternion.vector.y), qz = \(deltaQuaternion.vector.z)")
        }
    }
}

extension simd_float4x4 {
    var rotation: simd_quatf {
        return simd_quaternion(self)
    }
}
