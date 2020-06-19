import SwiftUI

struct UIViewWrapper: UIViewRepresentable {
  let contentView: UIView
  let containerView = UIView()

  func makeUIView(context: Context) -> UIView {
    containerView.backgroundColor = UIColor(red: 0.92, green: 0.92, blue: 0.92, alpha: 1.00)

    containerView.addSubview(contentView)
    var constraints: [NSLayoutConstraint] = []
    constraints += [
      contentView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      contentView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
    ]
    NSLayoutConstraint.activate(constraints)

    return containerView
  }

  func updateUIView(_ uiView: UIView, context: Context) {
  }
}
