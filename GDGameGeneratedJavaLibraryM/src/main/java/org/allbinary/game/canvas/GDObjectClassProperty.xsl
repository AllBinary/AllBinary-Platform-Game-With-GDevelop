<?xml version="1.0" encoding="windows-1252"?>

<!--
AllBinary Open License Version 1
Copyright (c) 2011 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template name="addFromInstancesCache" >
        <xsl:param name="layoutName" />

            final ABToGBUtil abToGBUtil = ABToGBUtil.getInstance();
            final AllBinaryGameLayerManager allBinaryGameLayerManager = abToGBUtil.allBinaryGameLayerManager;

            int size;
            GDGameLayer gameLayer;
            
        <xsl:for-each select="/game/objects" >
            <xsl:variable name="name" ><xsl:value-of select="name" /></xsl:variable>
            <xsl:variable name="type" ><xsl:value-of select="type" /></xsl:variable>
            <xsl:for-each select="/game/layouts" >
                <xsl:if test="$layoutName = name" >
                    <xsl:for-each select="instances" >
                        <xsl:if test="name = $name" >
                        <xsl:variable name="id" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                        <xsl:variable name="hasPriorInstanceWithSameName" ><xsl:if test="../instances[name = $name and number(substring(generate-id(), 2) - 65536) &lt; $id]" >found</xsl:if></xsl:variable>
                            <xsl:if test="not(contains($hasPriorInstanceWithSameName, 'found'))" >
            //Global reinit instance
            size = globals.<xsl:value-of select="name" />GDInstanceGDGameLayerList.size();
            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                gameLayer = (GDGameLayer) globals.<xsl:value-of select="name" />GDInstanceGDGameLayerList.get(index);
                gameLayer.gdObject.reset();
                gameLayer.setAllBinaryGameLayerManager(allBinaryGameLayerManager);
                <xsl:if test="$type != 'TextObject::Text'" >
                allBinaryGameLayerManager.insert(gameLayer);
                </xsl:if>
            }
                                
            <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.addAll(
                globals.<xsl:value-of select="name" />GDInstanceGDGameLayerList);
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>
                        
        <xsl:for-each select="objects" >
            <xsl:variable name="name" ><xsl:value-of select="name" /></xsl:variable>
            <xsl:variable name="type" ><xsl:value-of select="type" /></xsl:variable>
                <xsl:for-each select="../instances" >
                <xsl:if test="name = $name" >
            //Layout reinit instance
            size = globals.<xsl:value-of select="name" />GDInstanceGDGameLayerList.size();
            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                gameLayer = (GDGameLayer) globals.<xsl:value-of select="name" />GDInstanceGDGameLayerList.get(index);
                gameLayer.gdObject.reset();
                gameLayer.setAllBinaryGameLayerManager(allBinaryGameLayerManager);
                <xsl:if test="$type != 'TextObject::Text'" >
                allBinaryGameLayerManager.insert(gameLayer);
                </xsl:if>
            }

            <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.addAll(
                globals.<xsl:value-of select="name" />GDInstanceGDGameLayerList);
                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>
    
    </xsl:template>

    <xsl:template name="instancesCacheProperties" >
        <xsl:param name="layoutName" />
    
        <xsl:for-each select="/game/objects" >
            <xsl:variable name="name" ><xsl:value-of select="name" /></xsl:variable>
            <xsl:for-each select="/game/layouts" >
                <xsl:if test="$layoutName = name" >
                    <xsl:for-each select="instances" >
                        <xsl:if test="name = $name" >
                        <xsl:variable name="id" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                        <xsl:variable name="hasPriorInstanceWithSameName" ><xsl:if test="../instances[name = $name and number(substring(generate-id(), 2) - 65536) &lt; $id]" >found</xsl:if></xsl:variable>
                            <xsl:if test="not(contains($hasPriorInstanceWithSameName, 'found'))" >
            //Global specific objects
            public final BasicArrayList <xsl:value-of select="name" />GDInstanceGDGameLayerList = new BasicArrayList(this.arrayUtil.ZERO_OBJECT_ARRAY);
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>
                        
        <xsl:for-each select="objects" >
            <xsl:variable name="name" ><xsl:value-of select="name" /></xsl:variable>
                <xsl:for-each select="../instances" >
                <xsl:if test="name = $name" >
            //Layout specific objects
            public final BasicArrayList <xsl:value-of select="name" />GDInstanceGDGameLayerList = new BasicArrayList(this.arrayUtil.ZERO_OBJECT_ARRAY);
                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>
    
    </xsl:template>
    
    <xsl:template name="objectsClassProperty" >
        <xsl:variable name="windowWidth" select="/game/properties/windowWidth" />

        <xsl:variable name="behaviorsAsString" ><xsl:for-each select="objects" ><xsl:for-each select="behaviors" ><xsl:value-of select="type" />,</xsl:for-each></xsl:for-each></xsl:variable>

        //behaviorsAsString=<xsl:value-of select="$behaviorsAsString" />
        <xsl:if test="contains($behaviorsAsString, 'DestroyOutsideBehavior::DestroyOutside,')" >
            public final GDBehavior destroyOutsideBehavior = new DestroyOutsideBehavior();
        </xsl:if>
        
        //objectsClassProperty - START
        <xsl:for-each select="objects" >
            <xsl:variable name="typeValue" select="type" />

            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>
            <xsl:for-each select="behaviors" >
                //Behavior name=<xsl:value-of select="name" /> as <xsl:value-of select="type" /> extraBorder=<xsl:value-of select="extraBorder" />
            </xsl:for-each>
                        
            <xsl:for-each select="animations" >
                <xsl:for-each select="directions" >

                    <xsl:for-each select="sprites" >
<!--         
                //image=<xsl:value-of select="image" /> hasCustomCollisionMask=<xsl:value-of select="hasCustomCollisionMask" />
                //OriginPoint name=<xsl:value-of select="originPoint/name" /> x=<xsl:value-of select="originPoint/x" /> y=<xsl:value-of select="originPoint/y" />
                //CenterPoint name=<xsl:value-of select="centerPoint/name" /> x=<xsl:value-of select="centerPoint/x" /> y=<xsl:value-of select="centerPoint/y" /> automatic=<xsl:value-of select="centerPoint/automatic" />
                //customCollisionMask, array, x, y
-->
                        <xsl:for-each select="points" >
                //Point name=<xsl:value-of select="name" /> x=<xsl:value-of select="x" /> y=<xsl:value-of select="y" />
                //public final GPoint <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_POINT = pointFactory.getInstance(<xsl:value-of select="x" />, <xsl:value-of select="y" />, 0);
                public final GPoint <xsl:value-of select="name" /> = pointFactory.getInstance(<xsl:value-of select="x" />, <xsl:value-of select="y" />, 0);
                        </xsl:for-each>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>

            <xsl:if test="content" >
                //TileMap::TileMap:content
            </xsl:if>

            <xsl:if test="$typeValue = 'PrimitiveDrawing::Drawer'" >
                //PrimitiveDrawing::Drawer
                public final String <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template> = "<xsl:value-of select="name" />";
                //public final BasicArrayList <xsl:value-of select="name" />GDGameLayerList = new BasicArrayList(this.arrayUtil.ZERO_OBJECT_ARRAY);
                public final BasicArrayList <xsl:value-of select="name" />CacheGDGameLayerList = new BasicArrayList(this.arrayUtil.ZERO_OBJECT_ARRAY);
                //Unlike Sprite PrimitiveDrawing does not use Create
                //public final BasicArrayList <xsl:value-of select="name" />GDObjectList = new BasicArrayList();
            </xsl:if>
            <xsl:if test="$typeValue = 'Sprite'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                <xsl:variable name="NAME" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>

                //Sprite
                //private BasicArrayList <xsl:value-of select="name" />List = ZERO_GD_OBJECT;
                //private BasicArrayList <xsl:value-of select="name" />GDGameLayerList;
                //public final BasicArrayList <xsl:value-of select="name" />GDGameLayerList = new BasicArrayList(this.arrayUtil.ZERO_OBJECT_ARRAY);
                public final BasicArrayList <xsl:value-of select="name" />CacheGDGameLayerList = new BasicArrayList(this.arrayUtil.ZERO_OBJECT_ARRAY);
                //public final GDConditionWithGroupActions <xsl:value-of select="name" />GDConditionWithGroupActions = new GDConditionWithGroupActions();
            </xsl:if>

            <xsl:if test="$typeValue = 'TileMap::CollisionMask' or $typeValue = 'TileMap::TileMap'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                <xsl:variable name="NAME" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>

                //<xsl:value-of select="$typeValue" />
                //private BasicArrayList <xsl:value-of select="name" />List = ZERO_GD_OBJECT;
                //private BasicArrayList <xsl:value-of select="name" />GDGameLayerList;
                //public final BasicArrayList <xsl:value-of select="name" />GDGameLayerList = new BasicArrayList(this.arrayUtil.ZERO_OBJECT_ARRAY);
                public final BasicArrayList <xsl:value-of select="name" />CacheGDGameLayerList = new BasicArrayList(this.arrayUtil.ZERO_OBJECT_ARRAY);
                //public final GDConditionWithGroupActions <xsl:value-of select="name" />GDConditionWithGroupActions = new GDConditionWithGroupActions();
            </xsl:if>

            <xsl:if test="$typeValue = 'ParticleSystem::ParticleEmitter'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                <xsl:variable name="NAME" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>

                //ParticleSystem::ParticleEmitter
                //private BasicArrayList <xsl:value-of select="name" />List = ZERO_GD_OBJECT;
                //private BasicArrayList <xsl:value-of select="name" />GDGameLayerList;
                //public final BasicArrayList <xsl:value-of select="name" />GDGameLayerList = new BasicArrayList(this.arrayUtil.ZERO_OBJECT_ARRAY);
                public final BasicArrayList <xsl:value-of select="name" />CacheGDGameLayerList = new BasicArrayList(this.arrayUtil.ZERO_OBJECT_ARRAY);
                //public final GDConditionWithGroupActions <xsl:value-of select="name" />GDConditionWithGroupActions = new GDConditionWithGroupActions();
            </xsl:if>
            <xsl:if test="$typeValue = 'TextObject::Text'" >
                <xsl:variable name="stringValue" select="string" />

                //TextObject::Text
                public final String <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_OBJECT_NAME = "<xsl:value-of select="name" />";
                //public final BasicArrayList <xsl:value-of select="name" />GDGameLayerList = new BasicArrayList(this.arrayUtil.ZERO_OBJECT_ARRAY);
                public final BasicArrayList <xsl:value-of select="name" />CacheGDGameLayerList = new BasicArrayList(this.arrayUtil.ZERO_OBJECT_ARRAY);
                public final BasicArrayList <xsl:value-of select="name" />GDGameLayerDestroyedList = new BasicArrayList();
            </xsl:if>
            <xsl:if test="$typeValue = 'TextInput::TextInputObject'" >
                <xsl:variable name="stringValue" select="string" />

                //TextInput::TextInputObject
                public final String <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_OBJECT_NAME = "<xsl:value-of select="name" />";
                //public final BasicArrayList <xsl:value-of select="name" />GDGameLayerList = new BasicArrayList(this.arrayUtil.ZERO_OBJECT_ARRAY);
                public final BasicArrayList <xsl:value-of select="name" />GDGameLayerDestroyedList = new BasicArrayList();
            </xsl:if>
            <xsl:if test="$typeValue = 'TextEntryObject::TextEntry'" >
                <xsl:variable name="stringValue" select="string" />

                //TextEntryObject::TextEntry
                public final String <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template> = "<xsl:value-of select="name" />";
                //public final BasicArrayList <xsl:value-of select="name" />GDGameLayerList = new BasicArrayList(this.arrayUtil.ZERO_OBJECT_ARRAY);
                public final BasicArrayList <xsl:value-of select="name" />GDGameLayerDestroyedList = new BasicArrayList();

                //public final GDConditionWithGroupActions <xsl:value-of select="name" />GDConditionWithGroupActions = new GDConditionWithGroupActions();
            </xsl:if>

        </xsl:for-each>

        <xsl:for-each select="objects" >
            <xsl:variable name="typeValue" select="type" />
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:if test="$typeValue = 'Sprite'" >
                //Sprite - create properties
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                <xsl:variable name="NAME" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>
                public final String <xsl:value-of select="$NAME" />_OBJECT_NAME = "<xsl:value-of select="name" />";
                //public final GDGameLayerFactory <xsl:value-of select="name" />GDGameLayerFactory;
            </xsl:if>
            <xsl:if test="$typeValue = 'PrimitiveDrawing::Drawer'" >
                //PrimitiveDrawing::Drawer - create properties
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                <xsl:variable name="NAME" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>
                public final String <xsl:value-of select="$NAME" />_OBJECT_NAME = "<xsl:value-of select="name" />";
                //public final GDGameLayerFactory <xsl:value-of select="name" />GDGameLayerFactory;
            </xsl:if>
            <xsl:if test="$typeValue = 'ParticleSystem::ParticleEmitter'" >
                //ParticleSystem::ParticleEmitter - create properties
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                <xsl:variable name="NAME" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>
                public final String <xsl:value-of select="$NAME" />_OBJECT_NAME = "<xsl:value-of select="name" />";
                //public final GDGameLayerFactory <xsl:value-of select="name" />GDGameLayerFactory;
            </xsl:if>
            
            <xsl:if test="$typeValue = 'TileMap::TileMap'" >
                //TileMap::TileMap - create properties
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                <xsl:variable name="NAME" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>
                public final String <xsl:value-of select="$NAME" />_OBJECT_NAME = "<xsl:value-of select="name" />";
                //public final GDGameLayerFactory <xsl:value-of select="name" />GDGameLayerFactory;
            </xsl:if>
            
            <xsl:if test="$typeValue = 'TileMap::CollisionMask'" >
                //TileMap::TileMap - create properties
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                <xsl:variable name="NAME" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>
                public final String <xsl:value-of select="$NAME" />_OBJECT_NAME = "<xsl:value-of select="name" />";
                //public final GDGameLayerFactory <xsl:value-of select="name" />GDGameLayerFactory;
            </xsl:if>
            
            <xsl:if test="$typeValue = 'TextObject::Text'" >
                //TextObject::Text - create properties
                <xsl:variable name="stringValue" select="string" />
                public final int <xsl:value-of select="name" />TextAnimationSize;
                <xsl:variable name="stringValue2" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$stringValue" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="'&quot;'" /></xsl:with-param><xsl:with-param name="replacementText" >\"</xsl:with-param></xsl:call-template></xsl:variable>
                <xsl:variable name="multilineString" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$stringValue2" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="'&#10;'" /></xsl:with-param><xsl:with-param name="replacementText" >\n").append("</xsl:with-param></xsl:call-template></xsl:variable>

                public final CustomTextAnimation <xsl:value-of select="name" />TextAnimation;

                <xsl:variable name="name2" >,<xsl:value-of select="name" />,</xsl:variable>

            </xsl:if>
            //public Rectangle <xsl:value-of select="name" />Rectangle = null;

        </xsl:for-each>
        //objectsClassProperty - END

    </xsl:template>

    <xsl:template name="objectsClassPropertyAssignment" >
        <xsl:variable name="windowWidth" select="/game/properties/windowWidth" />

        <xsl:for-each select="objects" >
            <xsl:variable name="typeValue" select="type" />
            
            <xsl:if test="$typeValue = 'TextObject::Text'" >
                //TextObject::Text - set properties
                <xsl:variable name="stringValue" select="string" />
                this.<xsl:value-of select="name" />TextAnimationSize = (<xsl:value-of select="characterSize" />);
                <xsl:variable name="stringValue2" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$stringValue" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="'&quot;'" /></xsl:with-param><xsl:with-param name="replacementText" >\"</xsl:with-param></xsl:call-template></xsl:variable>
                <xsl:variable name="multilineString" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$stringValue2" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="'&#10;'" /></xsl:with-param><xsl:with-param name="replacementText" >\n").append("</xsl:with-param></xsl:call-template></xsl:variable>

                this.<xsl:value-of select="name" />TextAnimation =
                    new CustomTextAnimation(new StringMaker().append("<xsl:value-of select="$multilineString" />").toString(), <xsl:value-of select="name" />TextAnimationSize + (scale * 4));

                //this.<xsl:value-of select="name" />TextAnimation.setScale(scale, scale);

                <xsl:variable name="name2" >,<xsl:value-of select="name" />,</xsl:variable>

            </xsl:if>

        </xsl:for-each>

    </xsl:template>
     
    <xsl:template name="layerManagerEventListenerList" >

        <xsl:variable name="behaviorsAsString" ><xsl:for-each select="objects" ><xsl:for-each select="behaviors" ><xsl:value-of select="type" />,</xsl:for-each></xsl:for-each></xsl:variable>
            
        //layerManagerEventListenerList - START
        <xsl:for-each select="objects" >
            
            <xsl:if test="type = 'Sprite'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                <xsl:variable name="NAME" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>
                //Sprite - layerManagerEventListenerList
                public final BasicArrayList <xsl:value-of select="name" />GDGameLayerDestroyedList = new BasicArrayList(arrayUtil.ZERO_OBJECT_ARRAY);
            </xsl:if>
            <xsl:if test="type = 'ParticleSystem::ParticleEmitter'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                <xsl:variable name="NAME" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>
                //ParticleSystem::ParticleEmitter - layerManagerEventListenerList
                public final BasicArrayList <xsl:value-of select="name" />GDGameLayerDestroyedList = new BasicArrayList(arrayUtil.ZERO_OBJECT_ARRAY);
            </xsl:if>
            <xsl:if test="type = 'PrimitiveDrawing::Drawer'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                <xsl:variable name="NAME" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>
                //PrimitiveDrawing::Drawer - layerManagerEventListenerList
                public final BasicArrayList <xsl:value-of select="name" />GDGameLayerDestroyedList = new BasicArrayList(arrayUtil.ZERO_OBJECT_ARRAY);
            </xsl:if>
            <xsl:if test="type = 'TileMap::TileMap'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                <xsl:variable name="NAME" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>
                //TileMap::TileMap - layerManagerEventListenerList
                public final BasicArrayList <xsl:value-of select="name" />GDGameLayerDestroyedList = new BasicArrayList(arrayUtil.ZERO_OBJECT_ARRAY);
            </xsl:if>

            <xsl:if test="type = 'TileMap::CollisionMask'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                <xsl:variable name="NAME" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>
                //TileMap::CollisionMask - layerManagerEventListenerList
                public final BasicArrayList <xsl:value-of select="name" />GDGameLayerDestroyedList = new BasicArrayList(arrayUtil.ZERO_OBJECT_ARRAY);
            </xsl:if>

        </xsl:for-each>

        //layerManagerEventListenerList - END

    </xsl:template>

    <xsl:template name="layerManagerEventListenerRemove" >

        <xsl:variable name="behaviorsAsString" ><xsl:for-each select="objects" ><xsl:for-each select="behaviors" ><xsl:value-of select="type" />,</xsl:for-each></xsl:for-each></xsl:variable>
            
        //layerManagerEventListenerRemove - START
        <xsl:for-each select="objects" >

            <xsl:if test="type = 'Sprite'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                <xsl:variable name="NAME" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>
                //Sprite - Add to cache
                if(<xsl:value-of select="name" />GDGameLayerDestroyedList.contains(layerInterface)) {
                    <xsl:value-of select="name" />GDGameLayerDestroyedList.remove(layerInterface);
                    if(!<xsl:value-of select="name" />CacheGDGameLayerList.contains(layerInterface)) {
                        <xsl:value-of select="name" />CacheGDGameLayerList.add(layerInterface);
                    } else {
                        //LogUtil.put(LogFactory.getInstance(gameLayerStrings.MULTIPLE_TIMES + layerInterface, this, commonStrings.PROCESS));
                    }
                }
            </xsl:if>
            <xsl:if test="type = 'ParticleSystem::ParticleEmitter'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                <xsl:variable name="NAME" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>
                //ParticleSystem::ParticleEmitter - Add to cache
                if(<xsl:value-of select="name" />GDGameLayerDestroyedList.contains(layerInterface)) {
                    <xsl:value-of select="name" />GDGameLayerDestroyedList.remove(layerInterface);
                    if(!<xsl:value-of select="name" />CacheGDGameLayerList.contains(layerInterface)) {
                        <xsl:value-of select="name" />CacheGDGameLayerList.add(layerInterface);
                    } else {
                        //LogUtil.put(LogFactory.getInstance(gameLayerStrings.MULTIPLE_TIMES + layerInterface, this, commonStrings.PROCESS));
                    }
                }
           </xsl:if>

        </xsl:for-each>

        //layerManagerEventListenerRemove - END

    </xsl:template>

</xsl:stylesheet>
