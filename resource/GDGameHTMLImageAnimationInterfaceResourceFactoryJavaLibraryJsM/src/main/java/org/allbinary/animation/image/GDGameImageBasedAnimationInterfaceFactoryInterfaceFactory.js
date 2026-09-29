/*
        *
        *  AllBinary Open License Version 1
        *  Copyright (c) 2011 AllBinary
        *
        *  By agreeing to this license you and any business entity you represent are
        *  legally bound to the AllBinary Open License Version 1 legal agreement.
        *
        *  You may obtain the AllBinary Open License Version 1 legal agreement from
        *  AllBinary or the root directory of AllBinary's AllBinary Platform repository.
        *
        *  Created By: Travis Berthelot
*/
import { Integer } from '../../../../java/lang/Integer.js';
import { OpenGLFeatureFactory } from '../../../../org/allbinary/graphics/opengles/OpenGLFeatureFactory.js';
//not GWT import const OpenGLFeatureFactory
import { BaseResourceAnimationInterfaceFactoryInterfaceFactory } from '../../../../org/allbinary/animation/resource/BaseResourceAnimationInterfaceFactoryInterfaceFactory.js';
//not GWT import const BaseResourceAnimationInterfaceFactoryInterfaceFactory
import { Features } from '../../../../org/allbinary/game/configuration/feature/Features.js';
//not GWT import const Features
import { GraphicsFeatureFactory } from '../../../../org/allbinary/game/configuration/feature/GraphicsFeatureFactory.js';
//not GWT import const ProgressCanvas
import { ProgressCanvasFactory } from '../../../../org/allbinary/graphics/canvas/transition/progress/ProgressCanvasFactory.js';
//not GWT import const ImageCache
import { ImageCacheFactory } from '../../../../org/allbinary/image/ImageCacheFactory.js';
//not GWT import const ImageCacheFactory
//not plain js import { StdUtil } 
const StdUtil = globalThis.org.allbinary.logic.StdUtil;
//Current folder imports from return types, extended types, and scope (deduplicated)
export class GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory extends BaseResourceAnimationInterfaceFactoryInterfaceFactory {
    constructor() {
        super("Image Animations", StdUtil.getInstance().createHashtable(), StdUtil.getInstance().createHashtable(), StdUtil.getInstance().createHashtable());
        //For kotlin this is before the body of the constructor.
    }
    constructor(name) {
        super(name, StdUtil.getInstance().createHashtable(), StdUtil.getInstance().createHashtable(), StdUtil.getInstance().createHashtable());
        //For kotlin this is before the body of the constructor.
    }
    //@Throws(Exception.constructor)
    init(level) {
        this.initImageCache(ImageCacheFactory.getInstance(), level);
    }
    //@Throws(Exception.constructor)
    initImageCache(imageCache, level) {
        if (this.isInitialized()) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return;
        }
        var portion = 120;
        ;
        var loadingString = this.toString() + " Loading: ";
        ;
        var index = 0;
        ;
        var progressCanvas = ProgressCanvasFactory.getInstance();
        ;
        progressCanvas.addNormalPortion(portion, loadingString + index++);
        this.addRectangles();
        progressCanvas.addNormalPortion(portion, loadingString + index++);
        super.init(level);
    }
    isLoadingLevel(level) {
        if (level > 0 && level < Integer.MAX_VALUE - 100) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return true;
        }
        else {
            //if statement needs to be on the same line and ternary does not work the same way.
            return super.isLoadingLevel(level);
            ;
        }
    }
    isFeature() {
        var features = Features.getInstance();
        ;
        if (features.isFeature(GraphicsFeatureFactory.getInstance().IMAGE_GRAPHICS) && features.isFeature(GraphicsFeatureFactory.getInstance().IMAGE_TO_ARRAY_GRAPHICS) && !features.isDefault(OpenGLFeatureFactory.getInstance().OPENGL)) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return true;
        }
        else {
            //if statement needs to be on the same line and ternary does not work the same way.
            return false;
        }
    }
    //@Throws(Exception.constructor)
    addRectangles() {
    }
}
