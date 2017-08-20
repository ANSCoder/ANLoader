//
//  ANLoader.swift
//  Pods
//
//  Created by Anand on 17/08/17.
//  Copyright (c) 2017 anscoder. All rights reserved.
//

import UIKit


public struct ANLoader {
    
    //MARK: - Change the variables values here for Custom uses
    public static var activityColor: UIColor = UIColor.white
    public static var activityBackgroundColor: UIColor = UIColor.darkGray
    public static var activityTextColor: UIColor = UIColor.white
    public static var activityTextFontName: String = "Verdana-Regular"
    fileprivate static var activityWidth = (UIScreen.screenWidth / widthDivision) / 2
    fileprivate static var activityHeight = activityWidth
    public static var widthDivision: CGFloat {
        get {
            guard UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad else {
                return 1.6
            }
            return 3.5
        }
    }
    public static var viewBackgroundDark: Bool = false
    public static var loadOverApplicationWindow: Bool = false
    
    
    //MARK: - Loading View
    fileprivate static var instance: LoadingResource?
    fileprivate static var backgroundView: UIView!
    fileprivate static var hidingInProgress = false
    
    
    public static func showLoading(_ text: String, disableUI: Bool) {
        ANLoader().startLoadingActivity(text, with: disableUI)
    }
    
    public static func showLoading() {
        ANLoader().startLoadingActivity("", with: false)
    }
    
    public static func hide(){
        DispatchQueue.main.async {
            instance?.hideActivity()
        }
    }
    
    //MARK: - Main Loading View creating here
    fileprivate class LoadingResource: UIView {
        
        fileprivate var textLabel: UILabel!
        fileprivate var activityView: UIActivityIndicatorView!
        fileprivate var disableUIIntraction = false
        
        convenience init(text: String, disableUI: Bool) {
            self.init(frame: CGRect(x: 0, y: 0, width: activityWidth, height: activityHeight))
            center = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
            autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleBottomMargin, .flexibleRightMargin]
            backgroundColor = activityBackgroundColor
            alpha = 1
            layer.cornerRadius = 5
            
            let yPosition = frame.height/2 - 20
            
            addActivityView(yPosition)
            
            addTextLabel(yPosition + activityView.frame.size.height, text: text)
            
            self.dropShadow()
            self.addBorder()
            
            guard disableUI else {
                return
            }
            UIApplication.shared.beginIgnoringInteractionEvents()
            disableUIIntraction = true
        }
        
        fileprivate func addActivityView(_ yPosition: CGFloat){
            activityView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
            activityView.frame = CGRect(x: (frame.width/2) - 20, y: yPosition, width: 40, height: 40)
            activityView.color = activityColor
            activityView.startAnimating()
        }
        
        fileprivate func addTextLabel(_ yPosition: CGFloat, text: String){
            textLabel = UILabel(frame: CGRect(x: 5, y: yPosition - 10, width: activityWidth - 10, height: 40))
            textLabel.textColor = activityTextColor
            textLabel.font = UIFont(name: activityTextFontName, size: 30)
            textLabel.adjustsFontSizeToFitWidth = true
            textLabel.minimumScaleFactor = 0.25
            textLabel.textAlignment = NSTextAlignment.center
            textLabel.text = text
        }
        
        fileprivate func showLoadingActivity() {
            addSubview(activityView)
            addSubview(textLabel)
            
            guard loadOverApplicationWindow else {
                topMostViewController!.view.addSubview(self)
                return
            }
            UIApplication.shared.windows.first?.addSubview(self)
        }
        
        fileprivate func hideActivity(){
            DispatchQueue.main.async {
                UIView.transition(with: self, duration: 0.2, options: .curveEaseOut, animations: {
                    self.alpha = 0.2
                    self.transform = CGAffineTransform(scaleX: 2,y: 2)
                }, completion: { (value: Bool) in
                    DispatchQueue.main.async {
                        self.clearView()
                    }
                })
            }
        }
        
        fileprivate func clearView(){
            activityView.stopAnimating()
            self.removeFromSuperview()
            instance = nil
            hidingInProgress = false
            
            if backgroundView != nil {
                UIView.animate(withDuration: 0.2, animations: {
                    backgroundView.backgroundColor = backgroundView.backgroundColor?.withAlphaComponent(0)
                }, completion: { _ in
                    backgroundView.removeFromSuperview()
                })
            }
            
            guard disableUIIntraction else {
                return
            }
            disableUIIntraction = false
            UIApplication.shared.endIgnoringInteractionEvents()
        }
    }
}

fileprivate extension UIView {
    func dropShadow(scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = 5
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func addBorder(){
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red:222/255.0, green:225/255.0, blue:227/255.0, alpha: 1.0).cgColor
    }
}

fileprivate extension ANLoader{
    
    fileprivate func startLoadingActivity(_ text: String,with disableUI: Bool){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            
            guard ANLoader.instance == nil else {
                print("\n ==============================* ANLoader *=====================================")
                print("Error: Loadering already active now, please stop that before creating a new one.")
                return
            }
            
            guard topMostViewController != nil else {
                print("\n ==============================* ANLoader *=====================================")
                print("Error: You don't have any views set. You may be calling in viewDidLoad or try inside main thread.")
                return
            }
            // Separate creation from showing
            ANLoader.instance = LoadingResource(text: text, disableUI: disableUI)
            DispatchQueue.main.async {
                if ANLoader.viewBackgroundDark {
                    if ANLoader.backgroundView == nil {
                        ANLoader.backgroundView = UIView(frame: UIApplication.shared.keyWindow!.frame)
                    }
                    ANLoader.backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0)
                    topMostViewController?.view.addSubview(ANLoader.backgroundView)
                    UIView.animate(withDuration: 0.2, animations: {ANLoader.backgroundView.backgroundColor = ANLoader.backgroundView.backgroundColor?.withAlphaComponent(0.5)})
                }
                ANLoader.instance?.showLoadingActivity()
            }
        }
    }
}

fileprivate extension UIScreen {
    class var orientation: UIInterfaceOrientation {
        get {
            return UIApplication.shared.statusBarOrientation
        }
    }
    class var screenWidth: CGFloat {
        get {
            if UIInterfaceOrientationIsPortrait(orientation) {
                return UIScreen.main.bounds.size.width
            } else {
                return UIScreen.main.bounds.size.height
            }
        }
    }
    class var screenHeight: CGFloat {
        get {
            if UIInterfaceOrientationIsPortrait(orientation) {
                return UIScreen.main.bounds.size.height
            } else {
                return UIScreen.main.bounds.size.width
            }
        }
    }
}

fileprivate var topMostViewController: UIViewController? {
    var presentedVC = UIApplication.shared.keyWindow?.rootViewController
    while let controller = presentedVC?.presentedViewController {
        presentedVC = controller
    }
    return presentedVC
}
