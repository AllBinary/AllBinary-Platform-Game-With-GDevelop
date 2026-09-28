
        /* Generated Code Do Not Modify */

        


            import { Exception } from '../../../java/lang/Exception.js';
        
import { Image } from '../../../javax/microedition/lcdui/Image.js';
//not GWT import const Image

import { Bitmap } from '../../../android/graphics/Bitmap.js';
//not GWT import const Bitmap

import { BitmapDrawable } from '../../../android/graphics/drawable/BitmapDrawable.js';
//not GWT import const BitmapDrawable

import { Drawable } from '../../../android/graphics/drawable/Drawable.js';
//not GWT import const Drawable

import { Bundle } from '../../../android/os/Bundle.js';
//not GWT import const Bundle

import { View } from '../../../android/view/View.js';
//not GWT import const View

import { AllBinaryAndroidGameInitializationUtil } from '../../../org/allbinary/AllBinaryAndroidGameInitializationUtil.js';
//not GWT import const AllBinaryAndroidGameInitializationUtil

import { AndroidResources } from '../../../org/allbinary/AndroidResources.js';
//not GWT import const AndroidResources

//not plain js import { CommonStateStrings } 
const CommonStateStrings = globalThis.org.allbinary.string.CommonStateStrings;

import { GameMidletActivity } from '../../../org/allbinary/android/activity/game/GameMidletActivity.js';
//not GWT import const GameMidletActivity

import { ProgressHelper } from '../../../org/allbinary/android/activity/progress/ProgressHelper.js';
//not GWT import const ProgressHelper

import { GameAdStateBase } from '../../../org/allbinary/business/advertisement/GameAdStateBase.js';
//not GWT import const GameAdStateBase

import { GameAdStateFactory } from '../../../org/allbinary/business/advertisement/GameAdStateFactory.js';
//not GWT import const GameAdStateFactory

import { ApplicationConfiguration } from '../../../org/allbinary/configuration/ApplicationConfiguration.js';
//not GWT import const ApplicationConfiguration

import { InitEmulatorFactory } from '../../../org/allbinary/emulator/InitEmulatorFactory.js';
//not GWT import const InitEmulatorFactory

import { GDGameSoftwareInfo } from '../../../org/allbinary/game/canvas/GDGameSoftwareInfo.js';
//not GWT import const GDGameSoftwareInfo

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

import { GameConfigurationCentral } from '../../../org/allbinary/game/configuration/GameConfigurationCentral.js';
//not GWT import const GameConfigurationCentral

import { Features } from '../../../org/allbinary/game/configuration/feature/Features.js';
//not GWT import const Features

import { GameFeatureFactory } from '../../../org/allbinary/game/configuration/feature/GameFeatureFactory.js';
//not GWT import const GameFeatureFactory

import { GraphicsFeatureFactory } from '../../../org/allbinary/game/configuration/feature/GraphicsFeatureFactory.js';
//not GWT import const GraphicsFeatureFactory

import { SensorFeatureFactory } from '../../../org/allbinary/game/configuration/feature/SensorFeatureFactory.js';
//not GWT import const SensorFeatureFactory

import { AndroidBasicTitleProgressBar } from '../../../org/allbinary/graphics/canvas/transition/progress/AndroidBasicTitleProgressBar.js';
//not GWT import const AndroidBasicTitleProgressBar

import { DisplayInfoSingleton } from '../../../org/allbinary/graphics/displayable/DisplayInfoSingleton.js';
//not GWT import const DisplayInfoSingleton

import { ImageCacheFactory } from '../../../org/allbinary/image/ImageCacheFactory.js';
//not GWT import const ImageCacheFactory

import { SmallIntegerSingletonFactory } from '../../../org/allbinary/logic/math/SmallIntegerSingletonFactory.js';
//not GWT import const SmallIntegerSingletonFactory

//not plain js import { ABHashtable } 
const ABHashtable = globalThis.org.allbinary.util.ABHashtable;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDGameMIDletFactory } from './GDGameMIDletFactory.js';
//not GWT import - same folder const GDGameMIDletFactory

export class GDGameAndroidActivityBase extends GameMidletActivity {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

public constructor (){
            super(ProgressHelper.NULL_PROGRESS_HELPER);
                    

                            //For kotlin this is before the body of the constructor.
                    

        try {
            
    var gameAdState: GameAdStateBase = GameAdStateFactory.getInstance()!.getInstanceForApp(GDGameSoftwareInfo.getInstance())!;;
    
gameAdState!.setOkayToShowAds(true);
    

                //: 
} catch(e) 
            {
logUtil!.put(commonStrings!.EXCEPTION, this, commonStrings!.CONSTRUCTOR, e);
    
}

}


    init(){
super.init();
    
AllBinaryAndroidGameInitializationUtil.init();
    
}


                //@Throws(Exception.constructor)
            
    initViewIds(){

    var androidResources: AndroidResources = AndroidResources.getInstance()!;;
    
this.initViewIdsFromArrays([androidResources!.id.gd,androidResources!.id.gd_gl], [androidResources!.layout.gd_layout,androidResources!.layout.gd_ad_overlay_layout], [androidResources!.layout.gd_gl_layout], false);
    
this.setRootViewId(this.getViewId());
    
}


    public onCreate(icicle: Bundle){

        try {
            logUtil!.putF(commonStrings!.START, this, CommonStateStrings.getInstance()!.CREATE);
    
super.onCreate(icicle);
    

                        if(this.isStartable())
                        
                                    {
                                    this.setBackgrounds();
    

                                    }
                                
logUtil!.putF(commonStrings!.END, this, CommonStateStrings.getInstance()!.CREATE);
    

                //: 
} catch(e) 
            {
logUtil!.put(commonStrings!.EXCEPTION, this, CommonStateStrings.getInstance()!.CREATE, e);
    
}

}


    public onStart(){

        try {
            logUtil!.putF(commonStrings!.START, this, CommonStateStrings.getInstance()!.START);
    
super.onStart();
    
super.onStartMidlet(new GDGameMIDletFactory());
    
logUtil!.putF(commonStrings!.END, this, CommonStateStrings.getInstance()!.START);
    

                //: 
} catch(e) 
            {
logUtil!.put(commonStrings!.EXCEPTION, this, CommonStateStrings.getInstance()!.START, e);
    
}

}


                //@Throws(Exception.constructor)
            
    public initEmulator(){
super.initEmulator();
    

                        if(!InitEmulatorFactory.getInstance()!.isInitEmulator())
                        
                                    {
                                    logUtil!.putF("Init Base GameFeatures", this, "initEmulator");
    

    var features: Features = Features.getInstance()!;;
    

    var gameConfigurationCentral: GameConfigurationCentral = GameConfigurationCentral.getInstance()!;;
    
gameConfigurationCentral!.VIBRATION.setDefaultValue(SmallIntegerSingletonFactory.getInstance()!.getAt(1));
    
gameConfigurationCentral!.VIBRATION.setDefault();
    
gameConfigurationCentral!.SPEED.setDefaultValue(SmallIntegerSingletonFactory.getInstance()!.getAt(9));
    
gameConfigurationCentral!.SPEED.setDefault();
    

    var graphicsFeatureFactory: GraphicsFeatureFactory = GraphicsFeatureFactory.getInstance()!;;
    
features.addDefault(graphicsFeatureFactory!.TRANSPARENT_IMAGE_CREATION);
    
features.addDefault(graphicsFeatureFactory!.IMAGE_GRAPHICS);
    
features.addDefault(graphicsFeatureFactory!.IMAGE_TO_ARRAY_GRAPHICS);
    
features.addDefault(GameFeatureFactory.getInstance()!.SOUND);
    

    var sensorFeatureFactory: SensorFeatureFactory = SensorFeatureFactory.getInstance()!;;
    
features.removeDefault(sensorFeatureFactory!.ORIENTATION_SENSORS);
    
features.addDefault(sensorFeatureFactory!.NO_ORIENTATION);
    
InitEmulatorFactory.getInstance()!.setInitEmulator(true);
    

                                    }
                                
}


                //@Throws(Exception.constructor)
            
    public setBackgrounds(){
logUtil!.putF(commonStrings!.START, this, "getBackground");
    

    var androidResources: AndroidResources = AndroidResources.getInstance()!;;
    

    var reloadConfiguration: ApplicationConfiguration = ApplicationConfiguration.getInstance()!;;
    

    var drawable: Drawable = this.getResources()!.getDrawable(androidResources!.drawable.gd_wait_256_by_256)!;;
    

                        if(reloadConfiguration!.isProgressBarView())
                        
                                    {
                                    this.getProgressHelper()!.getProgressBar()!.setIndeterminateDrawable(drawable);
    

                                    }
                                
                        else {
                            
    var displayInfo: DisplayInfoSingleton = DisplayInfoSingleton.getInstance()!;;
    

    var view: View = this.getRootView()!;;
    

    var bitmap: Bitmap = (drawable as BitmapDrawable).getBitmap()!;;
    

    var hashtable: ABHashtable = ImageCacheFactory.getInstance()!.getHashtableP()!;;
    
hashtable.put(AndroidBasicTitleProgressBar.RESOURCE, Image.createImageBitmap(bitmap));
    
AndroidBasicTitleProgressBar.setBackgroundResource(androidResources!.drawable.gd_wait_256_by_256);
    

                        }
                            
}


}



