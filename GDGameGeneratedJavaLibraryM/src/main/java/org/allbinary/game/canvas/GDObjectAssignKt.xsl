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
                public val <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray: Array&lt;AnimationInterfaceFactoryInterface&gt;
                public val <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray: Array&lt;ProceduralAnimationInterfaceFactoryInterface&gt;
                public val <xsl:value-of select="name" />LayerInfo: Rectangle
                public val <xsl:value-of select="name" />RectangleArrayOfArrays: Array&lt;Array&lt;Rectangle&gt;&gt;

                                <xsl:variable name="layerName" ><xsl:value-of select="name" /></xsl:variable>

                                <xsl:variable name="parentGroupIfAny" >
                                    <xsl:call-template name="getGroupsForLayer" >
                                        <xsl:with-param name="layerName" ><xsl:value-of select="$layerName" /></xsl:with-param>
                                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>

                <xsl:variable name="groupInterfaceArray" >
                    <xsl:if test="string-length($parentGroupIfAny) > 0" >arrayOf&lt;Group&gt;(globals.<xsl:value-of select="$parentGroupIfAny" />GroupInterface, <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GroupInterface)</xsl:if>
                    <xsl:if test="string-length($parentGroupIfAny) = 0" >arrayOf&lt;Group&gt;</xsl:if> as <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GroupInterface
                </xsl:variable>

                    <xsl:call-template name="objectsGroupsGDGameLayer" >
                        <xsl:with-param name="layerName" ><xsl:value-of select="$name" /></xsl:with-param>
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                    </xsl:call-template>

            </xsl:if>

            <xsl:if test="type != 'Sprite'" >
                <xsl:variable name="stringValue" select="string" />

                public val <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray: Array&lt;AnimationInterfaceFactoryInterface&gt;
                public val <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray: Array&lt;ProceduralAnimationInterfaceFactoryInterface&gt;
                public val <xsl:value-of select="name" />LayerInfo: Rectangle
                public val <xsl:value-of select="name" />RectangleArrayOfArrays: Array&lt;Array&lt;Rectangle&gt;&gt;

            </xsl:if>

        </xsl:for-each>
        //objects - all - //objectsAssign - objectsProperties - END
    </xsl:template>

    <xsl:template name="objectsAssign" >
        <xsl:param name="enlargeTheImageBackgroundForRotation" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="instancesAsString" />

                var colorAsInt: Int = 0
                var basicColor: BasicColor = null
                var size: Int = 0

        //objects - all - //objectsAssign - START
        <xsl:for-each select="objects" >
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="type" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:if test="type != 'PrimitiveDrawing::Drawer'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                //Animation Total: <xsl:value-of select="count(animations)" />
                this.<xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray = (animationInterfaceFactoryInterfaceFactory.getBasicAnimationInterfaceFactoryInstance(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_ANIMATION_NAME) as AnimationInterfaceFactoryInterfaceComposite) as Array&lt;AnimationInterfaceFactoryInterface&gt;.getAnimationInterfaceFactoryInterfaceArray()
                this.<xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray = (animationInterfaceFactoryInterfaceFactory.getBasicAnimationInterfaceFactoryInstance(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_PROCEDURAL_ANIMATION_NAME) as BaseAnimationInterfaceFactoryInterfaceComposite) as Array&lt;ProceduralAnimationInterfaceFactoryInterface&gt;.getBasicAnimationInterfaceFactoryInterfaceArray()
                this.<xsl:value-of select="name" />LayerInfo = animationInterfaceFactoryInterfaceFactory.getRectangle(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_RECTANGLE_NAME)
                this.<xsl:value-of select="name" />RectangleArrayOfArrays = animationInterfaceFactoryInterfaceFactory.getRectangleArrayOfArrays(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_ANIMATION_NAME)

                                <xsl:variable name="layerName" ><xsl:value-of select="name" /></xsl:variable>

                                <xsl:variable name="parentGroupIfAny" >
                                    <xsl:call-template name="getGroupsForLayer" >
                                        <xsl:with-param name="layerName" ><xsl:value-of select="$layerName" /></xsl:with-param>
                                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>

                <xsl:variable name="groupInterfaceArray" >
                    <xsl:if test="string-length($parentGroupIfAny) > 0" >arrayOf&lt;Group&gt;(globals.<xsl:value-of select="$parentGroupIfAny" />GroupInterface, <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GroupInterface)</xsl:if>
                    <xsl:if test="string-length($parentGroupIfAny) = 0" >arrayOf&lt;Group&gt;</xsl:if> as <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GroupInterface
                </xsl:variable>

                    <xsl:call-template name="objectsGroupsGDGameLayer" >
                        <xsl:with-param name="layerName" ><xsl:value-of select="$name" /></xsl:with-param>
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                    </xsl:call-template>

                val <xsl:value-of select="name" />BehaviorList: BasicArrayList = BasicArrayListD()

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

                //behaviorList.add(GDPlatformerObjectBehavior())
                    </xsl:if>
                </xsl:for-each>

                <xsl:variable name="hasMoreThanOneImage" ><xsl:for-each select="animations" ><xsl:for-each select="directions/sprites/image" ><xsl:if test="position() != 1" >found</xsl:if></xsl:for-each></xsl:for-each></xsl:variable>

                <xsl:if test="type = 'TextObject::Text'" >

                colorAsInt = basicColorUtil.getARGB(255, <xsl:for-each select="color" ><xsl:value-of select="r" />, <xsl:value-of select="g" />, <xsl:value-of select="b" />)</xsl:for-each>
                basicColor = smallBasicColorCacheFactory.getAndOrCreate(colorAsInt)

                //TextObject::Text - set the layer size from the initial text
                val <xsl:value-of select="name" />CustomTextAnimationFactory: CustomTextAnimationFactory = <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray[0] as CustomTextAnimationFactory
                <xsl:value-of select="name" />CustomTextAnimationFactory.basicColor = basicColor
                <xsl:value-of select="name" />LayerInfo.setWidth((<xsl:value-of select="name" />CustomTextAnimationFactory.getWidth() / scale).toInt())
                <xsl:value-of select="name" />LayerInfo.setHeight((<xsl:value-of select="name" />CustomTextAnimationFactory.getHeight()).toInt())
                </xsl:if>

                <xsl:if test="type = 'PanelSpriteSlider::PanelSpriteSlider'" >

                colorAsInt = basicColorUtil.getARGB(255, <xsl:for-each select="childrenContent" ><xsl:for-each select="Label" ><xsl:for-each select="color" ><xsl:value-of select="r" />, <xsl:value-of select="g" />, <xsl:value-of select="b" />)</xsl:for-each></xsl:for-each></xsl:for-each>
                basicColor = smallBasicColorCacheFactory.getAndOrCreate(colorAsInt)

                //PanelSpriteSlider::PanelSpriteSlider - set the layer size from the initial text
                val <xsl:value-of select="name" />SliderAnimationInterfaceFactory: SliderAnimationInterfaceFactory = <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray[0] as SliderAnimationInterfaceFactory
                val <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray: Array&lt;AnimationInterfaceFactoryInterface&gt; = <xsl:value-of select="name" />SliderAnimationInterfaceFactory.getBasicAnimationInterfaceFactoryInterfaceArray()
                val <xsl:value-of select="name" />CustomTextAnimationFactory: CustomTextAnimationFactory = <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray[4] as CustomTextAnimationFactory
                <xsl:value-of select="name" />CustomTextAnimationFactory.basicColor = basicColor
                </xsl:if>

                <xsl:variable name="threedExclusionsFound" ><xsl:for-each select="/game/properties/threedExclusions" ><xsl:if test="name = $name" >found</xsl:if></xsl:for-each></xsl:variable>

                this.<xsl:value-of select="name" />GDGameLayerFactory = GDCustomGameLayerFactory(
                    NullAnimationFactory.getFactoryInstance(),
                    <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList,
                    <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerDestroyedList,
                    <xsl:value-of select="$groupInterfaceArray" />,
                    <xsl:value-of select="name" />BehaviorList,
                    this.<xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray,
                    this.<xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray,
                    <xsl:value-of select="name" />LayerInfo,
                    <xsl:value-of select="name" />RectangleArrayOfArrays
                    <xsl:variable name="hasMoreThanOneImageOrRotationDisabled" ><xsl:if test="contains($hasMoreThanOneImage, 'found')" >found</xsl:if><xsl:if test="/game/properties/custom[name = name and rotation]" >found</xsl:if></xsl:variable>
                    <xsl:choose>
                        <xsl:when test="type = 'PanelSpriteSlider::PanelSpriteSlider'" >, GDSliderAnimationBehaviorFactory.getInstance()</xsl:when>
                        <xsl:when test="type = 'TextInput::TextInputObject'" >, GDTextInputAnimationBehaviorFactory.getInstance()</xsl:when>
                        <xsl:when test="type = 'TextObject::Text'" >, GDAnimationBehaviorBaseFactory.getInstance()</xsl:when>
                        <xsl:when test="contains(name, 'btn_')" ><xsl:if test="type = 'SpriteMultitouchJoystick::SpriteMultitouchJoystick'" >, GDSoftJoystickAnimationBehaviorBaseFactory.getInstance()</xsl:if><xsl:if test="not(type = 'SpriteMultitouchJoystick::SpriteMultitouchJoystick')" >, GDAnimationBehaviorBaseFactory.getInstance()</xsl:if></xsl:when>
                        <xsl:when test="contains($hasMoreThanOneImageOrRotationDisabled, 'found')" >, <xsl:if test="contains($threedExclusionsFound, 'found')" >GDIndividualAnimationBehaviorFactory.getInstance()</xsl:if><xsl:if test="not(contains($threedExclusionsFound, 'found'))" >if (isThreed) GDRotationBehaviorFactory.getInstance() else GDIndividualAnimationBehaviorFactory.getInstance()</xsl:if></xsl:when>
                        <xsl:otherwise>
                            //Otherwise - <xsl:value-of select="type" />
                        </xsl:otherwise>
                    </xsl:choose>


                    )
                    <xsl:if test="type = 'TextObject::Text'" >
                    {

                        override public fun init(gdObject: GDObject, scaleX: Float, scaleY: Float): Rectangle {
                            //text animation sizing
                            //this.logUtil.putF("CustomTextAnimation", this, "init")
                            val customTextAnimationFactory: CustomTextAnimationFactory = animationInterfaceFactoryInterfaceArray[0] as CustomTextAnimationFactory

                            gdObject.width = (<xsl:value-of select="name" />CustomTextAnimationFactory.getWidth() / scale).toInt()
                            gdObject.height = (customTextAnimationFactory.getHeight()).toInt()

                            val rectangle: Rectangle = Rectangle(
                                pointFactory.getInstance().ZERO_ZERO,
                                (this.layerInfo.getWidth()).toInt(),
                                (this.layerInfo.getHeight()).toInt()
                            )

                            var rectangle: return
                        }

                    }</xsl:if>

            </xsl:if>

            <xsl:if test="type = 'PrimitiveDrawing::Drawer'" >
                <xsl:variable name="stringValue" select="string" />

                this.<xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray = arrayOf&lt;AnimationInterfaceFactoryInterface&gt;(
                    NullRotationAnimationFactory.getFactoryInstance()
                )
                this.<xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray = arrayOfNulls&lt;ProceduralAnimationInterfaceFactoryInterface&gt;(0)
                this.<xsl:value-of select="name" />LayerInfo = Rectangle(
                                pointFactory.createXY(0, 0),
                                0, 0
                                )
                this.<xsl:value-of select="name" />RectangleArrayOfArrays = Array(0) { arrayOfNulls&lt;Rectangle&gt;(0) }

                val <xsl:value-of select="name" />BehaviorList: BasicArrayList = BasicArrayListD()

                //PrimitiveDrawing::Drawer - factory
                this.<xsl:value-of select="name" />GDGameLayerFactory = GDCustomGameLayerFactory(

                <xsl:variable name="name" ><xsl:value-of select="name" /></xsl:variable>

                <xsl:variable name="groupsForLayer" >
                    <xsl:call-template name="getGroupsForLayer" >
                        <xsl:with-param name="layerName" ><xsl:value-of select="$name" /></xsl:with-param>
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                    </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="primitiveDrawingEventsUsedByObject" >
                    <xsl:for-each select="/game">
                        <xsl:for-each select="layouts" >
                            <xsl:variable name="layoutIndex2" select="position() - 1" />
                            <xsl:call-template name="primitiveDrawingEventsUsedByObject" >
                                <xsl:with-param name="object" ><xsl:value-of select="$name" /></xsl:with-param>
                            </xsl:call-template>
                            <xsl:call-template name="primitiveDrawingEventsUsedByObject" >
                                <xsl:with-param name="object" ><xsl:value-of select="$groupsForLayer" /></xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                    </xsl:for-each>

                    <xsl:for-each select="//externalEvents">
                            <xsl:call-template name="primitiveDrawingEventsUsedByObject" >
                                <xsl:with-param name="object" ><xsl:value-of select="$name" /></xsl:with-param>
                            </xsl:call-template>
                            <xsl:call-template name="primitiveDrawingEventsUsedByObject" >
                                <xsl:with-param name="object" ><xsl:value-of select="$groupsForLayer" /></xsl:with-param>
                            </xsl:call-template>
                    </xsl:for-each>

                </xsl:variable>

                //primitiveDrawingEventsUsedByObject=<xsl:value-of select="$primitiveDrawingEventsUsedByObject" />
                <xsl:text>&#10;</xsl:text>
                <xsl:choose>
                <xsl:when test="contains($primitiveDrawingEventsUsedByObject, 'PrimitiveDrawing::Rectangle')" >
                    GDRectOnlyPrimitiveDrawingAnimationFactory(),
                </xsl:when>
                <xsl:when test="contains($primitiveDrawingEventsUsedByObject, 'PrimitiveDrawing::LineV2')" >
                    GDPrimitiveDrawingLinesOnlyAnimationFactory(),
                </xsl:when>
                <xsl:otherwise>
                    //This is the default and means the Object is not actually used.
                    <xsl:text>&#10;</xsl:text>
                    GDRectOnlyPrimitiveDrawingAnimationFactory(),
                </xsl:otherwise>
                </xsl:choose>

                    <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList,
                    <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerDestroyedList,
                    arrayOf&lt;Group&gt;(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GroupInterface),
                    <xsl:value-of select="name" />BehaviorList,
                    <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray,
                    <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray,
                    <xsl:value-of select="name" />LayerInfo,
                    <xsl:value-of select="name" />RectangleArrayOfArrays)

                //<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.add(<xsl:value-of select="name" />GDGameLayer)

                //this.<xsl:value-of select="name" />GDGameLayerFactory = NullGDGameLayerFactory()

            </xsl:if>

        </xsl:for-each>
        //objects - all - //objectsAssign - END
    </xsl:template>

    <xsl:template name="primitiveDrawingEventsUsedByObject" >
        <xsl:param name="object" />

        <xsl:for-each select="events" >
        <xsl:for-each select="actions" >
            <xsl:variable name="typeValue" ><xsl:value-of select="type/value" /></xsl:variable>
            <xsl:if test="contains($typeValue, 'PrimitiveDrawing::')" >
                <xsl:variable name="param" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
<!--                //object = param? <xsl:value-of select="$object" /> =? <xsl:value-of select="$param" />-->
                <xsl:if test="$object = $param" >//<xsl:value-of select="$typeValue" />,</xsl:if>
            </xsl:if>
        </xsl:for-each>

        <xsl:call-template name="primitiveDrawingEventsUsedByObject" >
            <xsl:with-param name="object" ><xsl:value-of select="$object" /></xsl:with-param>
        </xsl:call-template>

        </xsl:for-each>

    </xsl:template>

    <xsl:template name="getGroupsForLayer" >
        <xsl:param name="layerName" />
        <xsl:param name="layoutIndex" />

        <xsl:for-each select="/game">
            <xsl:for-each select="layouts" >
                <xsl:variable name="layoutIndex2" select="position() - 1" />
                <xsl:if test="number($layoutIndex2) = $layoutIndex" >
                    <xsl:for-each select="objectsGroups" >
                        <xsl:variable name="groupName"><xsl:value-of select="name" /></xsl:variable>
                        <xsl:for-each select="objects" >
                            <xsl:if test="name = $layerName" >
                                <xsl:value-of select="$groupName" />
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:for-each>
                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>

    </xsl:template>

    <xsl:template name="objectsGroupsGDGameLayer" >
        <xsl:param name="layerName" />
        <xsl:param name="layoutIndex" />

<!--                //objectsGroupsGDGameLayer - START
                <xsl:for-each select="/game">
                    <xsl:for-each select="layouts" >
                        <xsl:variable name="layoutIndex2" select="position() - 1" />
                        <xsl:if test="number($layoutIndex2) = $layoutIndex" >

                            <xsl:for-each select="objectsGroups" >
                                <xsl:for-each select="objects" >
                                    <xsl:if test="name = $layerName" >
                //this.<xsl:value-of select="$layerName" />GroupInterface = <xsl:value-of select="$layerName" />GroupInterface;
                                    </xsl:if>
                                </xsl:for-each>
                            </xsl:for-each>

                        </xsl:if>
                    </xsl:for-each>
                </xsl:for-each>
                //objectsGroupsGDGameLayer - END-->

    </xsl:template>

</xsl:stylesheet>
