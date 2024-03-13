import SwiftUI


struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    @State var showingProfile = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List{
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                        
                }
             
            }
            .animation(.interactiveSpring, value: modelData.landmarks)
            .navigationTitle("Landmarks")
            .toolbar{
                Button{
                    showingProfile.toggle()
                }label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
        } detail: {
            Text("Select a Landmark")
        }.sheet(isPresented: $showingProfile){
            ProfileHost()
                .environment(ModelData())
        }
    }
}


#Preview {
    LandmarkList()
        .environment(ModelData())
}
