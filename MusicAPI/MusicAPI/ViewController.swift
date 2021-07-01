//
//  ViewController.swift
//  MusicAPI
//
//  Created by ANDY HUANG on 2021/6/28.
//

import UIKit
import StoreKit
import MediaPlayer
import MusicKit

class ViewController: UIViewController {
    
    private func requestMusicToken() {
        SKCloudServiceController().requestUserToken(forDeveloperToken: "eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiIsImtpZCI6IkhZNjQ4TjY1M1oifQ.eyJpc3MiOiI5MkEyNzdaREsyIiwiZXhwIjoxNjI0ODYzMDg3LCJpYXQiOjE2MjQ4MTk4ODd9.mpxbrNPSKRUfAHREiYAL4I0NGU53DTmGScLHNZ7BLDvCuM7iSl5viHS90Vl3vW62CiyXJ_-Fxrz-sW4NN0alUg") { token, error in
            print("token", token, error)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        SKCloudServiceController.requestAuthorization { [weak self] status in
            print(status)
            if status == .authorized {
                guard let self = self else { return }
                self.requestMusicToken()
            }
        }
    }


    private func getStoreFront(From data: Data) -> StoreFront? {
        let storeFront = StoreFront.toOption(From: data)
        return storeFront
    }
}
