import NMapsMap
import SwiftUI

struct NaverMap: UIViewRepresentable {
    var coord: (Double, Double) = (127.0278, 37.59080)
    var positionMode: NMFMyPositionMode = .disabled
    var zoomLevel: Double = 17
    var isScrollGestureEnabled: Bool = true
    var isZoomGestureEnabled: Bool = true

    func makeUIView(context: Context) -> NMFNaverMapView {
        let view = NMFNaverMapView()
        view.showZoomControls = false
        view.showScaleBar = false
        view.mapView.positionMode = .disabled
        view.mapView.zoomLevel = zoomLevel
        view.mapView.isScrollGestureEnabled = isScrollGestureEnabled
        view.mapView.isZoomGestureEnabled = isZoomGestureEnabled
        view.mapView.logoAlign = .leftTop

        return view
    }

    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {
        let coord = NMGLatLng(lat: coord.1, lng: coord.0)
        let cameraUpdate = NMFCameraUpdate(scrollTo: coord)
        cameraUpdate.animation = .fly
        cameraUpdate.animationDuration = 1
        uiView.mapView.moveCamera(cameraUpdate)
    }
}

#Preview {
    NaverMap()
}
