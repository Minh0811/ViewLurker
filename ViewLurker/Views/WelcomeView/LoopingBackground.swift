import SwiftUI
import AVKit

struct VideoPlayerView: UIViewControllerRepresentable {
    var videoURL: URL
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let playerViewController = AVPlayerViewController()

        if let playerItem = AVPlayerItem(url: videoURL) as AVPlayerItem? {
            let player = AVQueuePlayer(playerItem: playerItem)
            context.coordinator.player = player // Keep a reference to the player
            
            playerViewController.player = player
            playerViewController.showsPlaybackControls = false
            playerViewController.videoGravity = .resizeAspectFill
            player.volume = 0.0 // Mute the video sound
            
            // Enable looping seamlessly
            let playerLooper = AVPlayerLooper(player: player, templateItem: playerItem)
            context.coordinator.playerLooper = playerLooper // Keep a reference to the playerLooper
            
            player.play()
        }
        
        return playerViewController
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator {
        var playerLooper: AVPlayerLooper?
        var player: AVQueuePlayer? // Reference to the AVQueuePlayer
        
        deinit {
            // Ensure the player is paused when the coordinator is deallocated.
            player?.pause()
        }
    }
}

struct LoopingBackground: View {
    var body: some View {
        // Safely try to get the video URL
        if let videoURL = Bundle.main.url(forResource: "Welcome-background", withExtension: "mp4") {
            VideoPlayerView(videoURL: videoURL)
                .edgesIgnoringSafeArea(.all)
        } else {
            Text("Error loading video.")
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct LoopingBackground_Previews: PreviewProvider {
    static var previews: some View {
        LoopingBackground()
    }
}
