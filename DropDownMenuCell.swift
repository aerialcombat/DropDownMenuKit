/**
	Copyright (C) 2015 Quentin Mathe
 
	Date:  May 2015
	License:  MIT
 */

import UIKit

open class DropDownMenuCell : UITableViewCell {
	
	open var customView: UIView? {
		didSet {
			guard let customView = customView else {
				return
			}
			contentView.addSubview(customView)
		}
	}
    /// For an app extension, the selector must take an argument.
	open var menuAction: Selector?
    /// For an app extension, the menu target must not be nil.
	open weak var menuTarget: AnyObject?
	open var showsCheckmark = true
	open var rowHeight: CGFloat = 44

	// MARK: - Initialization

	override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		 super.init(style: style, reuseIdentifier: reuseIdentifier)
		setUp()
	}
	
	public init() {
		super.init(style: .subtitle, reuseIdentifier: NSStringFromClass(DropDownMenuCell.self))
		setUp()
	}

	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setUp()
	}

	open override func awakeFromNib() {
		setUp()
	}

	private func setUp() {
		textLabel?.text = "Untitled"
	}
	
	// MARK: - Layout
	
	open var iconSize = CGSize(width: 24, height: 24)

	override open func layoutSubviews() {
	
		if let textLabel = textLabel {
			if customView != nil && textLabel.text == nil {
				textLabel.text = "Custom View Origin Hint"
			}
			textLabel.isHidden = customView != nil
		}

		super.layoutSubviews()

		if let imageView = imageView, imageView.image != nil {
			imageView.frame.size = iconSize
			imageView.center = CGPoint(x: imageView.center.x, y: bounds.size.height / 2)
		}
		
		if let customView = customView {
			if let textLabel = textLabel, imageView?.image != nil {
				customView.frame.origin.x = textLabel.frame.origin.x
			} else {
				customView.center.x = bounds.width / 2
			}
			customView.center.y =  bounds.height / 2
			
			let margin: CGFloat = 5 // imageView?.frame.origin.x ?? 15
			
			if customView.frame.maxX + margin > bounds.width {
				customView.frame.size.width = bounds.width - customView.frame.origin.x - margin
			}
		}
	}
}
