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

        //objects - all - //objectsAssign - objectsProperties - START
        <xsl:for-each select="objects" >
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="type" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:if test="type = 'Sprite'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                //Animation Total: <xsl:value-of select="count(animations)" />
                public final AnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray;
                public final ProceduralAnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray;
                public final Rectangle <xsl:value-of select="name" />LayerInfo;
                public final Rectangle[][] <xsl:value-of select="name" />RectangleArrayOfArrays;

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
                    <xsl:if test="string-length($parentGroupIfAny) > 0" >new Group[] {globals.<xsl:value-of select="$parentGroupIfAny" />GroupInterface, <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GroupInterface}</xsl:if>
                    <xsl:if test="string-length($parentGroupIfAny) = 0" >new Group[] {<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GroupInterface}</xsl:if>
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

            <xsl:if test="type != 'Sprite'" >
                <xsl:variable name="stringValue" select="string" />

                public final AnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray;
                public final ProceduralAnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray;
                public final Rectangle <xsl:value-of select="name" />LayerInfo;
                public final Rectangle[][] <xsl:value-of select="name" />RectangleArrayOfArrays;

            </xsl:if>

        </xsl:for-each>
        //objects - all - //objectsAssign - objectsProperties - END
    </xsl:template>

    <xsl:template name="objectsAssign" >
        <xsl:param name="enlargeTheImageBackgroundForRotation" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="instancesAsString" />

                int colorAsInt = 0;
                BasicColor basicColor = null;
                int size = 0;
        
        //objects - all - //objectsAssign - START
        <xsl:for-each select="objects" >
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="type" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:if test="type != 'PrimitiveDrawing::Drawer'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                //Animation Total: <xsl:value-of select="count(animations)" />
                this.<xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray = (AnimationInterfaceFactoryInterface[]) ((AnimationInterfaceFactoryInterfaceComposite) animationInterfaceFactoryInterfaceFactory.getBasicAnimationInterfaceFactoryInstance(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_ANIMATION_NAME)).getAnimationInterfaceFactoryInterfaceArray();
                this.<xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray = (ProceduralAnimationInterfaceFactoryInterface[]) ((BaseAnimationInterfaceFactoryInterfaceComposite) animationInterfaceFactoryInterfaceFactory.getBasicAnimationInterfaceFactoryInstance(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_PROCEDURAL_ANIMATION_NAME)).getBasicAnimationInterfaceFactoryInterfaceArray();
                this.<xsl:value-of select="name" />LayerInfo = animationInterfaceFactoryInterfaceFactory.getRectangle(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_RECTANGLE_NAME);
                this.<xsl:value-of select="name" />RectangleArrayOfArrays = animationInterfaceFactoryInterfaceFactory.getRectangleArrayOfArrays(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_ANIMATION_NAME);

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
                    <xsl:if test="string-length($parentGroupIfAny) > 0" >new Group[] {globals.<xsl:value-of select="$parentGroupIfAny" />GroupInterface, <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GroupInterface}</xsl:if>
                    <xsl:if test="string-length($parentGroupIfAny) = 0" >new Group[] {<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GroupInterface}</xsl:if>
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

                <xsl:if test="type = 'TextObject::Text'" >
                    
                colorAsInt = basicColorUtil.get(255, <xsl:for-each select="color" ><xsl:value-of select="r" />, <xsl:value-of select="g" />, <xsl:value-of select="b" />);</xsl:for-each>
                basicColor = smallBasicColorCacheFactory.getInstance(colorAsInt);

                //TextObject::Text - set the layer size from the initial text
                final CustomTextAnimationFactory <xsl:value-of select="name" />CustomTextAnimationFactory = (CustomTextAnimationFactory) <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray[0];
                <xsl:value-of select="name" />CustomTextAnimationFactory.basicColor = basicColor;
                <xsl:value-of select="name" />LayerInfo.setWidth((int) (<xsl:value-of select="name" />CustomTextAnimationFactory.getWidth()));
                <xsl:value-of select="name" />LayerInfo.setHeight((int) (<xsl:value-of select="name" />CustomTextAnimationFactory.getHeight()));
                </xsl:if>

                <xsl:if test="type = 'PanelSpriteSlider::PanelSpriteSlider'" >

                colorAsInt = basicColorUtil.get(255, <xsl:for-each select="childrenContent" ><xsl:for-each select="Label" ><xsl:for-each select="color" ><xsl:value-of select="r" />, <xsl:value-of select="g" />, <xsl:value-of select="b" />);</xsl:for-each></xsl:for-each></xsl:for-each>
                basicColor = smallBasicColorCacheFactory.getInstance(colorAsInt);

                //PanelSpriteSlider::PanelSpriteSlider - set the layer size from the initial text
                final SliderAnimationInterfaceFactory <xsl:value-of select="name" />SliderAnimationInterfaceFactory = (SliderAnimationInterfaceFactory) <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray[0];
                final AnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray = <xsl:value-of select="name" />SliderAnimationInterfaceFactory.getBasicAnimationInterfaceFactoryInterfaceArray();
                final CustomTextAnimationFactory <xsl:value-of select="name" />CustomTextAnimationFactory = (CustomTextAnimationFactory) <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray[4];
                <xsl:value-of select="name" />CustomTextAnimationFactory.basicColor = basicColor;
                </xsl:if>


                this.<xsl:value-of select="name" />GDGameLayerFactory = new GDCustomGameLayerFactory(
                    NullAnimationFactory.getFactoryInstance(),
                    <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList,
                    <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerDestroyedList,
                    <xsl:value-of select="$groupInterfaceArray" />,
                    <xsl:value-of select="name" />BehaviorList,
                    this.<xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray,
                    this.<xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray,
                    <xsl:value-of select="name" />LayerInfo,
                    <xsl:value-of select="name" />RectangleArrayOfArrays
                    <xsl:if test="contains($hasMoreThanOneImage, 'found')" >, GDIndividualAnimationBehavior.getInstance()</xsl:if>
                    <xsl:if test="type = 'PanelSpriteSlider::PanelSpriteSlider'" >, new GDSliderAnimationBehavior()</xsl:if>
                    <xsl:if test="type = 'TextInput::TextInputObject'" >, new GDTextInputAnimationBehavior()</xsl:if>
                    <xsl:if test="type = 'TextObject::Text'" >, GDAnimationBehaviorBaseFactory.getInstance()</xsl:if>
                    <xsl:if test="contains(name, 'btn_')" >, GDAnimationBehaviorBaseFactory.getInstance()</xsl:if>
                    ) 
                    <xsl:if test="type = 'TextObject::Text'" >
                    {

                        @Override
                        public Rectangle init(final GDObject gdObject, final float scaleX, final float scaleY) {
                            //text animation sizing
                            //logUtil.put("CustomTextAnimation", this, "init");
                            final CustomTextAnimationFactory customTextAnimationFactory = (CustomTextAnimationFactory) animationInterfaceFactoryInterfaceArray[0];

                            gdObject.width = (int) (customTextAnimationFactory.getWidth());
                            gdObject.height = (int) (customTextAnimationFactory.getHeight());

                            final Rectangle rectangle = new Rectangle(
                                PointFactory.getInstance().ZERO_ZERO,
                                (int) (this.layerInfo.getWidth()), 
                                (int) (this.layerInfo.getHeight())
                            );
                                                
                            return rectangle;
                        }

                    }</xsl:if>;

            </xsl:if>

            <xsl:if test="type = 'PrimitiveDrawing::Drawer'" >
                <xsl:variable name="stringValue" select="string" />

                this.<xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray = new AnimationInterfaceFactoryInterface[] {
                    NullRotationAnimationFactory.getFactoryInstance()
                };
                this.<xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray = new ProceduralAnimationInterfaceFactoryInterface[0];
                this.<xsl:value-of select="name" />LayerInfo = new Rectangle(
                                pointFactory.getInstance(0, 0),
                                0, 0
                                );
                this.<xsl:value-of select="name" />RectangleArrayOfArrays = new Rectangle[0][0];

                final BasicArrayList <xsl:value-of select="name" />BehaviorList = new BasicArrayList();
                
                //PrimitiveDrawing::Drawer - factory
                this.<xsl:value-of select="name" />GDGameLayerFactory = new GDCustomGameLayerFactory(
                    new GDRectOnlyPrimitiveDrawingAnimationFactory(),
                    <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList,
                    <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerDestroyedList,
                    new Group[] {<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GroupInterface},
                    <xsl:value-of select="name" />BehaviorList,
                    <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray,
                    <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray,
                    <xsl:value-of select="name" />LayerInfo,
                    <xsl:value-of select="name" />RectangleArrayOfArrays);

                //<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.add(<xsl:value-of select="name" />GDGameLayer);

                //this.<xsl:value-of select="name" />GDGameLayerFactory = new NullGDGameLayerFactory();

            </xsl:if>

        </xsl:for-each>
        //objects - all - //objectsAssign - END
    </xsl:template>

</xsl:stylesheet>
