//
//  CenterAlignedCollectionViewFlowLayout.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit

class CenterAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        var rowCollections: [[UICollectionViewLayoutAttributes]] = [[]]
        var currentRowY: CGFloat = -1
        
        attributes?.forEach { layoutAttribute in
            if layoutAttribute.frame.origin.y != currentRowY {
                rowCollections.append([])
                currentRowY = layoutAttribute.frame.origin.y
            }
            rowCollections[rowCollections.count - 1].append(layoutAttribute)
        }
        
        rowCollections.forEach { rowAttributes in
            let totalWidth = rowAttributes.reduce(0, { $0 + $1.frame.width }) + minimumInteritemSpacing * CGFloat(rowAttributes.count - 1)
            let insets = (collectionView?.contentInset ?? UIEdgeInsets.zero)
            let collectionViewWidth = collectionView?.bounds.width ?? 0
            let leftInset = insets.left
            let rightInset = insets.right
            let totalAvailableWidth = collectionViewWidth - leftInset - rightInset
            let offsetX = (totalAvailableWidth - totalWidth) / 2
            
            var xOffset = offsetX + leftInset
            rowAttributes.forEach { attribute in
                attribute.frame.origin.x = xOffset
                xOffset += attribute.frame.width + minimumInteritemSpacing
            }
        }
        
        return attributes
    }
}
