//
//  ViewController.swift
//  TestMenuBar
//
//  Created by Timur Isaev on 20.01.2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var indexLabel: UILabel!
    
    var isMenuShow = true
    var menuViewController: MenuViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupSwipe() 
    }

    private func setupSwipe() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeRight.direction = .right

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeLeft.direction = .left

        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    func configureMenuViewController() {
        if menuViewController == nil {
            menuViewController = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController
            menuViewController.delegate = self
            view.insertSubview(menuViewController.view, at: 0)
            addChild(menuViewController)
        }
    }
    
    @IBAction func menuShowActionButton(_ sender: UIBarButtonItem) {
        if isMenuShow {
            showMenu()
        } else {
            hideMenu()
        }
    }
    
    @objc func handleSwipe(gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case UISwipeGestureRecognizer.Direction.right:
            showMenu()
        case UISwipeGestureRecognizer.Direction.left:
            hideMenu()
        default: break
        }
    }

    func showMenu() {
        configureMenuViewController()
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0,
                       options: .curveEaseInOut,
                       animations: { [self] in
                        menuViewController.view.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height)
                       }) { [self] (finished) in
            isMenuShow = false
        }
    }
    
    func hideMenu() {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0,
                       options: .curveEaseInOut,
                       animations: { [self] in
                        menuViewController.view.frame = CGRect(x: -view.bounds.size.width, y: 0, width: view.bounds.size.width, height: view.bounds.size.height)
                       }) { [self] (finished) in
            isMenuShow = true
        }
    }
}

extension MainViewController: MenuViewControllerDelegate {
    func showHideMenu(withItem item: MenuStruct?) {
        if let item = item {
            indexLabel.text = String(item.number)
        }
        
        hideMenu()
    }
}

