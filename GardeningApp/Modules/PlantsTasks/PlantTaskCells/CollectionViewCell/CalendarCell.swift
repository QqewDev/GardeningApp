//
//
// GardeningApp
// CalendarCell.swift
// 
// Created by Alexander Kist on 28.12.2023.
//


import Foundation
import SnapKit
import UIKit

class CalendarCell: UICollectionViewCell {

    private let dayLabel = CustomLabel(fontName: UIFont.body(), textColor: .accentLight)
    private let dateLabel = CustomLabel(fontName: UIFont.body(), textColor: .accentLight)


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        let stackView = UIStackView(arrangedSubviews: [dayLabel, dateLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
        }
    }

    override func prepareForReuse() {
        dayLabel.text = nil
        dateLabel.text = nil
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = .zero
    }

    func configure(with date: Date, isSelected: Bool) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        dayLabel.text = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "dd"
        dateLabel.text = dateFormatter.string(from: date)

        if isSelected {
            contentView.backgroundColor = .accentDark
            dayLabel.textColor = .accentLight
            dateLabel.textColor = .accentLight
        } else {
            contentView.backgroundColor = .clear
            dayLabel.textColor = .accentDark
            dateLabel.textColor = .accentDark
        }
        
        contentView.layer.cornerRadius = isSelected ? contentView.frame.size.height / 5 : 0
    }
}