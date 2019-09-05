import Foundation

struct NasaPhotos: Codable {
    var photos: [PhotosInfo]
    struct PhotosInfo: Codable {
        var id: Int
        var sol: Int
        var camera: CameraInfo
        var img_src: String
        var earth_date: String
        var rover: RoverInfo
        
        struct CameraInfo: Codable {
            var id: Int
            var name: String
            var rover_id: Int
            var full_name: String
        }
        
        struct RoverInfo: Codable {
            var id: Int
            var name: String
            var landing_date: String
            var launch_date: String
            var status: String
            var max_sol: Int
            var max_date: String
            var total_photos: Int
            var cameras: [CamerasInfo]
            
            struct CamerasInfo: Codable {
                var name: String
                var full_name: String
            }
        }
        
        
    }
}


