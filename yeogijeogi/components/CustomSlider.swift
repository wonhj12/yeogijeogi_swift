import SwiftUI
import UIKit

class CustomHeightSlider: UISlider {
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.trackRect(forBounds: bounds)
        rect.size.height = 8
        return rect
    }
}

struct CustomSlider: UIViewRepresentable {
    @Binding var value: Double

    func makeUIView(context: Context) -> UISlider {
        let slider = CustomHeightSlider(frame: .zero)

        slider.minimumTrackTintColor = .surface
        slider.maximumTrackTintColor = .surface
        slider.minimumValue = -5.0
        slider.maximumValue = 5.0

        slider.setThumbImage(UIImage(systemName: "circle.fill")?
            .withTintColor(.primaryGreen, renderingMode: .alwaysOriginal)
            .resized(to: CGSize(width: 16, height: 16)),
            for: .normal)

        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged(_:)),
            for: .valueChanged
        )

        return slider
    }

    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.setValue(Float(value), animated: true)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value, step: 1)
    }

    class Coordinator: NSObject {
        @Binding var value: Double
        var step: Double

        init(value: Binding<Double>, step: Double) {
            self._value = value
            self.step = step
        }

        @objc func valueChanged(_ sender: UISlider) {
            let roundedValue = round(Double(sender.value) / step) * step
            sender.value = Float(roundedValue)
            value = roundedValue
        }
    }
}

extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
