import NMapsMap
import SwiftUI

struct WalkSelectView: View {
    var body: some View {
        VStack {
            Text("이런 코스를 추천해요!")
                .font(.title)
                .foregroundStyle(.onSurface)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
                .frame(height: 40)

            ZStack(alignment: .bottom) {
                NaverMap(coord: (126.9784147, 37.5666805))
                    .cornerRadius(20)

                CourseInfoContainer()
                    .padding(20)
            }
            Spacer()
                .frame(height: 8)

            CustomIndicator(currentIndex: 0)
            Spacer()
                .frame(height: 20)

            LargeButton(title: "산책 시작하기")
        }
        .surface()
    }
}

struct NaverMap: UIViewRepresentable {
    var coord: (Double, Double)

    func makeUIView(context: Context) -> NMFNaverMapView {
        let view = NMFNaverMapView()
        view.showZoomControls = false
        view.showScaleBar = false
        view.mapView.positionMode = .disabled
        view.mapView.zoomLevel = 17
        view.mapView.isScrollGestureEnabled = false
        view.mapView.isZoomGestureEnabled = false
        view.mapView.logoMargin = UIEdgeInsets(top: 0, left: 0, bottom: 153, right: 0)

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
    WalkSelectView()
}
