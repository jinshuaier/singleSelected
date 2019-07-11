//
//  singleSelectTableViewCell.m
//  singleSelectedDemo
//
//  Created by qhx on 2017/7/27.
//  Copyright © 2017年 quhengxing. All rights reserved.
//

#import "singleSelectTableViewCell.h"

@implementation singleSelectTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, ScreenSizeWidth-50, cellHeight)];
        self.titleLabel.textColor = [UIColor darkGrayColor];
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:self.titleLabel];
        
        self.selectBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, ScreenSizeWidth, cellHeight)];
        self.selectBtn.imageEdgeInsets = UIEdgeInsetsMake(15, ScreenSizeWidth-35, 15, 15);//设置边距
        [self.selectBtn setImage:[UIImage imageNamed:@"unSelect_btn"] forState:UIControlStateNormal];
        [self.selectBtn setImage:[UIImage imageNamed:@"selected_btn"] forState:UIControlStateSelected];
        [self.contentView addSubview:self.selectBtn];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
