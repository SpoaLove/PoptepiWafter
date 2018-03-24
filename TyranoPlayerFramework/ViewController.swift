//
//  ViewController.swift
//  TyranoPlayerFramework
//
//  Created by ShikemokuMK on 2016/11/29.
//  Copyright © 2016年 ShikemokuMK. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate {

    var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        UIApplication.shared.isIdleTimerDisabled = true

        // WebViewを生成する
        self.webView = self.createWebView()
        
        //UA設定
        let ua = webView.stringByEvaluatingJavaScript(from: "navigator.userAgent")
        let add_ua = " tyranoplayer-ios"
        let insert_ua = ua! + add_ua
        
        let agentDict = ["UserAgent":insert_ua]
        UserDefaults.standard.register(defaults: agentDict)

        
        // サブビューを追加する
        self.view.addSubview(self.webView!)
        
        let path = Bundle.main.path(forResource: "game/index", ofType: "html")
        
        var lineIndex = 1
        var html = ""
        
        var sav_files = [String]()
        
        let libraryDir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] ;
        let destPath = libraryDir;
        
        //セーブファイルがある場合は読み込み。
        var save_text = ""
        do {
            
            let manager = FileManager.default
            let list = try manager.contentsOfDirectory(atPath: destPath)
            for path in list {
                
                if(path.contains(".sav")){
                    sav_files.append(path)
                }
                
            }
            
            
        } catch {
            print("error")
        }
        
        if let data = try? Data(contentsOf: URL(fileURLWithPath: path!)){
            
            let str = String(NSString(data: data, encoding: String.Encoding.utf8.rawValue)!)
            
            str.enumerateLines{
                line, stop in
                
                if line.contains("</head>") {
                    
                    let targetURL = Bundle.main.path(forResource: "tyrano_player", ofType: "js");
                    html+="<script type='text/javascript' src='"+targetURL!+"' ></script>\n"
                    
                    html+="<script>window.player_base_path='';</script>\n"
                    html+="<script>window.tyrano_save={};</script>\n"
                    
                    do{
                        for file_path in sav_files {
                            
                            save_text = try String(contentsOfFile: destPath+"/"+file_path, encoding: String.Encoding.utf8)
                            
                            let key_str = file_path.replacingOccurrences(of: ".sav", with: "")
                            
                            html+="<script>window.tyrano_save['"+key_str+"']=\""+save_text+"\";</script>\n"
                        }
                        
                    }catch{
                        
                    }
                    
                }
                
                html += line + "\n"
                
                lineIndex += 1
                
            }
            
            
        }else{
            print("error ティラノゲームが適切に配置されていません");
        }
        
        //webviewの設定
        webView.delegate = self;
        webView.allowsInlineMediaPlayback = true
        webView.mediaPlaybackRequiresUserAction = false
        
        
        URLCache.shared.removeAllCachedResponses()
        URLCache.shared.diskCapacity = 0
        URLCache.shared.memoryCapacity = 0
        
        let gestureToLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.backPlayer))
        gestureToLeft.direction = UISwipeGestureRecognizerDirection.right
        //gestureToLeft.numberOfTouchesRequired = 1
        self.webView.addGestureRecognizer(gestureToLeft)
        
        
        let base_url = URL(string: path!)
        self.webView!.loadHTMLString(html, baseURL:base_url)
        
        
    }
    
    func createWebView() -> UIWebView {
        // UIWebViewのインスタンスを生成
        let _webView = UIWebView()
        
        // 全画面表示にする
        _webView.frame = self.view.bounds
        
        return _webView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backPlayer(){
        
        let alert: UIAlertController = UIAlertController(title: "タイトルへ戻る", message: "終了してよろしいですね？セーブしていない場合、進捗は破棄されます", preferredStyle:  UIAlertControllerStyle.alert)
        
        let defaultAction: UIAlertAction = UIAlertAction(title: "はい", style: UIAlertActionStyle.default, handler:{
            // ボタンが押された時の処理を書く（クロージャ実装）
            (action: UIAlertAction!) -> Void in
            
            self.loadView()
            self.viewDidLoad()
            
        })
        
        // キャンセルボタン
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertActionStyle.cancel, handler:{
            // ボタンが押された時の処理を書く（クロージャ実装）
            (action: UIAlertAction!) -> Void in
            print("Cancel")
        })
        
        // ③ UIAlertControllerにActionを追加
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        
        // ④ Alertを表示
        present(alert, animated: true, completion: nil)
        
        
    }
    
    let kSchemeSave = "tyranoplayer-save://";
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if let url = request.url?.absoluteString {
            if url.hasPrefix(kSchemeSave) {
                
                print ("SAVE")
                
                let json_str = url.substring(from: url.range(of: kSchemeSave)!.upperBound)
                
                let array_str = json_str.components(separatedBy: "&")
                
                let json_str_key = array_str[0].replacingOccurrences(of: "?key=", with: "")
                let json_str_val = array_str[1].replacingOccurrences(of: "data=", with: "")
                
                
                do {
                    
                    let libraryDir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0];
                    
                    let destPath = libraryDir;//展開するディレクトリのパス
                    
                    let filePath = destPath+"/"+json_str_key+".sav"
                    
                    
                    print("SAVEPATH:"+filePath);
                    print("\n---------------------------\n");
                    
                    try json_str_val.write(toFile: filePath, atomically: true, encoding: String.Encoding.utf8)
                    
                    
                } catch {
                    print("EEEEEEEEEEEEEEE")
                    //print(localizedDescription)
                }
                
                
            }else if(url.hasPrefix("tyranoplayer-back://")){
                
                backPlayer();
                
            }else if(url.hasPrefix("tyranoplayer-web://")){
                
                let str = url.substring(from: url.range(of: "tyranoplayer-web://")!.upperBound)
                let url_str = str.replacingOccurrences(of: "?url=", with: "")
                print(url_str);
                
                let url = URL(string:url_str)!
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url)
                }
                
                
            }
        }
        return true
    }

    override var prefersStatusBarHidden : Bool {
        return true
    }



}

