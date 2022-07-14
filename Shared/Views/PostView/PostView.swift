//
//  PostRow.swift
//  socialApp-Pepul (iOS)
//
//  Created by ramanathan.vadivel on 07/07/22.
//

import SwiftUI
import AVKit

struct PostView: View {
    var post: Post
    
    @State var player = AVPlayer()
    
    var body: some View {
        VStack(alignment: .leading) {
            if post.file_type == "1" {
                VideoPlayer(player: player)
                    .onAppear() {
                        player = AVPlayer(url:  URL(string: post.file ?? "")!)
                    }
                    .onDisappear() {
                        player.pause()
                    }.scaledToFit()
                    .frame(width: UIScreen.screenWidth * 0.9, height: 400)
            } else {
                AsyncImage(url: URL(string: post.file ?? "")){ image in
                    image.renderingMode(.original).resizable().aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                        .frame(width: UIScreen.screenWidth * 0.9, height: 400)
                }
            }
        }
    }
    

}

struct PostRow_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: ModelData().posts[0])
    }
}
