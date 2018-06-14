//
//  ViewController.swift
//  ios-UIAlertviewController-demo
//
//  Created by Eiji Kushida on 2018/06/14.
//  Copyright © 2018年 Eiji Kushida. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBAction func didTapOKAlert(_ sender: UIButton) {
        
        //APIなどから返却されたエラーコード
        let retuncode = "1001"
        
        guard let error = STVError(rawValue: retuncode) else {
            fatalError("不正なエラーコード")
        }
        error.showAlertDialogOK(self) { _ in
            print("OKのときの処理")
        }
    }
    
    @IBAction func didTapOKAndCancelAlert(_ sender: UIButton) {
        
        //APIなどから返却されたエラーコード
        let retuncode = "2001"
        
        guard let error = STVError(rawValue: retuncode) else {
            fatalError("不正なエラーコード")
        }
        
        error.showAlertDialogOKAndCancel(self, okHandler: { _ in
            print("OKのときの処理")
        }) { _ in
            print("Cancelのときの処理")
        }
    }
}

