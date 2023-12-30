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

    <xsl:template name="objectsProperties" >
        <xsl:param name="enlargeTheImageBackgroundForRotation" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="instancesAsString" />

        //objectsAssign - objectsProperties - START
        <xsl:for-each select="objects" >
            <xsl:variable name="typeValue" select="type" />
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:if test="$typeValue = 'Sprite'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                //Animation Total: <xsl:value-of select="count(animations)" />
                public final AnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray;
                public final ProceduralAnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray;
                public final Rectangle <xsl:value-of select="name" />LayerInfo;

                                <xsl:variable name="layerName" ><xsl:value-of select="name" /></xsl:variable>

                                <xsl:variable name="parentGroupIfAny" >
                                <xsl:for-each select="/game">
                                    <xsl:for-each select="layouts" >
                                        <xsl:variable name="layoutIndex2" select="position() - 1" />
                                        <xsl:if test="number($layoutIndex2) = $layoutIndex" >
                                            <xsl:for-each select="objectsGroups" >
                                                <xsl:variable name="groupName">
                                                    <xsl:value-of select="name" />
                                                </xsl:variable>
                                                <xsl:for-each select="objects" >
                                                    <xsl:if test="name = $layerName" >
                                                        <xsl:value-of select="$groupName" />
                                                    </xsl:if>
                                                </xsl:for-each>
                                            </xsl:for-each>
                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:for-each>
                                </xsl:variable>
                                
                <xsl:variable name="groupInterfaceArray" >
                    <xsl:if test="string-length($parentGroupIfAny) > 0" >new Group[] {globals.<xsl:value-of select="$parentGroupIfAny" />GroupInterface, <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />GroupInterface}</xsl:if>
                    <xsl:if test="string-length($parentGroupIfAny) = 0" >new Group[] {<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />GroupInterface}</xsl:if>
                </xsl:variable>
                
                //objectsGroupsGDGameLayer - START
                <xsl:for-each select="/game">
                    <xsl:for-each select="layouts" >
                        <xsl:variable name="layoutIndex2" select="position() - 1" />
                        <xsl:if test="number($layoutIndex2) = $layoutIndex" >
                            
                            <xsl:for-each select="objectsGroups" >
                                <xsl:variable name="groupName">
                                    <xsl:value-of select="name" />
                                </xsl:variable>
                                <xsl:for-each select="objects" >
                                    <xsl:if test="name = $layerName" >
                //this.<xsl:value-of select="$layerName" />GroupInterface = <xsl:value-of select="$layerName" />GroupInterface;
                                    </xsl:if>
                                </xsl:for-each>
                            </xsl:for-each>

                        </xsl:if>
                    </xsl:for-each>
                </xsl:for-each>
                //objectsGroupsGDGameLayer - END
                
            </xsl:if>

            <xsl:if test="$typeValue = 'TileMap::CollisionMask' or $typeValue = 'TileMap::TileMap' or $typeValue = 'ParticleSystem::ParticleEmitter'" >
                <xsl:variable name="stringValue" select="string" />

                public final AnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray;
                public final ProceduralAnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray;
                public final Rectangle <xsl:value-of select="name" />LayerInfo;

            </xsl:if>

            <xsl:if test="$typeValue = 'TextObject::Text'" >
                <xsl:variable name="stringValue" select="string" />

                /*
                public final AnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray;
                public final ProceduralAnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray;
                public final Rectangle <xsl:value-of select="name" />LayerInfo;

                */

                /*
                final GDObject gdObject = (GDObject) <xsl:value-of select="name" />List.get(0);
                public final GDGameLayer <xsl:value-of select="name" />GDGameLayer = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />GDGameLayerFactory.create(stringBuilder.append(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>).append(CommonSeps.getInstance().UNDERSCORE).append(index).toString(), , null); //<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />GDConditionWithGroupActions);
                <xsl:value-of select="name" />GDGameLayer.setGDObject(allBinaryGameLayerManager, gdObject);

                <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />GDGameLayerList.add(<xsl:value-of select="name" />GDGameLayer);
                */

            </xsl:if>
            <xsl:if test="$typeValue = 'TextEntryObject::TextEntry'" >
                <xsl:variable name="stringValue" select="string" />

                public AnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray = null;
                public ProceduralAnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray = null;
                public final Rectangle <xsl:value-of select="name" />LayerInfo;

            </xsl:if>

        </xsl:for-each>
        //objectsAssign - objectsProperties - END
    </xsl:template>

    <xsl:template name="objectsAssign" >
        <xsl:param name="enlargeTheImageBackgroundForRotation" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="instancesAsString" />

        //objectsAssign - START
        <xsl:for-each select="objects" >
            <xsl:variable name="typeValue" select="type" />
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:if test="$typeValue = 'TileMap::CollisionMask' or $typeValue = 'TileMap::TileMap' or $typeValue = 'Sprite' or $typeValue = 'ParticleSystem::ParticleEmitter'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                //Animation Total: <xsl:value-of select="count(animations)" />
                this.<xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray = (AnimationInterfaceFactoryInterface[]) ((AnimationInterfaceFactoryInterfaceComposite) animationInterfaceFactoryInterfaceFactory.getBasicAnimationInterfaceFactoryInstance(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_ANIMATION_NAME)).getAnimationInterfaceFactoryInterfaceArray();
                this.<xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray = (ProceduralAnimationInterfaceFactoryInterface[]) ((BaseAnimationInterfaceFactoryInterfaceComposite) animationInterfaceFactoryInterfaceFactory.getBasicAnimationInterfaceFactoryInstance(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_PROCEDURAL_ANIMATION_NAME)).getBasicAnimationInterfaceFactoryInterfaceArray();
                this.<xsl:value-of select="name" />LayerInfo = animationInterfaceFactoryInterfaceFactory.getRectangle(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_RECTANGLE_NAME);

                                <xsl:variable name="layerName" ><xsl:value-of select="name" /></xsl:variable>

                                <xsl:variable name="parentGroupIfAny" >
                                <xsl:for-each select="/game">
                                    <xsl:for-each select="layouts" >
                                        <xsl:variable name="layoutIndex2" select="position() - 1" />
                                        <xsl:if test="number($layoutIndex2) = $layoutIndex" >
                                            <xsl:for-each select="objectsGroups" >
                                                <xsl:variable name="groupName">
                                                    <xsl:value-of select="name" />
                                                </xsl:variable>
                                                <xsl:for-each select="objects" >
                                                    <xsl:if test="name = $layerName" >
                                                        <xsl:value-of select="$groupName" />
                                                    </xsl:if>
                                                </xsl:for-each>
                                            </xsl:for-each>
                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:for-each>
                                </xsl:variable>
                                
                <xsl:variable name="groupInterfaceArray" >
                    <xsl:if test="string-length($parentGroupIfAny) > 0" >new Group[] {globals.<xsl:value-of select="$parentGroupIfAny" />GroupInterface, <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />GroupInterface}</xsl:if>
                    <xsl:if test="string-length($parentGroupIfAny) = 0" >new Group[] {<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />GroupInterface}</xsl:if>
                </xsl:variable>
                
                //objectsGroupsGDGameLayer - START
                <xsl:for-each select="/game">
                    <xsl:for-each select="layouts" >
                        <xsl:variable name="layoutIndex2" select="position() - 1" />
                        <xsl:if test="number($layoutIndex2) = $layoutIndex" >
                            
                            <xsl:for-each select="objectsGroups" >
                                <xsl:variable name="groupName">
                                    <xsl:value-of select="name" />
                                </xsl:variable>
                                <xsl:for-each select="objects" >
                                    <xsl:if test="name = $layerName" >
                //this.<xsl:value-of select="$layerName" />GroupInterface = <xsl:value-of select="$layerName" />GroupInterface;
                                    </xsl:if>
                                </xsl:for-each>
                            </xsl:for-each>

                        </xsl:if>
                    </xsl:for-each>
                </xsl:for-each>
                //objectsGroupsGDGameLayer - END
                
                final BasicArrayList <xsl:value-of select="name" />BehaviorList = new BasicArrayList();
                
                <xsl:for-each select="behaviors" >
                //Behavior name=<xsl:value-of select="name" /> as <xsl:value-of select="type" />
                    <xsl:if test="type = 'PlatformBehavior::PlatformerObjectBehavior'" >

<!--     
              "gravity": 250,
              "jumpSpeed": 150,
              "jumpSustainTime": 0.2,
              "maxFallingSpeed": 200,
              "ladderClimbingSpeed": 100,
              "yGrabOffset": 0,
              //"maxSpeed": 100,
              //"acceleration": 400,
              "canGrabPlatforms": false,
              "deceleration": 400,
              "ignoreDefaultControls": false,
              "roundCoordinates": true,
              "slopeMaxAngle": 60,
              "xGrabTolerance": 10
-->
                
                //behaviorList.add(new GDPlatformerObjectBehavior());
                    </xsl:if>
                </xsl:for-each>

                <xsl:variable name="hasMoreThanOneImage" ><xsl:for-each select="animations" ><xsl:for-each select="directions/sprites/image" ><xsl:if test="position() != 1" >found</xsl:if></xsl:for-each></xsl:for-each></xsl:variable>

                this.<xsl:value-of select="name" />GDGameLayerFactory = new GDCustomGameLayerFactory(
                    <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />GDGameLayerList,
                    <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />GDGameLayerDestroyedList,
                    <xsl:value-of select="$groupInterfaceArray" />,
                    <xsl:value-of select="name" />BehaviorList,
                    <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray,
                    <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray,
                    <xsl:value-of select="name" />LayerInfo
                    <xsl:if test="contains($hasMoreThanOneImage, 'found')" >, AnimationBehavior.getInstance()</xsl:if>
                    <xsl:if test="contains(name, 'btn_')" >, AnimationBehaviorBase.getInstance()</xsl:if>
                    );

            </xsl:if>

            <xsl:if test="$typeValue = 'TextObject::Text'" >
                <xsl:variable name="stringValue" select="string" />

                /*
                this.<xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray = {
                    NullRotationAnimationFactory.getFactoryInstance()
                };
                this.<xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray = new ProceduralAnimationInterfaceFactoryInterface[0];
                this.<xsl:value-of select="name" />LayerInfo = new Rectangle(
                                PointFactory.getInstance().getInstance(0, 0),
                                0, 0
                                );

                final BasicArrayList <xsl:value-of select="name" />BehaviorList = new BasicArrayList();
                
                this.<xsl:value-of select="name" />GDGameLayerFactory = new GDCustomGameLayerFactory(
                    <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />GDGameLayerList,
                    <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />GDGameLayerDestroyedList,
                    new Group[] {<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />GroupInterface},
                    <xsl:value-of select="name" />BehaviorList,
                    <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray,
                    <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray,
                    <xsl:value-of select="name" />LayerInfo);
                */

                //<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />GDGameLayerList.add(<xsl:value-of select="name" />GDGameLayer);

                //this.<xsl:value-of select="name" />GDGameLayerFactory = new NullGDGameLayerFactory();

            </xsl:if>
            <xsl:if test="$typeValue = 'TextEntryObject::TextEntry'" >
                <xsl:variable name="stringValue" select="string" />

                this.<xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray = new AnimationInterfaceFactoryInterface[1];
                this.<xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray[0] = new RotationAnimationFactory();
                this.<xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray = new ProceduralAnimationInterfaceFactoryInterface[1];
                this.<xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray[0] = new RotationAnimationFactory();

                this.<xsl:value-of select="name" />LayerInfo = new Rectangle(
                                PointFactory.getInstance().getInstance(0, 0),
                                0, 0
                                );

                final BasicArrayList <xsl:value-of select="name" />BehaviorList = new BasicArrayList();
                
                this.<xsl:value-of select="name" />GDGameLayerFactory = new GDCustomGameLayerFactory(
                    <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />GDGameLayerList,
                    <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />GDGameLayerDestroyedList,
                    new Group[] {<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />GroupInterface},
                    <xsl:value-of select="name" />BehaviorList,
                    <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray,
                    <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray,
                    <xsl:value-of select="name" />LayerInfo);

                //<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />GDGameLayerList.add(<xsl:value-of select="name" />GDGameLayer);

                //this.<xsl:value-of select="name" />GDGameLayerFactory = new NullGDGameLayerFactory();

            </xsl:if>

        </xsl:for-each>
        //objectsAssign - END
    </xsl:template>

</xsl:stylesheet>
