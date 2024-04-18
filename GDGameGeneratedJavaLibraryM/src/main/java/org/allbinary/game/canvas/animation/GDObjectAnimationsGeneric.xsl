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
    
    <xsl:template name="animationFactoryCalls" >
        <xsl:param name="enlargeTheImageBackgroundForRotation" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="layoutName" />

//               LogUtil.put(LogFactory.getInstance("scale: " + scale, this, commonStrings.PROCESS));
//               LogUtil.put(LogFactory.getInstance("hackScale: " + hackScale, this, commonStrings.PROCESS));
                
        //objectsAssign - animationFactoryCalls - START
        <xsl:for-each select="objects" >
            <xsl:variable name="typeValue" select="type" />
            <xsl:variable name="name" select="name" />
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:if test="$typeValue = 'Sprite'" >
                this.add<xsl:value-of select="name" />SpriteAnimations(imageCache);
            </xsl:if>

            <xsl:if test="$typeValue = 'TileMap::CollisionMask' or $typeValue = 'TileMap::TileMap' or $typeValue = 'ParticleSystem::ParticleEmitter'" >
                this.add<xsl:value-of select="name" />TileMapAndParticleSystemAnimations(imageCache);
            </xsl:if>

            <xsl:if test="$typeValue = 'PanelSpriteSlider::PanelSpriteSlider'" >
                this.add<xsl:value-of select="name" />PanelSpriteSliderAnimations(imageCache);
            </xsl:if>

            <xsl:if test="$typeValue = 'TextObject::Text'" >
                this.add<xsl:value-of select="name" />TextObjectAnimations(imageCache);
            </xsl:if>

            <xsl:if test="$typeValue = 'TextInput::TextInputObject'" >
                this.add<xsl:value-of select="name" />TextInputAnimations(imageCache);
            </xsl:if>

<!-- 
            <xsl:if test="$typeValue = 'TextEntryObject::TextEntry'" >
                <xsl:variable name="stringValue" select="string" />
            </xsl:if>
-->

        </xsl:for-each>
        //objectsAssign - animationFactoryCalls - END
    </xsl:template>

    <xsl:template name="animationFactory" >
        <xsl:param name="enlargeTheImageBackgroundForRotation" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="layoutName" />
        
        <xsl:variable name="windowWidth" select="/game/properties/windowWidth" />
                
        //objectsAssign - animationFactory - START
        private final short angleIncrement = 1;
        private final int[] sequenceArray = {-1};
        //private final float hackScale = ((float) scale) * 125.0f / 1000.0f;
        private final float hackScale = 3.0f * 125.0f / 1000.0f;

        <xsl:for-each select="objects" >
            <xsl:variable name="typeValue" select="type" />
            <xsl:variable name="name" select="name" />
            <xsl:variable name="nameInUpperCase" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:if test="$typeValue = 'Sprite'" >
                <xsl:variable name="stringValue" select="string" />

            private void add<xsl:value-of select="name" />SpriteAnimations(final ImageCache imageCache) throws Exception {
                <xsl:if test="not(contains($name, 'btn_'))" >
                //Animation Total: <xsl:value-of select="count(animations)" />

                final Image[] <xsl:value-of select="name" />ImageArray = (Image[]) imageCache.getHashtable().get(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_IMAGE_ARRAY_NAME);

                if(<xsl:value-of select="name" />ImageArray == null) {
                    throw new Exception("<xsl:value-of select="name" />ImageArray was null (This happens 1 time during the initial loading)");
                } else {
                    LogUtil.put(LogFactory.getInstance("<xsl:value-of select="name" />ImageArray found", this, commonStrings.INIT));
                }    

                <xsl:variable name="hasMoreThanOneImage" ><xsl:for-each select="animations" ><xsl:for-each select="directions/sprites/image" ><xsl:if test="position() != 1" >found</xsl:if></xsl:for-each></xsl:for-each></xsl:variable>
                <xsl:variable name="hasOriginPointX" ><xsl:if test="animations/directions/sprites/originPoint/x = 0" >found</xsl:if></xsl:variable>
                final AnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray = {
                <xsl:for-each select="animations" >
                    <xsl:for-each select="directions" >
                    //looping=<xsl:value-of select="looping" /> timeBetweenFrames=<xsl:value-of select="timeBetweenFrames" />
                    </xsl:for-each>
                    
                    //<xsl:value-of select="$name" />AnimationInterfaceFactoryInterfaceArray[<xsl:value-of select="position() - 1" />] = ;
                    <xsl:if test="contains($hasMoreThanOneImage, 'found')" >
                    new OneRowSpriteIndexedAnimationFactory(
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />]
                    //)
                    ,<xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />].getWidth() / <xsl:value-of select="count(directions/sprites)" />, <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />].getHeight()
                    ,
                                <xsl:for-each select=".." >
                                    <xsl:for-each select=".." >
                                    <xsl:variable name="hasInstance" ><xsl:for-each select="instances" ><xsl:if test="name = $name" >found</xsl:if></xsl:for-each></xsl:variable>
                                    <xsl:if test="not(contains($hasInstance, 'found'))" >
                                        //No instance available - probably should not set instance values here anyways.
                                        0, 0
                                    </xsl:if>
                                    <xsl:for-each select="instances" >
                                        <xsl:if test="name = $name" >
                                            <xsl:if test="contains(name, 'btn_')" >
                                                //btn_ - found
                                                -<xsl:value-of select="$name" />ImageArray[0].getWidth(), -<xsl:value-of select="$name" />ImageArray[0].getHeight()
                                            </xsl:if>
                                            <xsl:if test="not(contains(name, 'btn_'))" >
                                                //btn_ - not - <xsl:value-of select="width" />, <xsl:value-of select="height" />
                                                <xsl:if test="height = 0 or width = 0 or not(height) or not(width)" >
                                                    <xsl:if test="contains($hasOriginPointX, 'found')" >
                                                        //-<xsl:value-of select="$name" />ImageArray[0].getWidth(), -<xsl:value-of select="$name" />ImageArray[0].getHeight()
                                                        0, 0
                                                    </xsl:if>
                                                </xsl:if>
                                                <xsl:if test="height != 0 and width != 0" >
                                                    //-(<xsl:value-of select="width" /> / 2), -(<xsl:value-of select="height" /> / 2)
                                                    0, 0
                                                </xsl:if>
                                            </xsl:if>
                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:for-each>
                                </xsl:for-each>
                    //angleIncrement
                    </xsl:if>
                    <xsl:if test="not(contains($hasMoreThanOneImage, 'found'))" >
                    new ImageArrayRotationAnimationFactory(
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />],
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />].getWidth(),
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />].getHeight(),
                    angleIncrement
                    </xsl:if>
                    <xsl:for-each select="directions" >,
                    new IndexedAnimationBehaviorFactory(<xsl:if test="looping = 'true'" >-1</xsl:if><xsl:if test="looping = 'false'" >1</xsl:if>, <xsl:value-of select="timeBetweenFrames * 1000" />)
                    </xsl:for-each>
                    )<xsl:if test="position() != last()" >,</xsl:if>
                </xsl:for-each>
                };

                final ProceduralAnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray = new ProceduralAnimationInterfaceFactoryInterface[0];
                
                this.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_ANIMATION_NAME, new AnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray));
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
                                ),
                                <xsl:if test="not(animations/directions/sprites/originPoint) or animations/directions/sprites/originPoint/x = 0" >//</xsl:if><xsl:value-of select="animations/directions/sprites/originPoint/x" /> * 2, <xsl:value-of select="animations/directions/sprites/originPoint/y" /> * 2
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
                                                <xsl:value-of select="$name" />ImageArray[0].getWidth(), <xsl:value-of select="$name" />ImageArray[0].getHeight()
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
                this.addRectangle(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_RECTANGLE_NAME, <xsl:value-of select="name" />LayerInfo);

                <xsl:for-each select="animations" >
                    <xsl:if test="position() = 1" >
                    <xsl:if test="string-length(name) > 0" >
                    <xsl:variable name="animationName" ><xsl:value-of select="name" /></xsl:variable>
                    <xsl:for-each select="directions" >
                        <xsl:for-each select="sprites" >
                            <xsl:if test="position() = 1" >
                            <xsl:variable name="position" ><xsl:value-of select="position()" /></xsl:variable>
                            <xsl:for-each select="customCollisionMask" >
                                <xsl:if test="$name != 'Player'" >/*</xsl:if>
                //customCollisionMask
                final Rectangle <xsl:value-of select="$name" /><xsl:value-of select="$animationName" /><xsl:value-of select="$position" />CollisionMask = new Rectangle(
                                pointFactory.getInstance((int) (<xsl:value-of select="array[1]/x" /> * hackScale), (int) (<xsl:value-of select="array[1]/y" /> * hackScale)),
                                    (int) ((<xsl:value-of select="array[3]/x" /> - <xsl:value-of select="array[1]/x" />) * hackScale), (int) ((<xsl:value-of select="array[4]/y" /> - <xsl:value-of select="array[1]/y" />) * hackScale)
                                );

//               LogUtil.put(LogFactory.getInstance("Rectangle: " + <xsl:value-of select="$name" /><xsl:value-of select="$animationName" /><xsl:value-of select="$position" />CollisionMask, this, commonStrings.PROCESS));

                final int size = <xsl:value-of select="$name" />AnimationInterfaceFactoryInterfaceArray.length;
                final Rectangle[][] rectangleArrayOfArrays = new Rectangle[1][size];
                for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                    rectangleArrayOfArrays[0][index] = <xsl:value-of select="$name" /><xsl:value-of select="$animationName" /><xsl:value-of select="$position" />CollisionMask;
                }
                this.addRectangleArrayOfArrays(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_ANIMATION_NAME, rectangleArrayOfArrays);

                                <xsl:if test="$name != 'Player'" >*/</xsl:if>
                            </xsl:for-each>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:for-each>
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
                </xsl:if>
            }
            </xsl:if>

            <xsl:if test="$typeValue = 'TileMap::CollisionMask' or $typeValue = 'TileMap::TileMap' or $typeValue = 'ParticleSystem::ParticleEmitter'" >
                <xsl:variable name="stringValue" select="string" />

            private void add<xsl:value-of select="name" />TileMapAndParticleSystemAnimations(final ImageCache imageCache) throws Exception {
            
                <xsl:if test="not(contains($name, 'btn_'))" >
                //Animation Total: <xsl:value-of select="count(animations)" />

                final Image[] <xsl:value-of select="name" />ImageArray = (Image[]) imageCache.getHashtable().get(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_IMAGE_ARRAY_NAME);

                if(<xsl:value-of select="name" />ImageArray == null) {
                    throw new Exception("<xsl:value-of select="name" />ImageArray was null (This happens 1 time during the initial loading)");
                } else {
                    LogUtil.put(LogFactory.getInstance("<xsl:value-of select="name" />ImageArray found", this, commonStrings.INIT));
                }    

                final AnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray = {
                    NullRotationAnimationFactory.getFactoryInstance()
                };

                final ProceduralAnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray = new ProceduralAnimationInterfaceFactoryInterface[0];
                
                this.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_ANIMATION_NAME, new AnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray));
                this.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_PROCEDURAL_ANIMATION_NAME, new BaseAnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray));
                
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
                this.addRectangle(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_RECTANGLE_NAME, <xsl:value-of select="name" />LayerInfo);

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
            }
            </xsl:if>

            <xsl:if test="$typeValue = 'PanelSpriteSlider::PanelSpriteSlider'" >
            private void add<xsl:value-of select="name" />PanelSpriteSliderAnimations(final ImageCache imageCache) throws Exception {
            
                final Image[] <xsl:value-of select="$name" />ImageArray = (Image[]) imageCache.getHashtable().get(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_IMAGE_ARRAY_NAME);

                if(<xsl:value-of select="$name" />ImageArray == null) {
                    throw new Exception("<xsl:value-of select="$name" />ImageArray was null (This happens 1 time during the initial loading)");
                } else {
                    LogUtil.put(LogFactory.getInstance("<xsl:value-of select="$name" />ImageArray found", this, commonStrings.INIT));
                }
                
                <xsl:for-each select="childrenContent" >
                    <xsl:for-each select="Label" >
                final int <xsl:value-of select="$name" />TextAnimationSize = (<xsl:value-of select="characterSize" />);
                    </xsl:for-each>
                </xsl:for-each>

                <xsl:variable name="hasMirrorFillBarBehavior" >
                <xsl:for-each select="behaviors" ><xsl:if test="type = 'MirrorFillBarExtension::MirrorFillBarBehavior'" >found</xsl:if></xsl:for-each>
                </xsl:variable>

                final AnimationInterfaceFactoryInterface[] <xsl:value-of select="$name" />AnimationInterfaceFactoryInterfaceArray0 = {
                <xsl:for-each select="childrenContent" >
                    <xsl:for-each select="Background" >
                    //Background
                    new ImageRotationAnimationFactory(
                        <xsl:value-of select="$name" />ImageArray[0],
                        <xsl:value-of select="$name" />ImageArray[0].getWidth(),
                        <xsl:value-of select="$name" />ImageArray[0].getHeight(),
                        angleIncrement,
                        AnimationBehaviorFactory.getInstance()
                        //new IndexedAnimationBehaviorFactory(<xsl:if test="looping = 'true'" >-1</xsl:if><xsl:if test="looping = 'false'" >1</xsl:if>, <xsl:value-of select="timeBetweenFrames * 1000" />)
                    ),
                    </xsl:for-each>
                    <xsl:for-each select="FillBar" >
                    //FillBar
                    new LeftToRightImageAnimationFactory(
                        <xsl:value-of select="$name" />ImageArray[1], 
                        sequenceArray,
                        (<xsl:value-of select="$name" />ImageArray[0].getWidth() - <xsl:value-of select="$name" />ImageArray[1].getWidth()) / 2,
                        (<xsl:value-of select="$name" />ImageArray[0].getHeight() - <xsl:value-of select="$name" />ImageArray[1].getHeight()) / 2
                    ),
                        <xsl:if test="not(contains($hasMirrorFillBarBehavior, 'found'))" >
                    //MirrorFillBarExtension::MirrorFillBarBehavior
                    new NullRotationAnimationFactory(),
                        </xsl:if>
                        <xsl:for-each select="../../behaviors" >
                            <xsl:if test="type = 'MirrorFillBarExtension::MirrorFillBarBehavior'" >
                    new RightToLeftImageAnimationFactory(
                        <xsl:value-of select="$name" />ImageArray[2],
                        (<xsl:value-of select="$name" />ImageArray[0].getWidth() - <xsl:value-of select="$name" />ImageArray[2].getWidth()) / 2,
                        (<xsl:value-of select="$name" />ImageArray[0].getHeight() - <xsl:value-of select="$name" />ImageArray[2].getHeight()) / 2
                    ),
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:for-each>
                    <xsl:for-each select="Thumb" >
                    //Thumb
                    new ImageRotationAnimationFactory(
                        <xsl:value-of select="$name" />ImageArray[4],
                        <xsl:value-of select="$name" />ImageArray[4].getWidth(),
                        <xsl:value-of select="$name" />ImageArray[4].getHeight(),
                        (<xsl:value-of select="$name" />ImageArray[0].getWidth() - <xsl:value-of select="$name" />ImageArray[2].getWidth()) / 2,
                        (<xsl:value-of select="$name" />ImageArray[0].getHeight() - <xsl:value-of select="$name" />ImageArray[4].getHeight()) / 2,
                        angleIncrement,
                        AnimationBehaviorFactory.getInstance()
                        //new IndexedAnimationBehaviorFactory(<xsl:if test="looping = 'true'" >-1</xsl:if><xsl:if test="looping = 'false'" >1</xsl:if>, <xsl:value-of select="timeBetweenFrames * 1000" />)
                    ),
                    </xsl:for-each>
                    <xsl:for-each select="Label" >
                    //Label
                    new CustomTextAnimationFactory(StringUtil.getInstance().EMPTY_STRING, <xsl:value-of select="$name" />TextAnimationSize, 0, -1) {
                        public void setInitialScale(final ScaleProperties scaleProperties) {
                            //super.setInitialScale(scaleProperties);
                            this.scaleProperties = scaleProperties;
                            //LogUtil.put(LogFactory.getInstance(new StringMaker().append("setInitialScale - font: ").append(scaleProperties.scaleHeight).toString(), this, CommonStrings.getInstance().PROCESS));
                            //this.scaleWidth = scaleProperties.scalwWidth;
                            final int fontSize = scaleProperties.scaleHeight;
                            scaleProperties.scaleHeight = (int) fontSize - (fontSize / 4);
                            this.font = Font.getFont(Font.FACE_SYSTEM, Font.STYLE_PLAIN, scaleProperties.scaleHeight);
                            LogUtil.put(LogFactory.getInstance(new StringMaker().append("setInitialScale - font: ").append(font.getSize()).toString(), this, CommonStrings.getInstance().PROCESS));
                        }
                    },
                    </xsl:for-each>
                </xsl:for-each>
                };

                final AnimationInterfaceFactoryInterface[] <xsl:value-of select="$name" />AnimationInterfaceFactoryInterfaceArray = {
                    new SliderAnimationInterfaceFactory(
                        <xsl:value-of select="$name" />AnimationInterfaceFactoryInterfaceArray0,
                        <xsl:value-of select="$name" />ImageArray[1].getWidth(),
                        <xsl:value-of select="$name" />ImageArray[1].getHeight()
                    ) {
                        public void setInitialScale(final ScaleProperties scaleProperties) {
                            final ScaleProperties scaleProperties1 = new ScaleProperties();
                            scaleProperties1.shouldScale = scaleProperties.shouldScale;
                            scaleProperties1.scaleX = scaleProperties.scaleX;
                            scaleProperties1.scaleY = scaleProperties.scaleY;
                            scaleProperties1.scaleWidth = (scaleProperties.scaleWidth * 253 / 265) - (scaleProperties.scaleWidth * 22 / 265);
                            scaleProperties1.scaleHeight = scaleProperties.scaleHeight;
                            super.setInitialScale(scaleProperties1);

                            this.basicAnimationInterfaceFactoryInterfaceArray[0].setInitialScale(scaleProperties);
                        
                            final ScaleProperties scaleProperties2 = new ScaleProperties();
                            scaleProperties2.shouldScale = scaleProperties.shouldScale;
                            scaleProperties2.scaleX = scaleProperties.scaleX;
                            scaleProperties2.scaleY = scaleProperties.scaleY;
                            scaleProperties2.scaleWidth = scaleProperties.scaleWidth * 253 / 265;
                            scaleProperties2.scaleHeight = scaleProperties.scaleHeight * 16 / 34;
                        
                            this.basicAnimationInterfaceFactoryInterfaceArray[1].setInitialScale(scaleProperties2);
                            this.basicAnimationInterfaceFactoryInterfaceArray[2].setInitialScale(scaleProperties2);
                        
                            final ScaleProperties scaleProperties3 = new ScaleProperties();
                            scaleProperties3.shouldScale = scaleProperties.shouldScale;
                            scaleProperties3.scaleX = scaleProperties.scaleX;
                            scaleProperties3.scaleY = scaleProperties.scaleY;
                            scaleProperties3.scaleWidth = scaleProperties.scaleWidth * 22 / 265;
                            scaleProperties3.scaleHeight = scaleProperties.scaleHeight * 22 / 34;
                                                
                            this.basicAnimationInterfaceFactoryInterfaceArray[3].setInitialScale(scaleProperties3);

                            final ScaleProperties scaleProperties4 = new ScaleProperties();
                            scaleProperties4.shouldScale = scaleProperties.shouldScale;
                            scaleProperties4.scaleX = scaleProperties.scaleX;
                            scaleProperties4.scaleY = scaleProperties.scaleY;
                            scaleProperties4.scaleWidth = scaleProperties.scaleWidth;
                            scaleProperties4.scaleHeight = scaleProperties.scaleHeight;
                        
                            this.basicAnimationInterfaceFactoryInterfaceArray[4].setInitialScale(scaleProperties4);
                        }                        
                    }
                };
                
                final ProceduralAnimationInterfaceFactoryInterface[] <xsl:value-of select="$name" />ProceduralAnimationInterfaceFactoryInterfaceArray = new ProceduralAnimationInterfaceFactoryInterface[0];

                this.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_ANIMATION_NAME, new AnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="$name" />AnimationInterfaceFactoryInterfaceArray));
                this.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_PROCEDURAL_ANIMATION_NAME, new BaseAnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="$name" />ProceduralAnimationInterfaceFactoryInterfaceArray));

                final Rectangle <xsl:value-of select="$name" />LayerInfo = new Rectangle(
                                pointFactory.getInstance(0, 0),
                <xsl:for-each select="childrenContent" >
                    <xsl:for-each select="Background" >
                        <xsl:value-of select="width" />, <xsl:value-of select="height" />
                    </xsl:for-each>
               </xsl:for-each>
                                );

                this.addRectangle(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_RECTANGLE_NAME, <xsl:value-of select="$name" />LayerInfo);

                //final GDConditionWithGroupActions <xsl:value-of select="$name" />GDConditionWithGroupActions = new GDConditionWithGroupActions();

            }
            </xsl:if>

            <xsl:if test="$typeValue = 'TextObject::Text'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="stringValue2" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$stringValue" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="'&quot;'" /></xsl:with-param><xsl:with-param name="replacementText" >\"</xsl:with-param></xsl:call-template></xsl:variable>
                <xsl:variable name="multilineString" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$stringValue2" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="'&#10;'" /></xsl:with-param><xsl:with-param name="replacementText" >\n").append("</xsl:with-param></xsl:call-template></xsl:variable>
            
            private void add<xsl:value-of select="name" />TextObjectAnimations(final ImageCache imageCache) throws Exception {
                
                final int <xsl:value-of select="name" />TextAnimationSize = (<xsl:value-of select="characterSize" /> * 3 / 2);

                final AnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray = {
                    new CustomTextAnimationFactory(new StringMaker().append("<xsl:value-of select="$multilineString" />").toString(), <xsl:value-of select="name" />TextAnimationSize)
                };

                final ProceduralAnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray = new ProceduralAnimationInterfaceFactoryInterface[0];

                this.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_ANIMATION_NAME, new AnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray));
                this.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_PROCEDURAL_ANIMATION_NAME, new BaseAnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray));

                final Rectangle <xsl:value-of select="name" />LayerInfo = new Rectangle(
                                pointFactory.getInstance(0, 0),
                                <xsl:value-of select="name" />TextAnimationSize * (12 - 1), <xsl:value-of select="name" />TextAnimationSize
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

                //final GDConditionWithGroupActions <xsl:value-of select="name" />GDConditionWithGroupActions = new GDConditionWithGroupActions();

            }
            </xsl:if>

            <xsl:if test="$typeValue = 'TextInput::TextInputObject'" >
                <xsl:variable name="stringValue" select="string" />

            private void add<xsl:value-of select="name" />TextInputAnimations(final ImageCache imageCache) throws Exception {

                final int <xsl:value-of select="name" />TextInputAnimationSize = <xsl:value-of select="content/fontSize" /> / 2;

                final AnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray = {
                    new CustomTextBoxIndexedAnimationFactory(<xsl:value-of select="name" />TextInputAnimationSize)
                };

                final ProceduralAnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray = new ProceduralAnimationInterfaceFactoryInterface[0];

                this.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_ANIMATION_NAME, new AnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray));
                this.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_PROCEDURAL_ANIMATION_NAME, new BaseAnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray));

                final Rectangle <xsl:value-of select="name" />LayerInfo = new Rectangle(
                                pointFactory.getInstance(0, 0),
                                <xsl:value-of select="name" />TextInputAnimationSize * (12 - 1), <xsl:value-of select="name" />TextInputAnimationSize
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

                //final GDConditionWithGroupActions <xsl:value-of select="name" />GDConditionWithGroupActions = new GDConditionWithGroupActions();

            }
            </xsl:if>
            
            <xsl:if test="$typeValue = 'TextEntryObject::TextEntry'" >
                <xsl:variable name="stringValue" select="string" />

                //final GDConditionWithGroupActions <xsl:value-of select="name" />GDConditionWithGroupActions = new GDConditionWithGroupActions();

            </xsl:if>
            

        </xsl:for-each>
        //objectsAssign - animationFactory - END
    </xsl:template>

</xsl:stylesheet>
