//
//  CleanDetailRouter.swift
//  tutorial-app
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 4.09.2023.
//
//
import Foundation

import UIKit

protocol DetailRoutingLogic {
    func returnToHome()
}

protocol DetailDataPassing {
    var dataStore: MovieDetailDataStore? { get }
}

class CleanDetailRouter: NSObject, DetailRoutingLogic, DetailDataPassing {

    weak var viewController: CleanDetailViewController?
    var dataStore: MovieDetailDataStore?

    func returnToHome() {
        print("router.returnToHome() invoked")
        viewController?.dismiss(animated: true, completion: nil)
    }
}
