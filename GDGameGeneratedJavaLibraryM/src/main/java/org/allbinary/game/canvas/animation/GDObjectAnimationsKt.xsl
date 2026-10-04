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

    <xsl:template name="touchAnimationFactory" >
        <xsl:param name="platform" />
        <xsl:param name="enlargeTheImageBackgroundForRotation" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="layoutName" />
        <xsl:param name="lazy" />

        //objectsAssign - touchAnimationFactory - START
        val NaN: Int = 0
        val angleIncrement: Short = 1
        <xsl:for-each select="objects" >
            <xsl:variable name="objectIndex" select="position() - 1" />
            <xsl:variable name="typeValue" select="type" />
            <xsl:variable name="name" select="name" />
            <xsl:variable name="nameInUpperCase" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:if test="$typeValue = 'Sprite'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:if test="contains($name, 'btn_')" >
                //Animation Total: <xsl:value-of select="count(animations)" />

                val <xsl:value-of select="name" />ImageArray: Array&lt;Image&gt; = imageCache.getHashtableP().get(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>_IMAGE_ARRAY_NAME) as Array&lt;Image&gt;

                if(<xsl:value-of select="name" />ImageArray == null) {
                    throw Exception("<xsl:value-of select="name" />ImageArray was null (This happens 1 time during the initial loading)")
                } else {
                    this.logUtil.putF("<xsl:value-of select="name" />ImageArray found", this, this.commonStrings.INIT)
                }

<!--                <xsl:for-each select="animations" ><xsl:for-each select="directions/sprites/image" ><xsl:if test="position() != 1" >found</xsl:if></xsl:for-each></xsl:for-each>-->
                <xsl:variable name="hasMoreThanOneImage" >found</xsl:variable>
                val <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray: Array&lt;AnimationInterfaceFactoryInterface&gt; = {
                <xsl:for-each select="animations" >
                    <xsl:for-each select="directions" >
                    //looping=<xsl:value-of select="looping" /> timeBetweenFrames=<xsl:value-of select="timeBetweenFrames" />
                    </xsl:for-each>
                    //<xsl:value-of select="$name" />AnimationInterfaceFactoryInterfaceArray[<xsl:value-of select="position() - 1" />] =
                    <xsl:if test="contains($hasMoreThanOneImage, 'found')" >
                        <xsl:if test="contains($lazy, 'true')" >
                    LazyImageRotationAnimationFactory(<xsl:value-of select="$layoutIndex + 1" />, <xsl:value-of select="$objectIndex" />,
                        </xsl:if>
                    //<xsl:value-of select="$platform" />
                    OneRowSpriteIndexedAnimationFactory.createFactory(
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />]
                    //,
                    //-<xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />].getWidth() / 2,
                    //-<xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />].getHeight() / 2
                    //angleIncrement
                    </xsl:if>
                    <xsl:if test="not(contains($hasMoreThanOneImage, 'found'))" >
                        <xsl:if test="contains($lazy, 'true')" >
                    LazyImageRotationAnimationFactory(<xsl:value-of select="$layoutIndex + 1" />, <xsl:value-of select="$objectIndex" />,
                        </xsl:if>
                    AllBinary<xsl:value-of select="$platform" />ImageRotationAnimationFactory(
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />],
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />].getWidth(),
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />].getHeight(),
                    angleIncrement
                    </xsl:if>
                    <xsl:for-each select="directions" >,
                    IndexedAnimationBehaviorFactory(<xsl:if test="looping = 'true'" >-1</xsl:if><xsl:if test="looping = 'false'" >1</xsl:if>, <xsl:value-of select="timeBetweenFrames * 1000" />)
                    </xsl:for-each>
                    )
                        <xsl:if test="contains($lazy, 'true')" >
                    )
                        </xsl:if>
                    <xsl:if test="position() != last()" >,</xsl:if>
                </xsl:for-each>
                }

                val <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray: Array&lt;ProceduralAnimationInterfaceFactoryInterface&gt; = arrayOfNulls&lt;ProceduralAnimationInterfaceFactoryInterface&gt;(0)

                this.add(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_ANIMATION_NAME, AnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray))
                this.add(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_PROCEDURAL_ANIMATION_NAME, BaseAnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray))

                val <xsl:value-of select="name" />LayerInfo: Rectangle = Rectangle(
                                pointFactory.createXY(
                                <xsl:if test="animations/directions/sprites/originPoint/x != 0" >
                                (<xsl:value-of select="animations/directions/sprites/originPoint/x" /> * 36 / 25) - (<xsl:value-of select="animations/directions/sprites/originPoint/x" />),
                                </xsl:if>
                                <xsl:if test="animations/directions/sprites/originPoint/x = 0" >
                                0,
                                </xsl:if>
                                <xsl:if test="animations/directions/sprites/originPoint/y != 0" >
                                (<xsl:value-of select="animations/directions/sprites/originPoint/y" /> * 36 / 25) - </xsl:if> as <xsl:value-of select="animations/directions/sprites/originPoint/y" />
                                <xsl:if test="animations/directions/sprites/originPoint/y = 0" >
                                0
                                </xsl:if>
                                ),
                                <xsl:if test="animations/directions/sprites/originPoint/x = 0" >//</xsl:if>(<xsl:value-of select="animations/directions/sprites/originPoint/x" /> * animationScale).toInt(), (<xsl:value-of select="animations/directions/sprites/originPoint/y" /> * animationScale).toInt()
                                //old - <xsl:for-each select=".." ><xsl:for-each select="instances" ><xsl:if test="name = $name" ><xsl:if test="height = 0 or width = 0 or not(height) or not(width)" ><xsl:if test="animations/directions/sprites/originPoint/x = 0" ><xsl:value-of select="$name" />ImageArray[0].getWidth(), <xsl:value-of select="$name" />ImageArray[0].getHeight()</xsl:if></xsl:if><xsl:if test="height != 0 and width != 0" ><xsl:value-of select="width" />, <xsl:value-of select="height" /></xsl:if></xsl:if></xsl:for-each></xsl:for-each>
                                <!--
                                -->
                                <xsl:variable name="hasOriginPointX" ><xsl:if test="animations/directions/sprites/originPoint/x = 0" >found</xsl:if></xsl:variable>
                                <xsl:for-each select=".." >
                                    <xsl:variable name="hasInstance" ><xsl:for-each select="instances" ><xsl:if test="name = $name" >found</xsl:if></xsl:for-each></xsl:variable>
                                    <xsl:if test="not(contains($hasInstance, 'found'))" >
                                        //No instance available - probably should not set instance values here anyways. - probably should not set instance values here anyways.
                                        0, 0
                                    </xsl:if>
                                    <xsl:for-each select="instances" >
                                        <xsl:if test="name = $name" >
                                            <xsl:if test="contains(name, 'btn_')" >
                                                //btn_ - found
                                                <xsl:if test="height = 0 or width = 0 or not(height) or not(width)" >
                                                    <xsl:if test="contains($hasOriginPointX, 'found')" >
                                                        (<xsl:value-of select="$name" />ImageArray[0].getWidth() * scaleTouchButtons).toInt(), (<xsl:value-of select="$name" />ImageArray[0].getHeight() * scaleTouchButtons).toInt()
                                                    </xsl:if>
                                                </xsl:if>
                                                <xsl:if test="height != 0 and width != 0" >
                                                    (<xsl:value-of select="width" /> * scaleTouchButtons).toInt(), (<xsl:value-of select="height" /> * scaleTouchButtons).toInt()
                                                </xsl:if>
                                            </xsl:if>
                                            <xsl:if test="not(contains(name, 'btn_'))" >
                                                //btn_ - not
                                                <xsl:if test="height = 0 or width = 0 or not(height) or not(width)" >
                                                    <xsl:if test="contains($hasOriginPointX, 'found')" >
                                                        <xsl:value-of select="$name" />ImageArray[0].getWidth(), <xsl:value-of select="$name" />ImageArray[0].getHeight()
                                                    </xsl:if>
                                                </xsl:if>
                                                <xsl:if test="height != 0 and width != 0" >
                                                    <xsl:value-of select="width" />, <xsl:value-of select="height" />
                                                </xsl:if>
                                            </xsl:if>
                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:for-each>
                                )

                                <xsl:variable name="layerName" ><xsl:value-of select="name" /></xsl:variable>

                                <xsl:variable name="parentGroupIfAny" >
                                    <xsl:call-template name="getGroupsForLayer" >
                                        <xsl:with-param name="layerName" ><xsl:value-of select="$layerName" /></xsl:with-param>
                                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                this.addRectangle(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_RECTANGLE_NAME, <xsl:value-of select="name" />LayerInfo)

                <xsl:variable name="groupInterfaceArray" >
                    <xsl:if test="string-length($parentGroupIfAny) > 0" >arrayOf&lt;Group&gt;(globals.<xsl:value-of select="$parentGroupIfAny" />GroupInterface, <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GroupInterface)</xsl:if>
                    <xsl:if test="string-length($parentGroupIfAny) = 0" >arrayOf&lt;Group&gt;</xsl:if> as <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GroupInterface
                </xsl:variable>

                    <xsl:call-template name="objectsGroupsGDGameLayer" >
                        <xsl:with-param name="layerName" ><xsl:value-of select="$name" /></xsl:with-param>
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                    </xsl:call-template>

                </xsl:if>
            </xsl:if>

<!--
            <content>
                <DeadZoneRadius>0.3</DeadZoneRadius>
            </content>
-->
            <xsl:if test="$typeValue = 'SpriteMultitouchJoystick::SpriteMultitouchJoystick'" >
                <xsl:variable name="stringValue" select="string" />
            if(true) {
                //Animation Total: <xsl:value-of select="count(animations)" />

                val <xsl:value-of select="name" />ImageArray: Array&lt;Image&gt; = imageCache.getHashtableP().get(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_IMAGE_ARRAY_NAME) as Array&lt;Image&gt;

                if(<xsl:value-of select="name" />ImageArray == null) {
                    throw Exception("<xsl:value-of select="name" />ImageArray was null (This happens 1 time during the initial loading)")
                } else {
                    this.logUtil.putF("<xsl:value-of select="name" />ImageArray found", this, this.commonStrings.INIT)
                }

                <xsl:variable name="hasMoreThanOneImage" ><xsl:for-each select="animations" ><xsl:for-each select="directions/sprites/image" ><xsl:if test="position() != 1" >found</xsl:if></xsl:for-each></xsl:for-each></xsl:variable>
                <xsl:variable name="hasOriginPointX" ><xsl:if test="animations/directions/sprites/originPoint/x = 0" >found</xsl:if></xsl:variable>
                val denominator: Int = 2
                val <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray: Array&lt;AnimationInterfaceFactoryInterface&gt; = {
                <xsl:for-each select="childrenContent" >
                    <xsl:for-each select="Border" >
                        <xsl:if test="contains($lazy, 'true')" >
                    LazyImageRotationAnimationFactory(<xsl:value-of select="$layoutIndex + 1" />, <xsl:value-of select="$objectIndex" />,
                        </xsl:if>
                    AllBinary<xsl:value-of select="$platform" />ImageRotationAnimationFactory(
                        <xsl:value-of select="$name" />ImageArray[0],
                        <xsl:value-of select="$name" />ImageArray[0].getWidth(),
                        <xsl:value-of select="$name" />ImageArray[0].getHeight(),
                        angleIncrement,
                        AnimationBehaviorFactory.getInstance()
                        //IndexedAnimationBehaviorFactory(<xsl:if test="looping = 'true'" >-1</xsl:if><xsl:if test="looping = 'false'" >1</xsl:if>, <xsl:value-of select="timeBetweenFrames * 1000" />)
                        <xsl:if test="not($platform = 'Array' or $platform = 'HTML')" >, true</xsl:if>
                        )
                        <xsl:if test="contains($lazy, 'true')" >
                    )
                        </xsl:if>
                        ,
                    </xsl:for-each>
                    <xsl:for-each select="Thumb" >
                        <xsl:if test="contains($lazy, 'true')" >
                    LazyImageRotationAnimationFactory(<xsl:value-of select="$layoutIndex + 1" />, <xsl:value-of select="$objectIndex" />,
                        </xsl:if>
                    AllBinary<xsl:value-of select="$platform" />ImageRotationAnimationFactory(
                        <xsl:value-of select="$name" />ImageArray[1],
                        <xsl:value-of select="$name" />ImageArray[1].getWidth() / denominator,
                        <xsl:value-of select="$name" />ImageArray[1].getHeight() / denominator,
                        angleIncrement,
                        AnimationBehaviorFactory.getInstance()
                        //IndexedAnimationBehaviorFactory(<xsl:if test="looping = 'true'" >-1</xsl:if><xsl:if test="looping = 'false'" >1</xsl:if>, <xsl:value-of select="timeBetweenFrames * 1000" />)
                        <xsl:if test="not($platform = 'Array' or $platform = 'HTML')" >, true</xsl:if>
                        ) {

                        override public fun setInitialScale(scaleProperties: ScaleProperties) {
                            val scaleProperties2: ScaleProperties = ScaleProperties()
                            scaleProperties2.scaleHeight = scaleProperties.scaleHeight / denominator
                            scaleProperties2.scaleWidth = scaleProperties.scaleWidth / denominator
                            scaleProperties2.scaleX = scaleProperties.scaleX / denominator
                            scaleProperties2.scaleY = scaleProperties.scaleY / denominator
                            scaleProperties2.shouldScale = scaleProperties.shouldScale

                            val joystickScale: Float = if (org.allbinary.AndroidUtil.isAndroid()) 0.75f else 2.0f
                            this.animationFactoryInitializationVisitor.dx = (scaleProperties2.scaleWidth / (joystickScale * 3.33f)).toInt()
                            this.animationFactoryInitializationVisitor.dy = (scaleProperties2.scaleHeight / (joystickScale * 3.33f)).toInt()

                            super.setInitialScale(scaleProperties2)
                            //this.logUtil.put(this.scaleProperties.toString(), this, this.commonStrings.PROCESS)

                        }

                    }
                        <xsl:if test="contains($lazy, 'true')" >
                    )
                        </xsl:if>
                        <xsl:if test="position() != last()" >,</xsl:if>
                    </xsl:for-each>
                </xsl:for-each>
                }

                val <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray: Array&lt;ProceduralAnimationInterfaceFactoryInterface&gt; = arrayOfNulls&lt;ProceduralAnimationInterfaceFactoryInterface&gt;(0)

                val simultaneousCompoundIndexedAnimationInterfaceFactory: SimultaneousCompoundIndexedAnimationInterfaceFactory =
                    SimultaneousCompoundIndexedAnimationInterfaceFactory(<xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray, AnimationBehaviorFactory.getInstance())
                val joystickAnimationInterfaceFactoryInterfaceArray: Array&lt;AnimationInterfaceFactoryInterface&gt; = {
                    simultaneousCompoundIndexedAnimationInterfaceFactory
                }
                this.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_ANIMATION_NAME, AnimationInterfaceFactoryInterfaceComposite(joystickAnimationInterfaceFactoryInterfaceArray))
                this.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_PROCEDURAL_ANIMATION_NAME, BaseAnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray))

                val <xsl:value-of select="name" />LayerInfo: Rectangle = Rectangle(
                                pointFactory.createXY(
                                <xsl:if test="animations/directions/sprites/originPoint/x != 0" >
                                (<xsl:value-of select="animations/directions/sprites/originPoint/x" /> * 36 / 25) - (<xsl:value-of select="animations/directions/sprites/originPoint/x" />),
                                </xsl:if>
                                <xsl:if test="animations/directions/sprites/originPoint/x = 0" >
                                0,
                                </xsl:if>
                                <xsl:if test="animations/directions/sprites/originPoint/y != 0" >
                                (<xsl:value-of select="animations/directions/sprites/originPoint/y" /> * 36 / 25) - </xsl:if> as <xsl:value-of select="animations/directions/sprites/originPoint/y" />
                                <xsl:if test="animations/directions/sprites/originPoint/y = 0" >
                                0
                                </xsl:if>
                                <xsl:for-each select="childrenContent" >
                                    <xsl:for-each select="Border" >
                                0, 0
                                    </xsl:for-each>
                                </xsl:for-each>
                                ),
<!--                                <xsl:for-each select="childrenContent" >
                                    <xsl:for-each select="Border" >
                                (int) (<xsl:value-of select="$name" />ImageArray[0].getWidth()), (int) (<xsl:value-of select="$name" />ImageArray[0].getHeight())
                                    </xsl:for-each>
                                </xsl:for-each>-->
                                <xsl:if test="not(animations/directions/sprites/originPoint) or animations/directions/sprites/originPoint/x = 0" >//</xsl:if>(<xsl:value-of select="animations/directions/sprites/originPoint/x" /> * animationScale).toInt(), (<xsl:value-of select="animations/directions/sprites/originPoint/y" /> * animationScale).toInt()
                                //old - <xsl:for-each select=".." ><xsl:for-each select="instances" ><xsl:if test="name = $name" ><xsl:if test="height = 0 or width = 0 or not(height) or not(width)" ><xsl:if test="animations/directions/sprites/originPoint/x = 0" ><xsl:value-of select="$name" />ImageArray[0].getWidth(), <xsl:value-of select="$name" />ImageArray[0].getHeight()</xsl:if></xsl:if><xsl:if test="height != 0 and width != 0" ><xsl:value-of select="width" />, <xsl:value-of select="height" /></xsl:if></xsl:if></xsl:for-each></xsl:for-each>
                                <!--
                                -->
                                <xsl:for-each select=".." >
                                    <xsl:variable name="hasInstance" ><xsl:for-each select="instances" ><xsl:if test="name = $name" >found</xsl:if></xsl:for-each></xsl:variable>
                                    <xsl:if test="not(contains($hasInstance, 'found'))" >
                                        //No instance available - probably should not set instance values here anyways.
                                        <xsl:if test="contains($hasOriginPointX, 'found')" >
                                        <xsl:value-of select="$name" />ImageArray[0].getHeight(), <xsl:value-of select="$name" />ImageArray[0].getHeight()
                                        </xsl:if>
                                    </xsl:if>
                                    <xsl:for-each select="instances" >
                                        <xsl:if test="name = $name" >
                                        <xsl:if test="not(preceding-sibling::instances[name = $name])" >
                                            <xsl:if test="contains(name, 'btn_')" >
                                                //btn_ - found
                                                (<xsl:value-of select="$name" />ImageArray[0].getWidth() * scaleTouchButtons).toInt(), (<xsl:value-of select="$name" />ImageArray[0].getHeight() * scaleTouchButtons).toInt()
                                            </xsl:if>
                                            <xsl:if test="not(contains(name, 'btn_'))" >
                                                //btn_ - not 2
                                                <xsl:if test="height = 0 or width = 0 or not(height) or not(width)" >
                                                    <xsl:if test="contains($hasOriginPointX, 'found')" >
                                                        <xsl:value-of select="$name" />ImageArray[0].getWidth(), <xsl:value-of select="$name" />ImageArray[0].getHeight()
                                                    </xsl:if>
                                                </xsl:if>
                                                <xsl:if test="height != 0 and width != 0" >
                                                    (<xsl:value-of select="width" /> * scaleTouchButtons).toInt(), (<xsl:value-of select="height" /> * scaleTouchButtons).toInt()
                                                </xsl:if>
                                            </xsl:if>
                                        </xsl:if>
                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:for-each>
                                )

                                <xsl:variable name="layerName" ><xsl:value-of select="name" /></xsl:variable>

                                <xsl:variable name="parentGroupIfAny" >
                                    <xsl:call-template name="getGroupsForLayer" >
                                        <xsl:with-param name="layerName" ><xsl:value-of select="$layerName" /></xsl:with-param>
                                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                this.addRectangle(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_RECTANGLE_NAME, <xsl:value-of select="name" />LayerInfo)

                <xsl:variable name="animationName1" ><xsl:for-each select="animations" ><xsl:if test="position() = 1" ><xsl:value-of select="$name" /><xsl:value-of select="name" />1</xsl:if></xsl:for-each></xsl:variable>

                <xsl:for-each select="animations" >
<!--                 //Animation name = <xsl:value-of select="name" />-->
<!--                         or contains($name, 'MaskEnemy')-->
                    <xsl:if test="not(name or contains($name, 'Attack') or contains($name, 'Projectile')) or string-length(name) = 0" >
<!--                 //Not Attack or Projectile-->
                    <xsl:variable name="animationName" ><xsl:value-of select="name" /></xsl:variable>
                    <xsl:variable name="animationPosition" ><xsl:value-of select="position()" /></xsl:variable>
                    <xsl:variable name="animationTotal" ><xsl:value-of select="last()" /></xsl:variable>

                    <xsl:variable name="hasCustomCollisionMask" >
                        <xsl:for-each select="directions" >
                            <xsl:for-each select="sprites" >
                                <xsl:if test="hasCustomCollisionMask = 'true'" >
                                    <xsl:if test="position() = 1" >found</xsl:if>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:for-each>
                    </xsl:variable>

                    <xsl:if test="$animationPosition = 1" >
                        <xsl:if test="contains($hasMoreThanOneImage, 'found')" >
                val rectangleArrayOfArrays: Array&lt;Array&lt;Rectangle&gt;&gt; = Array(<xsl:value-of select="$animationTotal" />) { arrayOfNulls&lt;Rectangle&gt;(0) }
                        </xsl:if>
                        <xsl:if test="not(contains($hasMoreThanOneImage, 'found'))" >
                val rectangleArrayOfArrays: Array&lt;Array&lt;Rectangle&gt;&gt; = Array(<xsl:value-of select="$animationTotal" />) { arrayOfNulls&lt;Rectangle&gt;(360) }
                        </xsl:if>

                        <xsl:if test="contains($hasMoreThanOneImage, 'found') and contains($hasCustomCollisionMask, 'found')" >
                        </xsl:if>
                        <xsl:if test="not(contains($hasMoreThanOneImage, 'found') and contains($hasCustomCollisionMask, 'found'))" >
                //Auto generated CollisionMask for RotationAnimations
                val newX: Float = (<xsl:value-of select="$name" />LayerInfo.getWidth() * 1.44f - <xsl:value-of select="$name" />LayerInfo.getWidth()) / 2
                val newY: Float = (<xsl:value-of select="$name" />LayerInfo.getHeight() * 1.44f - <xsl:value-of select="$name" />LayerInfo.getHeight()) / 2
                val <xsl:value-of select="$name" />RotationCollisionMask: Rectangle = Rectangle(
                                pointFactory.createXY((newX * 3 * halfScale).toInt(), (newY * 3 * halfScale).toInt()), (<xsl:value-of select="$name" />LayerInfo.getWidth() * 3 * halfScale).toInt(), (<xsl:value-of select="$name" />LayerInfo.getHeight() * 3 * halfScale).toInt()
                                )
                        </xsl:if>
                    </xsl:if>

                    <xsl:if test="not(contains($hasMoreThanOneImage, 'found') and contains($hasCustomCollisionMask, 'found'))" >
                for(index2 in 0 until <xsl:value-of select="$animationTotal" />) {
                    for(index in 0 until 360) {
                        rectangleArrayOfArrays[index2][index] = <xsl:value-of select="$name" />RotationCollisionMask
                    }
                }
                    </xsl:if>

                    <xsl:if test="position() = 1" >

                    <xsl:for-each select="directions" >
                        <xsl:for-each select="sprites" >

                            <xsl:variable name="image" ><xsl:value-of select="image" /></xsl:variable>
                            <xsl:variable name="position" ><xsl:value-of select="position()" /></xsl:variable>
                            <xsl:variable name="last" ><xsl:value-of select="last()" /></xsl:variable>
                            <xsl:if test="hasCustomCollisionMask = 'true'" >

                            <xsl:for-each select="customCollisionMask" >
                //customCollisionMask - <xsl:value-of select="$image" />
                                    <xsl:if test="$position = 1" >
                val <xsl:value-of select="$name" /><xsl:value-of select="$animationName" /><xsl:value-of select="$position" />CollisionMask: Rectangle = Rectangle(
                                pointFactory.createXY((<xsl:value-of select="array[1]/x" /> * scale).toInt(), (<xsl:value-of select="array[1]/y" /> * scale).toInt()),
                                    ((<xsl:value-of select="array[3]/x" /> - <xsl:value-of select="array[1]/x" />) * scale).toInt(), ((<xsl:value-of select="array[4]/y" /> - <xsl:value-of select="array[1]/y" />) * scale).toInt()
                                )

//                this.logUtil.putF("Rectangle: " + <xsl:value-of select="$name" /><xsl:value-of select="$animationName" /><xsl:value-of select="$position" />CollisionMask, this, this.commonStrings.PROCESS)

                                    </xsl:if>

                            </xsl:for-each>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:for-each>

                    </xsl:if>

                    <xsl:for-each select="directions" >
                        <xsl:for-each select="sprites" >

                            <xsl:variable name="image" ><xsl:value-of select="image" /></xsl:variable>
                            <xsl:variable name="position" ><xsl:value-of select="position()" /></xsl:variable>
                            <xsl:variable name="last" ><xsl:value-of select="last()" /></xsl:variable>
                            <xsl:if test="hasCustomCollisionMask = 'true'" >

                            <xsl:if test="position() = 1" >
                                <xsl:if test="contains($hasMoreThanOneImage, 'found')" >
                rectangleArrayOfArrays[<xsl:value-of select="$animationPosition - 1" />] = arrayOfNulls&lt;Rectangle&gt;(<xsl:value-of select="last()" />)
                                </xsl:if>
                            </xsl:if>

                            <xsl:for-each select="customCollisionMask" >

                                <xsl:if test="contains($hasMoreThanOneImage, 'found')" >
                rectangleArrayOfArrays[<xsl:value-of select="$animationPosition - 1" />][<xsl:value-of select="$position - 1" />] = <xsl:value-of select="$animationName1" />CollisionMask
                                </xsl:if>
                                <xsl:if test="not(contains($hasMoreThanOneImage, 'found'))" >
                for(index2 in 0 until <xsl:value-of select="$animationTotal" />) {
                    for(index in 0 until 360) {
                        rectangleArrayOfArrays[index2][index] = <xsl:value-of select="$animationName1" />CollisionMask
                    }
                }
                                </xsl:if>

                            </xsl:for-each>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:for-each>

                    <xsl:if test="$animationPosition = last() and (contains($hasCustomCollisionMask, 'found') or not(contains($hasMoreThanOneImage, 'found') and contains($hasCustomCollisionMask, 'found')))" >
                this.addRectangleArrayOfArrays(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_ANIMATION_NAME, rectangleArrayOfArrays)
                    </xsl:if>

                    </xsl:if>
                </xsl:for-each>

                <xsl:for-each select="animations" >
                    <xsl:if test="string-length(name) > 0" >
                    <xsl:if test="$name != 'Player'" >
<!--                         or contains($name, 'MaskEnemy')-->
                    <xsl:if test="contains($name, 'Attack') or contains($name, 'Projectile')" >

                    <xsl:variable name="animationName" ><xsl:value-of select="name" /></xsl:variable>
                    <xsl:variable name="animationPosition" ><xsl:value-of select="position()" /></xsl:variable>
                    <xsl:variable name="animationTotal" ><xsl:value-of select="last()" /></xsl:variable>

                    <xsl:if test="$animationPosition = 1" >
                val rectangleArrayOfArrays: Array&lt;Array&lt;Rectangle&gt;&gt; = Array(<xsl:value-of select="$animationTotal" />) { arrayOfNulls&lt;Rectangle&gt;(0) }
                    </xsl:if>

                    <xsl:for-each select="directions" >
                        <xsl:for-each select="sprites" >
                            <xsl:if test="hasCustomCollisionMask = 'true'" >

                            <xsl:variable name="position" ><xsl:value-of select="position()" /></xsl:variable>
                            <xsl:variable name="last" ><xsl:value-of select="last()" /></xsl:variable>
                            //customCollisionMask - <xsl:value-of select="image" /> - Attack

                            <xsl:if test="position() = 1" >
                rectangleArrayOfArrays[<xsl:value-of select="$animationPosition - 1" />] = arrayOfNulls&lt;Rectangle&gt;(<xsl:value-of select="last()" />)
                            </xsl:if>

                            <xsl:for-each select="customCollisionMask" >
                val <xsl:value-of select="$name" /><xsl:value-of select="$animationName" /><xsl:value-of select="$position" />CollisionMask: Rectangle = Rectangle(
                                pointFactory.createXY((<xsl:value-of select="array[1]/x" /> * scale).toInt(), (<xsl:value-of select="array[1]/y" /> * scale).toInt()),
                                    ((<xsl:value-of select="array[3]/x" /> - <xsl:value-of select="array[1]/x" />) * scale).toInt(), ((<xsl:value-of select="array[4]/y" /> - <xsl:value-of select="array[1]/y" />) * scale).toInt()
                                )

//              this.logUtil.putF("Rectangle: " + <xsl:value-of select="$name" /><xsl:value-of select="$animationName" /><xsl:value-of select="$position" />CollisionMask, this, this.commonStrings.PROCESS)

                rectangleArrayOfArrays[<xsl:value-of select="$animationPosition - 1" />][<xsl:value-of select="$position - 1" />] = <xsl:value-of select="$name" /><xsl:value-of select="$animationName" /><xsl:value-of select="$position" />CollisionMask
                            </xsl:for-each>

                            </xsl:if>
                        </xsl:for-each>
                    </xsl:for-each>

                    <xsl:if test="$animationPosition = last()" >
                this.addRectangleArrayOfArrays(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_ANIMATION_NAME, rectangleArrayOfArrays)
                    </xsl:if>

                    </xsl:if>
                    </xsl:if>
                    </xsl:if>
                </xsl:for-each>

                <xsl:variable name="groupInterfaceArray" >
                    <xsl:if test="string-length($parentGroupIfAny) > 0" >arrayOf&lt;Group&gt;(globals.<xsl:value-of select="$parentGroupIfAny" />GroupInterface, <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GroupInterface)</xsl:if>
                    <xsl:if test="string-length($parentGroupIfAny) = 0" >arrayOf&lt;Group&gt;</xsl:if> as <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GroupInterface
                </xsl:variable>

                    <xsl:call-template name="objectsGroupsGDGameLayer" >
                        <xsl:with-param name="layerName" ><xsl:value-of select="$name" /></xsl:with-param>
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                    </xsl:call-template>

            }
            </xsl:if>

            <xsl:if test="$typeValue = 'TileMap::CollisionMask' or $typeValue = 'TileMap::TileMap' or type = 'TiledSpriteObject::TiledSprite' or $typeValue = 'ParticleSystem::ParticleEmitter'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:if test="contains($name, 'btn_')" >
                //Animation Total: <xsl:value-of select="count(animations)" />

                val <xsl:value-of select="name" />ImageArray: Array&lt;Image&gt; = imageCache.getHashtableP().get(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>_IMAGE_ARRAY_NAME) as Array&lt;Image&gt;

                if(<xsl:value-of select="name" />ImageArray == null) {
                    throw Exception("<xsl:value-of select="name" />ImageArray was null (This happens 1 time during the initial loading)")
                } else {
                    this.logUtil.putF("<xsl:value-of select="name" />ImageArray found", this, this.commonStrings.INIT)
                }

                val <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray: Array&lt;AnimationInterfaceFactoryInterface&gt; = {
                    NullRotationAnimationFactory.getFactoryInstance()
                }

                val <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray: Array&lt;ProceduralAnimationInterfaceFactoryInterface&gt; = arrayOfNulls&lt;ProceduralAnimationInterfaceFactoryInterface&gt;(0)

                this.add(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_ANIMATION_NAME, AnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray))
                this.add(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_PROCEDURAL_ANIMATION_NAME, BaseAnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray))

                val <xsl:value-of select="name" />LayerInfo: Rectangle = Rectangle(
                                pointFactory.createXY(0, 0),
                                0, 0
                                )

                                <xsl:variable name="layerName" ><xsl:value-of select="name" /></xsl:variable>

                                <xsl:variable name="parentGroupIfAny" >
                                    <xsl:call-template name="getGroupsForLayer" >
                                        <xsl:with-param name="layerName" ><xsl:value-of select="$layerName" /></xsl:with-param>
                                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                this.addRectangle(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_RECTANGLE_NAME, <xsl:value-of select="name" />LayerInfo)

                <xsl:variable name="groupInterfaceArray" >
                    <xsl:if test="string-length($parentGroupIfAny) > 0" >arrayOf&lt;Group&gt;(globals.<xsl:value-of select="$parentGroupIfAny" />GroupInterface, <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GroupInterface)</xsl:if>
                    <xsl:if test="string-length($parentGroupIfAny) = 0" >arrayOf&lt;Group&gt;</xsl:if> as <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GroupInterface
                </xsl:variable>

                    <xsl:call-template name="objectsGroupsGDGameLayer" >
                        <xsl:with-param name="layerName" ><xsl:value-of select="$name" /></xsl:with-param>
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                    </xsl:call-template>

                </xsl:if>
            </xsl:if>

            <xsl:if test="$typeValue = 'TextObject::Text'" >
                <xsl:variable name="stringValue" select="string" />

                //final GDConditionWithGroupActions <xsl:value-of select="name" />GDConditionWithGroupActions = GDConditionWithGroupActions()

            </xsl:if>

            <xsl:if test="$typeValue = 'TextEntryObject::String'" >
                <xsl:variable name="stringValue" select="string" />

                //final GDConditionWithGroupActions <xsl:value-of select="name" />GDConditionWithGroupActions = GDConditionWithGroupActions()

            </xsl:if>

        </xsl:for-each>
        //objectsAssign = touchAnimationFactory - END
    </xsl:template>

    <xsl:template name="animationNames" >
        <xsl:param name="enlargeTheImageBackgroundForRotation" />
        <xsl:param name="layoutIndex" />

        //objects - all - //objectsAssign - animationNames - START
        <xsl:for-each select="objects" >
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="type" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

                <xsl:variable name="stringValue" select="string" />
                //Animation Total: <xsl:value-of select="count(animations)" />

                public val <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_IMAGE_ARRAY_NAME: String = "<xsl:value-of select="name" />_image_array"

                public val <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_ANIMATION_NAME: String = "<xsl:value-of select="name" />_animation"

                public val <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_PROCEDURAL_ANIMATION_NAME: String = "<xsl:value-of select="name" />_procedural_animation"

                public val <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_RECTANGLE_NAME: String = "<xsl:value-of select="name" />_rectangle"

        </xsl:for-each>
        //objects - all - //objectsAssign - animationNames - END
    </xsl:template>

</xsl:stylesheet>
