//
//  MediaManager.swift
//  SSMediaLibrary
//
//  Created by Devansh Vyas on 16/06/21.
//

import UIKit
import Combine
import QuickLook
import AVKit
import SafariServices

class MediaManager {
    var mediaUrl: URL?
    var mediaExtension: UTI?
    var sinkOperation: AnyCancellable?
    var localUrl: URL?
    
    private weak var topVC: UIViewController? {
        guard var topController = UIApplication.shared.windows.first?.rootViewController
        else { return nil }
        
        while let presentedViewController = topController.presentedViewController {
            topController = presentedViewController
        }
        return topController
    }
    
    var isAudioVideo: Bool {
        guard let mediaExtension = mediaExtension else {
            return false
        }
        
        switch mediaExtension {
        case .audiovisualContent, .movie, .video, .audio, .quickTimeMovie, .mpeg, .mpeg2Video, .mpeg2TransportStream,
                .mp3, .mpeg4, .mpeg4Audio, .appleProtectedMPEG4Audio, .appleProtectedMPEG4Video, .aviMovie,
                .audioInterchangeFileFormat, .waveformAudio, .midiAudio, .playlist, .m3UPlaylist:
            return true
        default:
            return false
        }
    }
    
    init(url: URL) {
        mediaUrl = url
        localUrl = url
        mediaExtension = UTI(withExtension: url.pathExtension)
    }
    
    func show() {
        guard let mediaUrl = mediaUrl else {
            return
        }
        if let filePath = getFileFromLocal() {
            localUrl = filePath
            openFile()
        } else {
            if isAudioVideo {
                openVideoPlayer()
            }
            if mediaExtension != .html {
                downloadFile(url: mediaUrl)
            }
        }
    }
    
    func getFileFromLocal() -> URL? {
        guard let fileName = mediaUrl?.lastPathComponent,
              var documentDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        else { return nil }
        documentDir.appendPathComponent(fileName)
        return FileManager.default.fileExists(atPath: documentDir.path) ? URL(fileURLWithPath: documentDir.path) : nil
    }
    
    func downloadFile(url: URL) {
        sinkOperation = URLSession.shared
            .downloadTaskPublisher(for: url)
            .sink(receiveCompletion: { completion in
                print("Sink completion: \(completion)")
            }) { value in
                print("Sink value: \(value.url)")
                DispatchQueue.main.async {
                    self.localUrl = value.url
                    if !self.isAudioVideo {
                        self.openFile()
                    }
                }
            }
    }
    
    func openFile() {
        guard let mediaExtension = mediaExtension else {
            return
        }
        switch mediaExtension {
        case .html:
            openHtml()
            
        case .audiovisualContent, .movie, .video, .audio, .quickTimeMovie, .mpeg, .mpeg2Video, .mpeg2TransportStream,
                .mp3, .mpeg4, .mpeg4Audio, .appleProtectedMPEG4Audio, .appleProtectedMPEG4Video, .aviMovie,
                .audioInterchangeFileFormat, .waveformAudio, .midiAudio, .playlist, .m3UPlaylist:
            openVideoPlayer()
            
        default:
            openWithQuickLook()
        }
    }
    
    func openHtml() {
        guard let url = mediaUrl else { return }
        print("===>> \(url)")
        let vc = SFSafariViewController(url: url)
        topVC?.present(vc, animated: true)
    }
    
    func openVideoPlayer() {
        guard let localUrl = localUrl else {
            return
        }
        let player = AVPlayer(url: localUrl)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        topVC?.present(playerViewController, animated: true) {
            playerViewController.player?.play()
        }
    }
    
    func openWithQuickLook() {
        let previewController = QLPreviewController()
        previewController.dataSource = self
        topVC?.present(previewController, animated: true, completion: nil)
    }
}

extension MediaManager: QLPreviewControllerDataSource {
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        print("===> \(String(describing: localUrl))")
        guard let url = localUrl else {
            fatalError()
        }
        return url as QLPreviewItem
    }
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
}
