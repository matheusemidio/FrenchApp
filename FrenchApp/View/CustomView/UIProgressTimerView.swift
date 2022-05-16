//
//  UIProgressTimerView.swift
//  FrenchApp
//
//  Created by Matheus Cadena on 2022-05-14.
//

import UIKit

class UIProgressTimerView: UIView {

    private var progressBar : UIProgressView =
    {
        let bar : UIProgressView = UIProgressView(progressViewStyle: .bar)
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.trackTintColor = .red
        bar.tintColor = .blue
//        bar.progress = 0.0
//        bar.setProgress(100, animated: true)

        
        
        return bar
    }()
    public var setProgress : Float = 0.0
    {
        didSet{
//            progressBar.progress = setProgress
            self.progressBar.setProgress(setProgress, animated: true)

        }
    }
    //MARK: - Required functions
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialize()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    //MARK: - Modifiers
//    public var startTimer = {
//
//        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
//
//        
//    }()
//    @objc private func configure()
//    {
////        var longTimer : Timer
////        longTimer = Timer.scheduledTimer(withTimeInterval: 60.0, repeats: true, block: { long in
////            let change: Float = 0.1/6
////            self.progressBar.progress = self.progressBar.progress + (change)
////            if self.progressBar.progress >= 1.0 {
////                long.invalidate()
////            }
////        })
//        
////        var shortTimer : Timer
////        shortTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { short in
////            let change: Float = 0.01
////            self.progressBar.progress = self.progressBar.progress + (change)
////            if self.progressBar.progress >= 1.0 {
////                short.invalidate()
////            }
////        })
//        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateProgressBar), userInfo: nil, repeats: true)
//        
//    }

    
    //MARK: - Initializers
    private func initialize()
    {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubviews(progressBar)

        applyContraints()
        
    }
    
    
    
    private func applyContraints()
    {
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        
        progressBar.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        progressBar.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        progressBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        progressBar.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
    
    

}
