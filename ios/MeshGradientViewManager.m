//
//  MeshGradient.m
//  reactnativemeshgradient
//
//  Created by wilmxore on 27.07.2024.
//

#import <React/RCTViewManager.h>

@interface RCT_EXTERN_MODULE(MeshGradientViewManager, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(isAnimated, BOOL)
RCT_EXPORT_VIEW_PROPERTY(meshWidth, NSInteger)
RCT_EXPORT_VIEW_PROPERTY(meshHeight, NSInteger)
RCT_EXPORT_VIEW_PROPERTY(points, NSArray)
RCT_EXPORT_VIEW_PROPERTY(primaryColors, NSArray)
RCT_EXPORT_VIEW_PROPERTY(secondaryColors, NSArray)
RCT_EXPORT_VIEW_PROPERTY(background, NSString)
RCT_EXPORT_VIEW_PROPERTY(smoothsColors, BOOL)
RCT_EXPORT_VIEW_PROPERTY(colorSpace, NSString)
RCT_EXPORT_VIEW_PROPERTY(borderRadius, CGFloat)
RCT_EXPORT_VIEW_PROPERTY(animationDuration, NSInteger)
RCT_EXPORT_VIEW_PROPERTY(animationType, NSString)

@end