//
//  YoutubePlayer
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 3/23/24.
//

import Foundation
import WebKit

class YoutubePlayer: UIView {
	
	private lazy var webView: WKWebView = {
		let webView = WKWebView()
		webView.backgroundColor = .clear
		webView.scrollView.backgroundColor = .clear
		webView.scrollView.isScrollEnabled = false
		return webView
	}()
	
	required init?(coder: NSCoder) { nil }
	
	init() {
		super.init(frame: .zero)
		
		setupWebView()
	}
	
}

extension YoutubePlayer {
	
	private func setupWebView() {
		webView.translatesAutoresizingMaskIntoConstraints = false
		addSubview(webView)
		
		NSLayoutConstraint.activate([
		
			webView.widthAnchor.constraint(equalTo: widthAnchor),
			webView.heightAnchor.constraint(equalTo: heightAnchor),
			webView.centerXAnchor.constraint(equalTo: centerXAnchor),
			webView.centerYAnchor.constraint(equalTo: centerYAnchor)
			
		])
	}
	
}

extension YoutubePlayer {
	
	func load(videoId: String) {
		let html = buildHtml(for: videoId)
		webView.loadHTMLString(html, baseURL: nil)
	}
	
	private func buildHtml(for videoId: String) -> String {
		"""
		<style>
			html, body, iframe {
				margin: 0 !important;
				padding: 0 !important;
				backgroundColor: transparent !important;
			}
		</style>
		<iframe width="100%" height="100%" src="https://www.youtube.com/embed/\(videoId)" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		"""
	}
	
}
