function feature = Feature_extraction(I)
F_color = Colorfulness_feat(I);
F_contrast = Contrast_feat(I);
F_visibility = Visibility_feat(I);
feature=[F_color F_contrast F_visibility];