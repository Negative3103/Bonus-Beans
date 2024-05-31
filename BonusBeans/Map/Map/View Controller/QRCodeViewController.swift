//
//  QRCodeViewController.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit

final class QRCodeViewController: UIViewController, AlertViewController, ViewSpecificController {
    
    //MARK: - Root View
    typealias RootView = QRCodeView
    
    //MARK: - Services
    internal var coordinator: MapCoordinator?
    
    //MARK: - Attributes
    
    //MARK: - Actions
    
    //MARK: - Lifecycles
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettigns()
        
        guard UserDefaults.standard.bool(forKey: "hasSubs") else { return }
        view().qrCodeImageView.image = generateQRCode(key: "HELLO BOSS!")
        view().stackView.isHidden = false
        view().codeLabel.text = "ВАШ КОД: - HELLO BOSS"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

//MARK: - Other funcs
extension QRCodeViewController {
    private func appearanceSettigns() {

    }
    
    private func generateQRCode(key: String) -> UIImage? {
        let nameData = key.data(using: String.Encoding.ascii)
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(nameData, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 6, y: 6)
            if let output = filter.outputImage?.transformed(by: transform){
                return UIImage(ciImage: output)
            }
        }
        return nil
    }
}
