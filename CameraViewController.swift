//
//  CameraViewController.swift
//  ICU Application
//
//  Created by Brandon Soukup on 10/25/19.
//  Copyright © 2019 Brandon Soukup. All rights reserved.
//

import UIKit
import Vision
import VisionKit

class CameraViewController: UIViewController, VNDocumentCameraViewControllerDelegate {

    let scannerViewController = VNDocumentCameraViewController()
    scannerViewController.delegate = self
    present(scannerViewController, animated: true)
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        for pageNumber in 0..<scan.pageCount {
            let image = scan.imageOfPage(at: pageNumber)
        }
        controller.dismiss(animated: true)
    }
    
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        controller.dismiss(animated: true)
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
        print(error)
        
        controller.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
