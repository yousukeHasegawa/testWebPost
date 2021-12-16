//
//  ViewController.swift
//  testWebPost
//
//  Created by Yousuke Hasegawa on 2021/12/16.
//

import UIKit

class ViewController: UIViewController {
    

    @IBAction func tappedTestButton(_ sender: Any) {
        postMessage("テスト投稿")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func postMessage(_ text:String){
        //Todo 入力メッセージを元に投稿するメッセージを作成
        let newMessage = WebMessage(id: nil, text: text)
        print("サーバにポストします")
        print(newMessage.text)
        //メッセージを投稿
        WebAPIClient.postMessage(webMessage: newMessage){[weak self] result in
            
            switch result {
            case .success(let message):
                print("\(message)を保存しました。")
            case .failure(let error):
                print("\(error)のエラーになりました。")
            }
            
        }

    }


}

