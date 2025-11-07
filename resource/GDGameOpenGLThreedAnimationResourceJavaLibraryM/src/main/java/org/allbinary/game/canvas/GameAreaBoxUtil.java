/*
 * AllBinary Open License Version 1
 * Copyright (c) 2022 AllBinary
 * 
 * By agreeing to this license you and any business entity you represent are
 * legally bound to the AllBinary Open License Version 1 legal agreement.
 * 
 * You may obtain the AllBinary Open License Version 1 legal agreement from
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository.
 * 
 * Created By: Travis Berthelot
 * 
 */
package org.allbinary.game.canvas;

import min3d.core.Object3d;
import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.animation.AnimationInterfaceFactoryInterfaceComposite;
import org.allbinary.animation.BaseAnimationInterfaceFactoryInterfaceComposite;
import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface;
import org.allbinary.animation.threed.ThreedAnimationSingletonFactory;
import org.allbinary.animation.resource.BaseResourceAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.game.identification.Group;
import org.allbinary.game.identification.GroupFactory;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.layer.GDGameLayerFactory;
import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.threed.min3d.Min3dSceneResourcesFactory;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GameAreaBoxUtil {
    
    private static final GameAreaBoxUtil instance = new GameAreaBoxUtil();

    /**
     * @return the instance
     */
    public static GameAreaBoxUtil getInstance() {
        return instance;
    }

    //Add at end of 
    
    //GD1SpecialAnimationGDResources
    //GameAreaBoxUtil.getInstance().addGameLayerFactories(animationInterfaceFactoryInterfaceFactory);
    
    //GD1GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory
    //GameAreaBoxUtil.getInstance().addAnimations(this);
    
    //GD1SpecialAnimationBuilder
    //GameAreaBoxUtil.getInstance().append(allBinaryGameLayerManager);
    
    //GD1GameThreedLevelBuilder
    //min3dSceneResourcesFactory.add(GameAreaBoxUtil.getInstance().BOX_ANIMATION_NAME, engine_particleObject3dContainerArray);
    
    public String BOX_ANIMATION_NAME = "box_animation";
    public String BOX_PROCEDURAL_ANIMATION_NAME = "box_procedural_animation";
    public String BOX_RECTANGLE_NAME_1 = "box_rect";
    public String BOX_RECTANGLE_NAME_2 = "box_rect";
    public String BOX_RECTANGLE_NAME_3 = "box_rect";
    public String BOX_RECTANGLE_NAME_4 = "box_rect";

    
    private final Min3dSceneResourcesFactory min3dSceneResourcesFactory = Min3dSceneResourcesFactory.getInstance();

    private final String BOX = "box";

    public GDGameLayerFactory boxGDGameLayerFactory1 = null;
    public GDGameLayerFactory boxGDGameLayerFactory2 = null;
    public GDGameLayerFactory boxGDGameLayerFactory3 = null;
    public GDGameLayerFactory boxGDGameLayerFactory4 = null;

    public void addGameLayerFactories(final BaseResourceAnimationInterfaceFactoryInterfaceFactory animationInterfaceFactoryInterfaceFactory) throws Exception {

        final BasicArrayList gameLayerList = new BasicArrayList();
        final BasicArrayList gameLayerDestroyedList = new BasicArrayList();
        final BasicArrayList behaviorList = new BasicArrayList();
                
        final Group btn_rotate_leftGroupInterface = GroupFactory.getInstance().getNextGroup(BOX);
        
        final AnimationInterfaceFactoryInterface[] boxAnimationInterfaceFactoryInterfaceArray = (AnimationInterfaceFactoryInterface[]) ((AnimationInterfaceFactoryInterfaceComposite) animationInterfaceFactoryInterfaceFactory.getBasicAnimationInterfaceFactoryInstance(this.BOX_ANIMATION_NAME)).getAnimationInterfaceFactoryInterfaceArray();
        final ProceduralAnimationInterfaceFactoryInterface[] boxProceduralAnimationInterfaceFactoryInterfaceArray = (ProceduralAnimationInterfaceFactoryInterface[]) ((BaseAnimationInterfaceFactoryInterfaceComposite) animationInterfaceFactoryInterfaceFactory.getBasicAnimationInterfaceFactoryInstance(this.BOX_PROCEDURAL_ANIMATION_NAME)).getBasicAnimationInterfaceFactoryInterfaceArray();
        final Rectangle boxLayerInfo1 = animationInterfaceFactoryInterfaceFactory.getRectangle(this.BOX_RECTANGLE_NAME_1);

        this.boxGDGameLayerFactory1 = new GDGameLayerFactory(
                gameLayerList, gameLayerDestroyedList,
                new Group[]{btn_rotate_leftGroupInterface},
                behaviorList,
                boxAnimationInterfaceFactoryInterfaceArray,
                boxProceduralAnimationInterfaceFactoryInterfaceArray,
                boxLayerInfo1,
                null,
                false
        );
        final Rectangle boxLayerInfo2 = animationInterfaceFactoryInterfaceFactory.getRectangle(this.BOX_RECTANGLE_NAME_1);

        this.boxGDGameLayerFactory2 = new GDGameLayerFactory(
                gameLayerList, gameLayerDestroyedList,
                new Group[]{btn_rotate_leftGroupInterface},
                behaviorList,
                boxAnimationInterfaceFactoryInterfaceArray,
                boxProceduralAnimationInterfaceFactoryInterfaceArray,
                boxLayerInfo2,
                null,
                false
        );
        final Rectangle boxLayerInfo3 = animationInterfaceFactoryInterfaceFactory.getRectangle(this.BOX_RECTANGLE_NAME_1);

        this.boxGDGameLayerFactory3 = new GDGameLayerFactory(
                gameLayerList, gameLayerDestroyedList,
                new Group[]{btn_rotate_leftGroupInterface},
                behaviorList,
                boxAnimationInterfaceFactoryInterfaceArray,
                boxProceduralAnimationInterfaceFactoryInterfaceArray,
                boxLayerInfo3,
                null,
                false
        );
        final Rectangle boxLayerInfo4 = animationInterfaceFactoryInterfaceFactory.getRectangle(this.BOX_RECTANGLE_NAME_1);

        this.boxGDGameLayerFactory4 = new GDGameLayerFactory(
                gameLayerList, gameLayerDestroyedList,
                new Group[]{btn_rotate_leftGroupInterface},
                behaviorList,
                boxAnimationInterfaceFactoryInterfaceArray,
                boxProceduralAnimationInterfaceFactoryInterfaceArray,
                boxLayerInfo4,
                null,
                false
        );
    }

    public void addAnimations(final BaseResourceAnimationInterfaceFactoryInterfaceFactory baseResourceAnimationInterfaceFactoryInterfaceFactory) throws Exception {

        final BasicArrayList boxList = new BasicArrayList();
        final Object3d[] boxObject3dArray = min3dSceneResourcesFactory.get(this.BOX_ANIMATION_NAME);
        final int boxSize = boxObject3dArray.length;
        for (int index = 0; index < boxSize; index++) {
            boxList.add(new ThreedAnimationSingletonFactory(boxObject3dArray[index]));
        }

        final AnimationInterfaceFactoryInterface[] boxAnimationInterfaceFactoryInterfaceArray = (AnimationInterfaceFactoryInterface[]) boxList.toArray(new AnimationInterfaceFactoryInterface[boxSize]);
        final ProceduralAnimationInterfaceFactoryInterface[] boxProceduralAnimationInterfaceFactoryInterfaceArray = new ProceduralAnimationInterfaceFactoryInterface[0];

        baseResourceAnimationInterfaceFactoryInterfaceFactory.add(this.BOX_ANIMATION_NAME, new AnimationInterfaceFactoryInterfaceComposite(boxAnimationInterfaceFactoryInterfaceArray));
        baseResourceAnimationInterfaceFactoryInterfaceFactory.add(this.BOX_PROCEDURAL_ANIMATION_NAME, new BaseAnimationInterfaceFactoryInterfaceComposite(boxProceduralAnimationInterfaceFactoryInterfaceArray));

        final Rectangle boxLayerInfo = new Rectangle(
                PointFactory.getInstance().getInstance(
                        0,
                        0),
                0, 0
        );

        baseResourceAnimationInterfaceFactoryInterfaceFactory.addRectangle(this.BOX_RECTANGLE_NAME_2, boxLayerInfo);

        final Rectangle boxLayerInfo2 = new Rectangle(
                PointFactory.getInstance().getInstance(
                        192,
                        320),
                0, 0
        );

        baseResourceAnimationInterfaceFactoryInterfaceFactory.addRectangle(this.BOX_RECTANGLE_NAME_2, boxLayerInfo2);

        final Rectangle boxLayerInfo3 = new Rectangle(
                PointFactory.getInstance().getInstance(
                        0,
                        320),
                0, 0
        );

        baseResourceAnimationInterfaceFactoryInterfaceFactory.addRectangle(this.BOX_RECTANGLE_NAME_3, boxLayerInfo3);

        final Rectangle boxLayerInfo4 = new Rectangle(
                PointFactory.getInstance().getInstance(
                        192,
                        0),
                0, 0
        );

        baseResourceAnimationInterfaceFactoryInterfaceFactory.addRectangle(this.BOX_RECTANGLE_NAME_4, boxLayerInfo4);
    }
    
    public void append(final AllBinaryGameLayerManager allBinaryGameLayerManager) throws Exception {
//        final GD1SpecialAnimationGlobals globals = GD1SpecialAnimationGlobals.getInstance();
//        final GDGameLayer boxGDGameLayer1 = boxGDGameLayerFactory1.create(BOX, new GDObject(BOX, 38, 64, BOX), globals.btn_rotate_leftGDConditionWithGroupActions);
//        allBinaryGameLayerManager.append(boxGDGameLayer1);
//        final GDGameLayer boxGDGameLayer2 = boxGDGameLayerFactory1.create(BOX, new GDObject(BOX, 356, 600, BOX), globals.btn_rotate_leftGDConditionWithGroupActions);
//        allBinaryGameLayerManager.append(boxGDGameLayer2);
//        final GDGameLayer boxGDGameLayer3 = boxGDGameLayerFactory1.create(BOX, new GDObject(BOX, 38, 600, BOX), globals.btn_rotate_leftGDConditionWithGroupActions);
//        allBinaryGameLayerManager.append(boxGDGameLayer3);
//        final GDGameLayer boxGDGameLayer4 = boxGDGameLayerFactory1.create(BOX, new GDObject(BOX, 356, 64, BOX), globals.btn_rotate_leftGDConditionWithGroupActions);
//        allBinaryGameLayerManager.append(boxGDGameLayer4);
    }
    
}
