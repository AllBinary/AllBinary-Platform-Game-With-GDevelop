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

    <xsl:template name="getSetSizeForObject" >
        <xsl:param name="name" />
        
        <xsl:for-each select="events" >
            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'ResizableCapability::ResizableBehavior::SetSize'" >
                    <xsl:if test="parameters[1] = $name" >
                        //Action -  ResizableCapability::ResizableBehavior::SetSize - <xsl:value-of select="parameters[1]" />/<xsl:value-of select="$name" />
                        <xsl:text>&#10;</xsl:text>
                        <xsl:value-of select="parameters[3]" />, <xsl:value-of select="parameters[4]" />
                    </xsl:if>
                </xsl:if>
            </xsl:for-each>
            
            <xsl:call-template name="getSetSizeForObject" >
                <xsl:with-param name="name" select="$name" />
            </xsl:call-template>

        </xsl:for-each>
    </xsl:template>

    <xsl:template name="touchAnimationFactory" >
        <xsl:param name="platform" />
        <xsl:param name="enlargeTheImageBackgroundForRotation" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="layoutName" />
        <xsl:param name="lazy" />
        
        //objectsAssign - touchAnimationFactory - START
        final int NaN = 0;
        final short angleIncrement = 1;
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

                final Image[] <xsl:value-of select="name" />ImageArray = (Image[]) imageCache.getHashtableP().get(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>_IMAGE_ARRAY_NAME);

                if(<xsl:value-of select="name" />ImageArray == null) {
                    throw new Exception("<xsl:value-of select="name" />ImageArray was null (This happens 1 time during the initial loading)");
                } else {
                    logUtil.put("<xsl:value-of select="name" />ImageArray found", this, commonStrings.INIT);
                }    
                
<!--                <xsl:for-each select="animations" ><xsl:for-each select="directions/sprites/image" ><xsl:if test="position() != 1" >found</xsl:if></xsl:for-each></xsl:for-each>-->
                <xsl:variable name="hasMoreThanOneImage" >found</xsl:variable>
                final AnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray = {
                <xsl:for-each select="animations" >
                    <xsl:for-each select="directions" >
                    //looping=<xsl:value-of select="looping" /> timeBetweenFrames=<xsl:value-of select="timeBetweenFrames" />
                    </xsl:for-each>
                    //<xsl:value-of select="$name" />AnimationInterfaceFactoryInterfaceArray[<xsl:value-of select="position() - 1" />] = ;
                    <xsl:if test="contains($hasMoreThanOneImage, 'found')" >
                        <xsl:if test="contains($lazy, 'true')" >
                    new LazyImageRotationAnimationFactory(<xsl:value-of select="$layoutIndex + 1" />, <xsl:value-of select="$objectIndex" />,
                        </xsl:if>
                    //<xsl:value-of select="$platform" />
                    new OneRowSpriteIndexedAnimationFactory(
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />]
                    //,
                    //-<xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />].getWidth() / 2,
                    //-<xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />].getHeight() / 2
                    //angleIncrement
                    </xsl:if>
                    <xsl:if test="not(contains($hasMoreThanOneImage, 'found'))" >
                        <xsl:if test="contains($lazy, 'true')" >
                    new LazyImageRotationAnimationFactory(<xsl:value-of select="$layoutIndex + 1" />, <xsl:value-of select="$objectIndex" />,
                        </xsl:if>                        
                    new AllBinary<xsl:value-of select="$platform" />ImageRotationAnimationFactory(
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />],
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />].getWidth(),
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />].getHeight(),
                    angleIncrement
                    </xsl:if>
                    <xsl:for-each select="directions" >,
                    new IndexedAnimationBehaviorFactory(<xsl:if test="looping = 'true'" >-1</xsl:if><xsl:if test="looping = 'false'" >1</xsl:if>, <xsl:value-of select="timeBetweenFrames * 1000" />)
                    </xsl:for-each>
                    )
                        <xsl:if test="contains($lazy, 'true')" >
                    )
                        </xsl:if>
                    <xsl:if test="position() != last()" >,</xsl:if>
                </xsl:for-each>
                };

                final ProceduralAnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray = new ProceduralAnimationInterfaceFactoryInterface[0];
                
                this.add(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_ANIMATION_NAME, new AnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray));
                this.add(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_PROCEDURAL_ANIMATION_NAME, new BaseAnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray));
                
                final Rectangle <xsl:value-of select="name" />LayerInfo = new Rectangle(
                                pointFactory.getInstance(
                                <xsl:if test="animations/directions/sprites/originPoint/x != 0" >
                                (<xsl:value-of select="animations/directions/sprites/originPoint/x" /> * 36 / 25) - (<xsl:value-of select="animations/directions/sprites/originPoint/x" />), 
                                </xsl:if>
                                <xsl:if test="animations/directions/sprites/originPoint/x = 0" >
                                0, 
                                </xsl:if>
                                <xsl:if test="animations/directions/sprites/originPoint/y != 0" >
                                (<xsl:value-of select="animations/directions/sprites/originPoint/y" /> * 36 / 25) - (<xsl:value-of select="animations/directions/sprites/originPoint/y" />)
                                </xsl:if>
                                <xsl:if test="animations/directions/sprites/originPoint/y = 0" >
                                0
                                </xsl:if>
                                ),
                                <xsl:if test="animations/directions/sprites/originPoint/x = 0" >//</xsl:if>(int) (<xsl:value-of select="animations/directions/sprites/originPoint/x" /> * animationScale), (int) (<xsl:value-of select="animations/directions/sprites/originPoint/y" /> * animationScale)
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
                                                        (int) (<xsl:value-of select="$name" />ImageArray[0].getWidth() * scaleTouchButtons), (int) (<xsl:value-of select="$name" />ImageArray[0].getHeight() * scaleTouchButtons)
                                                    </xsl:if>
                                                </xsl:if>
                                                <xsl:if test="height != 0 and width != 0" >
                                                    <xsl:value-of select="width" />, <xsl:value-of select="height" />
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
                                <!--
                                <xsl:for-each select="/game" >
                                    <xsl:for-each select="layouts" >
                                <xsl:call-template name="getSetSizeForObject" >
                                    <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                                    <xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param>
                                </xsl:call-template>
                                    </xsl:for-each>
                                </xsl:for-each>
                                -->
                                );

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
                this.addRectangle(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_RECTANGLE_NAME, <xsl:value-of select="name" />LayerInfo);
                
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
                //globals.<xsl:value-of select="$layerName" />GroupInterface = <xsl:value-of select="$layerName" />GroupInterface;
                                    </xsl:if>
                                </xsl:for-each>
                            </xsl:for-each>

                        </xsl:if>
                    </xsl:for-each>
                </xsl:for-each>
                //objectsGroupsGDGameLayer - END
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

                final Image[] <xsl:value-of select="name" />ImageArray = (Image[]) imageCache.getHashtableP().get(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_IMAGE_ARRAY_NAME);

                if(<xsl:value-of select="name" />ImageArray == null) {
                    throw new Exception("<xsl:value-of select="name" />ImageArray was null (This happens 1 time during the initial loading)");
                } else {
                    logUtil.put("<xsl:value-of select="name" />ImageArray found", this, commonStrings.INIT);
                }    

                <xsl:variable name="hasMoreThanOneImage" ><xsl:for-each select="animations" ><xsl:for-each select="directions/sprites/image" ><xsl:if test="position() != 1" >found</xsl:if></xsl:for-each></xsl:for-each></xsl:variable>
                <xsl:variable name="hasOriginPointX" ><xsl:if test="animations/directions/sprites/originPoint/x = 0" >found</xsl:if></xsl:variable>
                final int denominator = 2;
                final AnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray = {
                <xsl:for-each select="childrenContent" >
                    <xsl:for-each select="Border" >
                    new AllBinary<xsl:value-of select="$platform" />ImageRotationAnimationFactory(
                        <xsl:value-of select="$name" />ImageArray[0],
                        <xsl:value-of select="$name" />ImageArray[0].getWidth(),
                        <xsl:value-of select="$name" />ImageArray[0].getHeight(),
                        angleIncrement,
                        AnimationBehaviorFactory.getInstance()
                        //new IndexedAnimationBehaviorFactory(<xsl:if test="looping = 'true'" >-1</xsl:if><xsl:if test="looping = 'false'" >1</xsl:if>, <xsl:value-of select="timeBetweenFrames * 1000" />)
                        //<xsl:if test="not($platform = 'Array' or $platform = 'HTML')" >, true</xsl:if>
                        ),
                    </xsl:for-each>
                    <xsl:for-each select="Thumb" >
                    new AllBinary<xsl:value-of select="$platform" />ImageRotationAnimationFactory(
                        <xsl:value-of select="$name" />ImageArray[1],
                        <xsl:value-of select="$name" />ImageArray[1].getWidth() / denominator,
                        <xsl:value-of select="$name" />ImageArray[1].getHeight() / denominator,
                        angleIncrement,
                        AnimationBehaviorFactory.getInstance()
                        //new IndexedAnimationBehaviorFactory(<xsl:if test="looping = 'true'" >-1</xsl:if><xsl:if test="looping = 'false'" >1</xsl:if>, <xsl:value-of select="timeBetweenFrames * 1000" />)
                        <xsl:if test="not($platform = 'Array' or $platform = 'HTML')" >, true</xsl:if>
                        ) {
                        
                        @Override
                        public void setInitialScale(final ScaleProperties scaleProperties) {
                            final ScaleProperties scaleProperties2 = new ScaleProperties();
                            scaleProperties2.scaleHeight = scaleProperties.scaleHeight / denominator;
                            scaleProperties2.scaleWidth = scaleProperties.scaleWidth / denominator;
                            scaleProperties2.scaleX = scaleProperties.scaleX / denominator;
                            scaleProperties2.scaleY = scaleProperties.scaleY / denominator;
                            scaleProperties2.shouldScale = scaleProperties.shouldScale;

                            final float joystickScale = org.allbinary.AndroidUtil.isAndroid() ? 0.75f : 2.0f;
                            this.animationFactoryInitializationVisitor.dx = (int) (scaleProperties2.scaleWidth / (joystickScale * 3.33f));
                            this.animationFactoryInitializationVisitor.dy = (int) (scaleProperties2.scaleHeight / (joystickScale * 3.33f));

                            super.setInitialScale(scaleProperties2);
                            //logUtil.put(this.scaleProperties.toString(), this, commonStrings.PROCESS);

                        }

                    }<xsl:if test="position() != last()" >,</xsl:if>
                    </xsl:for-each>
                </xsl:for-each>
                };

                final ProceduralAnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray = new ProceduralAnimationInterfaceFactoryInterface[0];

                final SimultaneousCompoundIndexedAnimationInterfaceFactory simultaneousCompoundIndexedAnimationInterfaceFactory = new SimultaneousCompoundIndexedAnimationInterfaceFactory(<xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray);
                final AnimationInterfaceFactoryInterface[] joystickAnimationInterfaceFactoryInterfaceArray = {
                    simultaneousCompoundIndexedAnimationInterfaceFactory
                };
                this.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_ANIMATION_NAME, new AnimationInterfaceFactoryInterfaceComposite(joystickAnimationInterfaceFactoryInterfaceArray));
                this.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_PROCEDURAL_ANIMATION_NAME, new BaseAnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray));
                
                final Rectangle <xsl:value-of select="name" />LayerInfo = new Rectangle(
                                pointFactory.getInstance(
                                <xsl:if test="animations/directions/sprites/originPoint/x != 0" >
                                (<xsl:value-of select="animations/directions/sprites/originPoint/x" /> * 36 / 25) - (<xsl:value-of select="animations/directions/sprites/originPoint/x" />), 
                                </xsl:if>
                                <xsl:if test="animations/directions/sprites/originPoint/x = 0" >
                                0, 
                                </xsl:if>
                                <xsl:if test="animations/directions/sprites/originPoint/y != 0" >
                                (<xsl:value-of select="animations/directions/sprites/originPoint/y" /> * 36 / 25) - (<xsl:value-of select="animations/directions/sprites/originPoint/y" />)
                                </xsl:if>
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
                                <xsl:if test="not(animations/directions/sprites/originPoint) or animations/directions/sprites/originPoint/x = 0" >//</xsl:if>(int) (<xsl:value-of select="animations/directions/sprites/originPoint/x" /> * animationScale), (int) (<xsl:value-of select="animations/directions/sprites/originPoint/y" /> * animationScale)
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
                                            <xsl:if test="contains(name, 'btn_')" >
                                                //btn_ - found
                                                (int) (<xsl:value-of select="$name" />ImageArray[0].getWidth() * scaleTouchButtons), (int) (<xsl:value-of select="$name" />ImageArray[0].getHeight() * scaleTouchButtons)
                                            </xsl:if>
                                            <xsl:if test="not(contains(name, 'btn_'))" >
                                                //btn_ - not 2
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
                                <!--
                                <xsl:for-each select="/game" >
                                    <xsl:for-each select="layouts" >
                                <xsl:call-template name="getSetSizeForObject" >
                                    <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                                    <xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param>
                                </xsl:call-template>
                                    </xsl:for-each>
                                </xsl:for-each>
                                -->
                                );

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
                this.addRectangle(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_RECTANGLE_NAME, <xsl:value-of select="name" />LayerInfo);

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
                final Rectangle[][] rectangleArrayOfArrays = new Rectangle[<xsl:value-of select="$animationTotal" />][0];
                        </xsl:if>
                        <xsl:if test="not(contains($hasMoreThanOneImage, 'found'))" >
                final Rectangle[][] rectangleArrayOfArrays = new Rectangle[<xsl:value-of select="$animationTotal" />][360];
                        </xsl:if>

                        <xsl:if test="contains($hasMoreThanOneImage, 'found') and contains($hasCustomCollisionMask, 'found')" >
                        </xsl:if>
                        <xsl:if test="not(contains($hasMoreThanOneImage, 'found') and contains($hasCustomCollisionMask, 'found'))" >
                //Auto generated CollisionMask for RotationAnimations
                final float newX = (<xsl:value-of select="$name" />LayerInfo.getWidth() * 1.44f - <xsl:value-of select="$name" />LayerInfo.getWidth()) / 2;
                final float newY = (<xsl:value-of select="$name" />LayerInfo.getHeight() * 1.44f - <xsl:value-of select="$name" />LayerInfo.getHeight()) / 2;
                final Rectangle <xsl:value-of select="$name" />RotationCollisionMask = new Rectangle(
                                pointFactory.getInstance((int) (newX * 3 * halfScale), (int) (newY * 3 * halfScale)), (int) (<xsl:value-of select="$name" />LayerInfo.getWidth() * 3 * halfScale), (int) (<xsl:value-of select="$name" />LayerInfo.getHeight() * 3 * halfScale)
                                );
                        </xsl:if>
                    </xsl:if>

                    <xsl:if test="not(contains($hasMoreThanOneImage, 'found') and contains($hasCustomCollisionMask, 'found'))" >
                for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> <xsl:value-of select="$animationTotal" />; index2++) {
                    for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> 360; index++) {
                        rectangleArrayOfArrays[index2][index] = <xsl:value-of select="$name" />RotationCollisionMask;
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
                final Rectangle <xsl:value-of select="$name" /><xsl:value-of select="$animationName" /><xsl:value-of select="$position" />CollisionMask = new Rectangle(
                                pointFactory.getInstance((int) (<xsl:value-of select="array[1]/x" /> * scale), (int) (<xsl:value-of select="array[1]/y" /> * scale)),
                                    (int) ((<xsl:value-of select="array[3]/x" /> - <xsl:value-of select="array[1]/x" />) * scale), (int) ((<xsl:value-of select="array[4]/y" /> - <xsl:value-of select="array[1]/y" />) * scale)
                                );

//                logUtil.put("Rectangle: " + <xsl:value-of select="$name" /><xsl:value-of select="$animationName" /><xsl:value-of select="$position" />CollisionMask, this, commonStrings.PROCESS);

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
                rectangleArrayOfArrays[<xsl:value-of select="$animationPosition - 1" />] = new Rectangle[<xsl:value-of select="last()" />];
                                </xsl:if>
                            </xsl:if>

                            <xsl:for-each select="customCollisionMask" >

                                <xsl:if test="contains($hasMoreThanOneImage, 'found')" >
                rectangleArrayOfArrays[<xsl:value-of select="$animationPosition - 1" />][<xsl:value-of select="$position - 1" />] = <xsl:value-of select="$animationName1" />CollisionMask;
                                </xsl:if>
                                <xsl:if test="not(contains($hasMoreThanOneImage, 'found'))" >
                for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> <xsl:value-of select="$animationTotal" />; index2++) {
                    for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> 360; index++) {
                        rectangleArrayOfArrays[index2][index] = <xsl:value-of select="$animationName1" />CollisionMask;
                    }
                }
                                </xsl:if>

                            </xsl:for-each>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:for-each>

                    <xsl:if test="$animationPosition = last() and (contains($hasCustomCollisionMask, 'found') or not(contains($hasMoreThanOneImage, 'found') and contains($hasCustomCollisionMask, 'found')))" >
                this.addRectangleArrayOfArrays(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_ANIMATION_NAME, rectangleArrayOfArrays);
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
                final Rectangle[][] rectangleArrayOfArrays = new Rectangle[<xsl:value-of select="$animationTotal" />][0];
                    </xsl:if>

                    <xsl:for-each select="directions" >
                        <xsl:for-each select="sprites" >
                            <xsl:if test="hasCustomCollisionMask = 'true'" >
                                
                            <xsl:variable name="position" ><xsl:value-of select="position()" /></xsl:variable>
                            <xsl:variable name="last" ><xsl:value-of select="last()" /></xsl:variable>
                            //customCollisionMask - <xsl:value-of select="image" /> - Attack

                            <xsl:if test="position() = 1" >
                rectangleArrayOfArrays[<xsl:value-of select="$animationPosition - 1" />] = new Rectangle[<xsl:value-of select="last()" />];
                            </xsl:if>
                            
                            <xsl:for-each select="customCollisionMask" >
                final Rectangle <xsl:value-of select="$name" /><xsl:value-of select="$animationName" /><xsl:value-of select="$position" />CollisionMask = new Rectangle(
                                pointFactory.getInstance((int) (<xsl:value-of select="array[1]/x" /> * scale), (int) (<xsl:value-of select="array[1]/y" /> * scale)),
                                    (int) ((<xsl:value-of select="array[3]/x" /> - <xsl:value-of select="array[1]/x" />) * scale), (int) ((<xsl:value-of select="array[4]/y" /> - <xsl:value-of select="array[1]/y" />) * scale)
                                );

//              logUtil.put("Rectangle: " + <xsl:value-of select="$name" /><xsl:value-of select="$animationName" /><xsl:value-of select="$position" />CollisionMask, this, commonStrings.PROCESS);

                rectangleArrayOfArrays[<xsl:value-of select="$animationPosition - 1" />][<xsl:value-of select="$position - 1" />] = <xsl:value-of select="$name" /><xsl:value-of select="$animationName" /><xsl:value-of select="$position" />CollisionMask;
                            </xsl:for-each>
                            
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:for-each>

                    <xsl:if test="$animationPosition = last()" >
                this.addRectangleArrayOfArrays(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_ANIMATION_NAME, rectangleArrayOfArrays);
                    </xsl:if>
                                                                                        
                    </xsl:if>                    
                    </xsl:if>
                    </xsl:if>
                </xsl:for-each>

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
                //globals.<xsl:value-of select="$layerName" />GroupInterface = <xsl:value-of select="$layerName" />GroupInterface;
                                    </xsl:if>
                                </xsl:for-each>
                            </xsl:for-each>

                        </xsl:if>
                    </xsl:for-each>
                </xsl:for-each>
                //objectsGroupsGDGameLayer - END
            }
            </xsl:if>

            <xsl:if test="$typeValue = 'TileMap::CollisionMask' or $typeValue = 'TileMap::TileMap' or $typeValue = 'ParticleSystem::ParticleEmitter'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:if test="contains($name, 'btn_')" >
                //Animation Total: <xsl:value-of select="count(animations)" />

                final Image[] <xsl:value-of select="name" />ImageArray = (Image[]) imageCache.getHashtableP().get(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>_IMAGE_ARRAY_NAME);

                if(<xsl:value-of select="name" />ImageArray == null) {
                    throw new Exception("<xsl:value-of select="name" />ImageArray was null (This happens 1 time during the initial loading)");
                } else {
                    logUtil.put("<xsl:value-of select="name" />ImageArray found", this, commonStrings.INIT);
                }    
                    
                final AnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray = {
                    NullRotationAnimationFactory.getFactoryInstance()
                };

                final ProceduralAnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray = new ProceduralAnimationInterfaceFactoryInterface[0];
                
                this.add(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_ANIMATION_NAME, new AnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray));
                this.add(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_PROCEDURAL_ANIMATION_NAME, new BaseAnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray));
                
                final Rectangle <xsl:value-of select="name" />LayerInfo = new Rectangle(
                                pointFactory.getInstance(0, 0),
                                0, 0
                                );

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
                this.addRectangle(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_RECTANGLE_NAME, <xsl:value-of select="name" />LayerInfo);

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
                //globals.<xsl:value-of select="$layerName" />GroupInterface = <xsl:value-of select="$layerName" />GroupInterface;
                                    </xsl:if>
                                </xsl:for-each>
                            </xsl:for-each>

                        </xsl:if>
                    </xsl:for-each>
                </xsl:for-each>
                //objectsGroupsGDGameLayer - END
                </xsl:if>
            </xsl:if>

            <xsl:if test="$typeValue = 'TextObject::Text'" >
                <xsl:variable name="stringValue" select="string" />

                //final GDConditionWithGroupActions <xsl:value-of select="name" />GDConditionWithGroupActions = new GDConditionWithGroupActions();

            </xsl:if>

            <xsl:if test="$typeValue = 'TextEntryObject::String'" >
                <xsl:variable name="stringValue" select="string" />

                //final GDConditionWithGroupActions <xsl:value-of select="name" />GDConditionWithGroupActions = new GDConditionWithGroupActions();

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

                public final String <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_IMAGE_ARRAY_NAME = "<xsl:value-of select="name" />_image_array";

                public final String <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_ANIMATION_NAME = "<xsl:value-of select="name" />_animation";

                public final String <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_PROCEDURAL_ANIMATION_NAME = "<xsl:value-of select="name" />_procedural_animation";
                
                public final String <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_RECTANGLE_NAME = "<xsl:value-of select="name" />_rectangle";

        </xsl:for-each>
        //objects - all - //objectsAssign - animationNames - END
    </xsl:template>

</xsl:stylesheet>
