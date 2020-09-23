//
//  WebView.swift
//  IOSDevJobs
//
//  Created by Роенко Денис on 11.09.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//

import SwiftUI
import WebKit

class WebViewController: UIViewController {
    lazy var webview: WKWebView = WKWebView()
    lazy var progressbar: UIProgressView = UIProgressView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.webview.frame = self.view.frame
        self.view.addSubview(self.webview)

        self.view.addSubview(self.progressbar)
        self.progressbar.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraints([
            self.progressbar.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.progressbar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.progressbar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])

        self.progressbar.progress = 0.1
        webview.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
    }

    // MARK: - Web view progress
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        switch keyPath {
        case "estimatedProgress":
            if self.webview.estimatedProgress >= 1.0 {
                UIView.animate(withDuration: 0.3, animations: { () in
                    self.progressbar.alpha = 0.0
                }, completion: { finished in
                    self.progressbar.setProgress(0.0, animated: false)
                })
            } else {
                self.progressbar.isHidden = false
                self.progressbar.alpha = 1.0
                progressbar.setProgress(Float(self.webview.estimatedProgress), animated: true)
            }
        default:
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
}

struct WebView: UIViewControllerRepresentable {
    let url: String
    

    func makeUIViewController(context: Context) -> WebViewController {
        let webviewController = WebViewController()
        guard let url = URL(string: self.url) else { return webviewController }

        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        webviewController.webview.load(request)

        return webviewController
    }

    func updateUIViewController(_ webviewController: WebViewController, context: Context) {
        guard let url = URL(string: self.url) else { return }
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        webviewController.webview.load(request)
    }
}


struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url: "https://forms.gle/f1SEG8kQCcEAxVTCA")
    }
}
