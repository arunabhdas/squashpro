//
//  CSDKButton.swift
//  Central
//
//  Created by coder on 10/2/15.
//  Copyright © 2015 App Liaison. All rights reserved.
//

import UIKit
@IBDesignable
open class CSDKButton : UIButton
{
    let colorTwo:UIColor = UIColor(red:  164/255.0, green: 199/255.0, blue: 240/255.0, alpha: 100.0/100.0)
    @IBInspectable open var maskEnabled: Bool = true {
        didSet {
            mkLayer.enableMask(maskEnabled)
        }
    }
    @IBInspectable open var rippleLocation: MKRippleLocation = .tapLocation {
        didSet {
            mkLayer.rippleLocation = rippleLocation
        }
    }
    @IBInspectable open var ripplePercent: Float = 0.9 {
        didSet {
            mkLayer.ripplePercent = ripplePercent
        }
    }
    @IBInspectable open var backgroundLayerCornerRadius: CGFloat = 0.0 {
        didSet {
            mkLayer.setBackgroundLayerCornerRadius(backgroundLayerCornerRadius)
        }
    }
    // animations
    @IBInspectable open var shadowAniEnabled: Bool = true
    @IBInspectable open var backgroundAniEnabled: Bool = true {
        didSet {
            if !backgroundAniEnabled {
                mkLayer.enableOnlyCircleLayer()
            }
        }
    }
    @IBInspectable open var rippleAniDuration: Float = 0.75
    @IBInspectable open var backgroundAniDuration: Float = 1.0
    @IBInspectable open var shadowAniDuration: Float = 0.65
    
    @IBInspectable open var rippleAniTimingFunction: MKTimingFunction = .linear
    @IBInspectable open var backgroundAniTimingFunction: MKTimingFunction = .linear
    @IBInspectable open var shadowAniTimingFunction: MKTimingFunction = .easeOut
    
    @IBInspectable open var cornerRadius: CGFloat = 2.5 {
        didSet {
            layer.cornerRadius = cornerRadius
            mkLayer.setMaskLayerCornerRadius(cornerRadius)
        }
    }
    // color
    @IBInspectable open var rippleLayerColor: UIColor = UIColor(white: 0.45, alpha: 0.5) {
        didSet {
            mkLayer.setCircleLayerColor(rippleLayerColor)
        }
    }
    @IBInspectable open var backgroundLayerColor: UIColor = UIColor(red:  114/255.0, green: 169/255.0, blue: 210/255.0, alpha: 50.0/100.0) {
        didSet {
            mkLayer.setBackgroundLayerColor(backgroundLayerColor)
        }
    }
    override open var bounds: CGRect {
        didSet {
            mkLayer.superLayerDidResize()
        }
    }
    
    fileprivate lazy var mkLayer: MKLayer = MKLayer(superLayer: self.layer)
    
    // MARK - initilization
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupLayer()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayer()
    }
    
    // MARK - setup methods
    fileprivate func setupLayer() {
        adjustsImageWhenHighlighted = false
        cornerRadius = 2.5
        mkLayer.setBackgroundLayerColor(backgroundLayerColor)
        // mkLayer.setCircleLayerColor(rippleLayerColor)
        mkLayer.setCircleLayerColor(UIColor.clear)
    }
    
    // MARK - location tracking methods
    override open func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        if rippleLocation == .tapLocation {
            mkLayer.didChangeTapLocation(touch.location(in: self))
        }
        
        // rippleLayer animation
        mkLayer.animateScaleForCircleLayer(0.45, toScale: 1.0, timingFunction: rippleAniTimingFunction, duration: CFTimeInterval(self.rippleAniDuration))
        
        // backgroundLayer animation
        if backgroundAniEnabled {
            mkLayer.animateAlphaForBackgroundLayer(backgroundAniTimingFunction, duration: CFTimeInterval(self.backgroundAniDuration))
        }
        
        // shadow animation for self
        if shadowAniEnabled {
            let shadowRadius = layer.shadowRadius
            let shadowOpacity = layer.shadowOpacity
            let duration = CFTimeInterval(shadowAniDuration)
            mkLayer.animateSuperLayerShadow(10, toRadius: shadowRadius, fromOpacity: 0, toOpacity: shadowOpacity, timingFunction: shadowAniTimingFunction, duration: duration)
        }
        
        return super.beginTracking(touch, with: event)
    }
    
}
