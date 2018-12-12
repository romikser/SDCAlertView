import UIKit

final class ActionCell: UICollectionViewCell {

    @IBOutlet private(set) var imageView: UIImageView!

    private var initialImageViewWidth: CGFloat = 0.0
    @IBOutlet private(set) var imageViewWidth: NSLayoutConstraint! {
        didSet {
            self.initialImageViewWidth = imageViewWidth.constant
        }
    }

    private var initialImageViewToTitleHorizontal: CGFloat = 0.0
    @IBOutlet private(set) var imageViewToTitleHorizontal: NSLayoutConstraint! {
        didSet {
            self.initialImageViewToTitleHorizontal = imageViewToTitleHorizontal.constant
        }
    }

    @IBOutlet private(set) var titleLabelToCellCenter: NSLayoutConstraint!
    @IBOutlet private(set) var titleLabelToCellLeadingStrict: NSLayoutConstraint!
    @IBOutlet private(set) var imageViewToCellTrailingStrict: NSLayoutConstraint!

    @IBOutlet private(set) var titleLabel: UILabel!
    @IBOutlet private var highlightedBackgroundView: UIView!

    private var textColor: UIColor?
    
    var isEnabled = true {
        didSet { self.titleLabel.isEnabled = self.isEnabled }
    }

    override var isHighlighted: Bool {
        didSet { self.highlightedBackgroundView.isHidden = !self.isHighlighted }
    }

    func set(_ action: AlertAction, with visualStyle: AlertVisualStyle) {
        action.actionView = self

        self.titleLabel.font = visualStyle.font(for: action)
        
        self.textColor = visualStyle.textColor(for: action)
        self.titleLabel.textColor = self.textColor ?? self.tintColor
        
        self.titleLabel.attributedText = action.attributedTitle
        self.titleLabel.textAlignment = visualStyle.actionTextAlignment

        self.highlightedBackgroundView.backgroundColor = visualStyle.actionHighlightColor

        self.imageView.image = action.image
        let imageHidden = action.image == nil
        self.imageView.isHidden = imageHidden
        self.imageViewWidth.constant = imageHidden ? 0.0 : self.initialImageViewWidth
        self.imageViewToTitleHorizontal.constant = imageHidden ? 0.0 : self.initialImageViewToTitleHorizontal

        let labelIsCentered = visualStyle.actionTextAlignment == .center
        self.titleLabelToCellCenter.isActive = labelIsCentered
        self.titleLabelToCellLeadingStrict.isActive = !labelIsCentered
        self.imageViewToCellTrailingStrict.isActive = !labelIsCentered

        self.setupAccessibility(using: action)
    }

    override func tintColorDidChange() {
        super.tintColorDidChange()
        self.titleLabel.textColor = self.textColor ?? self.tintColor
    }
}

final class ActionSeparatorView: UICollectionReusableView {

    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)

        if let attributes = layoutAttributes as? ActionsCollectionViewLayoutAttributes {
            self.backgroundColor = attributes.backgroundColor
        }
    }
}
