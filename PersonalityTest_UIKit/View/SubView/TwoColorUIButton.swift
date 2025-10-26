//
//  GradientButton.swift
//  PersonalityTest_UIKit
//
//  Created by 陳嘉國
//
// A custom UIButton subclass featuring a two-color vertical gradient,
// adjustable border, and animated brightness when pressed.
//


import UIKit

class TwoColorUIButton: UIButton {

    // MARK: - Gradient Properties
    private let gradientLayer = CAGradientLayer()
    
    // Top color of the vertical gradient.
    var topColor: UIColor = UIColor(hex: "#33B94D") {
        didSet { updateGradientColors() }
    }
    
    // Bottom color of the vertical gradient.
    var bottomColor: UIColor = UIColor(hex: "#009432") {
        didSet { updateGradientColors() }
    }
    
    // MARK: - Text & Style
    // Font size of the button label.
    var fontSize: CGFloat = 24 {
        didSet { titleLabel?.font = UIFont.systemFont(ofSize: fontSize, weight: .black) }
    }
    // Corner radius of the button.
    var cornerRadius: CGFloat = 25 {
        didSet { layer.cornerRadius = cornerRadius }
    }
    // Width of the stroke outline around text.
    var strokeWidth : CGFloat = 0 {
         didSet {
             updateStrokeWidth()
        }
    }
    // Color of the text stroke.
    var strokeColor : UIColor = UIColor.black {
        didSet {
            updateStrokeWidth()
       }
    }
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    // MARK: - Setup
    // Initialization
    private func setup() {
        addTarget(self, action: #selector(touchDown), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(touchUp), for: [.touchUpInside, .touchCancel, .touchDragExit])

        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: fontSize, weight: .black)
        layer.cornerRadius = 25
        layer.masksToBounds = true
        

        gradientLayer.colors = [
            topColor.cgColor,
            topColor.cgColor,
            bottomColor.cgColor,
            bottomColor.cgColor
        ]
        gradientLayer.locations = [0, 0.5, 0.5, 1]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)

        updateGradientColors()

        layer.insertSublayer(gradientLayer, at: 0)

        // Border setup
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor

        translatesAutoresizingMaskIntoConstraints = false
        
    }

    // MARK: - Stroke Effect
    private func updateStrokeWidth() {
        
        setup()
        
        if strokeWidth > 0 {
            
            let offsets = [
                CGSize(width: strokeWidth, height: 0),
                CGSize(width: -strokeWidth, height: 0),
                CGSize(width: 0, height: strokeWidth),
                CGSize(width: 0, height: -strokeWidth),
                CGSize(width: 0, height: 0)
            ]
            
            // 產生 shadow labels
            for i in 0..<offsets.count {
                let shadowLabel = UILabel()
                shadowLabel.text = titleLabel?.text
                shadowLabel.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
                shadowLabel.textColor = ( i != 4 ? strokeColor : titleLabel?.textColor )
                shadowLabel.translatesAutoresizingMaskIntoConstraints = false
                shadowLabel.textAlignment = .center
                titleLabel!.addSubview(shadowLabel)
                
                // 設定偏移位置
                NSLayoutConstraint.activate([
                    shadowLabel.centerXAnchor.constraint(equalTo: titleLabel!.centerXAnchor, constant: offsets[i].width),
                    shadowLabel.centerYAnchor.constraint(equalTo: titleLabel!.centerYAnchor, constant: offsets[i].height)
                ])
            }
        }
        
        
    }

    // MARK: - Gradient Update
    private func updateGradientColors() {
        gradientLayer.colors = [
            topColor.cgColor,
            topColor.cgColor,
            bottomColor.cgColor,
            bottomColor.cgColor
        ]
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = layer.cornerRadius
    }
    
    // MARK: - Touch Animations
    // Lightens and scales down the button when pressed.
    @objc private func touchDown() {
        UIView.animate(withDuration: 0.1) {
            self.gradientLayer.colors = [
                self.topColor.withBrightness(1.3).cgColor,
                self.topColor.withBrightness(1.3).cgColor,
                self.bottomColor.withBrightness(1.3).cgColor,
                self.bottomColor.withBrightness(1.3).cgColor
            ]
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }
    }

    // Restores normal color and scale when touch ends.
    @objc private func touchUp() {
        UIView.animate(withDuration: 0.1) {
            self.updateGradientColors()
            self.transform = .identity
        }
    }

}
