/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.allbinary.game.layer;


import java.util.Hashtable;

import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.animation.NullAnimationFactory;
import org.allbinary.animation.NullRotationAnimationFactory;
import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface;
import org.allbinary.game.identification.Group;
import org.allbinary.game.layer.special.GDConditionWithGroupActions;
import org.allbinary.game.layout.GDObject;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.RectangleFactory;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.LayerInterfaceFactoryInterface;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author user
 */
public class GDFlagLayerInterfaceFactory
    implements LayerInterfaceFactoryInterface
{
    protected final LogUtil logUtil = LogUtil.getInstance();

    private static final GDFlagLayerInterfaceFactory instance =
        new GDFlagLayerInterfaceFactory();

    public static GDFlagLayerInterfaceFactory getInstance()
    {
        return instance;
    }
    
    private int index = 0;

    private GDFlagLayerInterfaceFactory()
    {
    }

    private static final String NAME = "GDFlagLayerInterfaceFactory";
    public AllBinaryLayer getInstance(final Hashtable hashtable, final int x, final int y, final int z)
        throws Exception
    {
        //logUtil.put(LayerUtil.toString(hashtable, x, y, z), this, commonStrings.GET_INSTANCE);

        //final FeaturedAnimationInterfaceFactoryInterfaceFactory 
        //featuredAnimationInterfaceFactoryInterfaceFactory = 
            //FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance();
        
//        final VisualWaypointLayer layer = new VisualWaypointLayer(
//            RemoteInfo.REMOTE_INFO,
//            (AdvancedRTSGameLayer) hashtable.get(Layer.ID),
//            (Group[]) hashtable.get(Group.ID),
//            GDFlagResources.getInstance().NAME,
//            new StringMaker().append(GDFlagResources.getInstance().NAME).append(
//                    CommonSeps.getInstance().SPACE).append(index++).toString(),
//                    featuredAnimationInterfaceFactoryInterfaceFactory.get(GDFlagResources.getInstance().RESOURCE),
//                    featuredAnimationInterfaceFactoryInterfaceFactory.getProcedural(
//                    ExplosionResources.getInstance().THIRD_EXPLOSION_RESOURCE),
//                    featuredAnimationInterfaceFactoryInterfaceFactory.getRectangle(GDFlagResources.getInstance().RESOURCE),
//            x, y);

        final BasicArrayList gameLayerList = new BasicArrayList();
        final BasicArrayList gameLayerDestroyedList = new BasicArrayList();
        final BasicArrayList behaviorList = new BasicArrayList();

        final Group[] groupInterface = {};
        final AnimationInterfaceFactoryInterface[] animationInterfaceFactoryInterfaceArray = 
            {NullRotationAnimationFactory.getFactoryInstance()};
            
        final ProceduralAnimationInterfaceFactoryInterface[] proceduralAnimationInterfaceFactoryInterfaceArray = 
            {NullRotationAnimationFactory.getFactoryInstance()};
        
        final Rectangle layerInfo = RectangleFactory.SINGLETON;
        final Rectangle[][] rectangleArrayOfArrays = new Rectangle[0][0];
        
        final GDGameLayerFactory gameLayerFactory = new GDGameLayerFactory(gameLayerList, gameLayerDestroyedList, 
            groupInterface,
            behaviorList,
            animationInterfaceFactoryInterfaceArray,
            proceduralAnimationInterfaceFactoryInterfaceArray,
            layerInfo,
            rectangleArrayOfArrays);
        
        final GDObject gdObject = new GDObject(null, x, y, z, 0, 0, NAME, null);
        
        final GDGameLayer layer = gameLayerFactory.create(-1, NAME, gdObject, 0, 0, new GDConditionWithGroupActions());
        
        layer.setAllBinaryGameLayerManager((AllBinaryGameLayerManager) hashtable.get(AllBinaryGameLayerManager.ID));

        return layer;
    }
}
