//
//  STVError.swift
//  ios-UIAlertviewController-demo
//
//  Created by Eiji Kushida on 2018/06/14.
//  Copyright © 2018年 Eiji Kushida. All rights reserved.
//

import UIKit

enum STVError: String {
    
    /// リターンコード
    case required = "1001"
    case alreadyRegistered = "2001"
    
    /// アラートのタイトル
    var title: String {
        switch self {
        case .required:
            return ""
        case .alreadyRegistered:
            return "ユーザ登録失敗"
        }
    }
    
    /// アラートのメッセージ
    var message: String {
        
        switch self {
        case .required:
            return "必須パラメタが不足しています。"
        case .alreadyRegistered:
            return "すでに登録されています。"
        }
    }
    
    /// OKボタンだけを表示するアラートの表示
    ///
    /// - Parameters:
    ///   - viewController: 表示する画面
    ///   - okHandler: OKボタン押下時のアクション
    func showAlertDialogOK(_ viewController: UIViewController,
                         okHandler: ((UIAlertAction) -> Void)? = nil) {
        
        showAlertDialogOKAndCancel(viewController,
                                   okHandler: okHandler,
                                   cancelHandler: nil)
    }
    
    /// OKとCancelボタンだけを表示するアラートの表示
    ///
    /// - Parameters:
    ///   - viewController: 表示する画面
    ///   - okHandler: OKボタン押下時のアクション
    ///   - cancelHandler: Cancelボタン押下時のアクション
    func showAlertDialogOKAndCancel(_ viewController: UIViewController,
                           okHandler: ((UIAlertAction) -> Void)? = nil,
                           cancelHandler: ((UIAlertAction) -> Void)? = nil) {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "OK",
                                     style: .default,
                                     handler: okHandler)
        alert.addAction(okButton)
        
        if let cancelHandler = cancelHandler {
            let cancelButton = UIAlertAction(title: "Cancel",
                                             style: .cancel,
                                             handler: cancelHandler)
            alert.addAction(cancelButton)
        }
        viewController.present(alert,animated: true,completion: nil)
    }
}
