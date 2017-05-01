//
//  ViewController.swift
//  youtube_iframe_sample
//
//  Created by masudayuichi on 2017/04/27.
//  Copyright © 2017年 masudayuichi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBAction func reload(_ sender: Any) {
        self.main_webview.reload()
    }
    @IBOutlet weak var main_webview: UIWebView!
    var view_width: Float = 0.0
    var view_height: Float = 0.0
    var id: String = "\"KKgTyHr3a58\""
    var request_timer: Timer!
    var request : URLRequest?
    let youtube_request_url: String = "https://www.youtube.com/embed/"
    @IBAction func skip_button(_ sender: Any) {
        main_webview.stringByEvaluatingJavaScript(from: "Skip();")
    }
    @IBAction func back_button(_ sender: Any) {
        main_webview.stringByEvaluatingJavaScript(from: "Back();")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = Bundle.main.path(forResource: "html/youtube_sample2", ofType: "html")
        let urlreq = URL(string: url!)
        let req = URLRequest(url: urlreq!)
        request = req
        view_width = Float(main_webview.frame.width)
        view_height = Float(main_webview.frame.height)
        main_webview.delegate = self
        print(view_width)
        print(view_height)
        main_webview.scrollView.isScrollEnabled = false
        main_webview.scrollView.bounces = false
        main_webview.allowsInlineMediaPlayback = true
        main_webview.loadRequest(req)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var shouldAutorotate: Bool {
        get {
            return true
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .landscape
        }
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        if (request.url?.absoluteString.range(of: "nativecall")) != nil {
            print("nativecallを発見しました。ここでネイティブコールを実行します。");
            print(request.url)
            main_webview.stringByEvaluatingJavaScript(from: "SetPlayer(\(Int(view_width)), \(Int(view_height)), \(id));")
            return false;
        }

        if String(describing: request.url!).hasPrefix(youtube_request_url) {
            print("マッチングしたのでスルー")
        }
        else if String(describing: request.url!).hasPrefix("http") ||
            String(describing: request.url!).hasPrefix("https") {
            UIApplication.shared.open(request.url!)
            return false;
        }
//        
        return true
    }
    
    func webView(webView: UIWebView,
                 shouldStartLoadWithRequest request: NSURLRequest,
                 navigationType: UIWebViewNavigationType) -> Bool {
        
        if(navigationType == UIWebViewNavigationType.linkClicked){
            UIApplication.shared.openURL(request.url!)
            return false
        }
        
        return true
    }
    
    
//    func webViewDidFinishLoad(_ webView: UIWebView) {
//        print("loaded!!!")
//        if CheckCompleteLoading() {
//            // UIWebView object has fully loaded.
//        print("finish!!!")
//        } else {
//            request_timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.CheckCompleteLoading), userInfo: nil, repeats: true)
//        }
//    }
//    
//    func CheckCompleteLoading() -> Bool {
//        if (main_webview.stringByEvaluatingJavaScript(from: "document.readyState") == "complete") {
//            if request_timer != nil && request_timer.isValid {
//              request_timer.invalidate()
//            }
//            print("ok")
//            main_webview.stringByEvaluatingJavaScript(from: "SetPlayer(\(Int(view_width)), \(Int(view_height)), \(id));")
//            return true
//        } else {
//            return false
//        }
//    }
    
    




}
