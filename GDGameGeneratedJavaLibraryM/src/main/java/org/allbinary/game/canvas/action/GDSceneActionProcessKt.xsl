<?xml version="1.0" encoding="windows-1252"?>

<!--
AllBinary Open License Version 1
Copyright (c) 2022 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

    <xsl:template name="sceneActionProcess" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

                        //Scene - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >

                        override fun process(): Boolean {
                            super.processStats()

                            <xsl:if test="type/value = 'Scene'" >
                            <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 2" >
                            //<xsl:value-of select="translate(text(), '\&quot;', '')" />
                            </xsl:if>
                            </xsl:for-each>
                            </xsl:if>

                            <xsl:variable name="command" >
                            <xsl:if test="type/value = 'Scene'" >
                            <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 2" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(text(), '\&quot;', '')" /></xsl:with-param></xsl:call-template></xsl:if>
                            </xsl:for-each>
                            </xsl:if>
                            </xsl:variable>

                            try {

                                //TWB - maybe exclude logic when not from parent input
                                val inputOnNewScene: Boolean = gameGlobalsFactory.newDisplaybleTime <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> gameTickTimeDelayHelper.startTime - 250
                                //this.logUtil.putF("gameGlobalsFactory.newDisplaybleTime > gameTickTimeDelayHelper.startTime - 250: " + gameGlobalsFactory.newDisplaybleTime + " > " + (gameTickTimeDelayHelper.startTime - 250), this, this.commonStrings.PROCESS)

                                if(gameGlobalsFactory.newCanvas) {
                                    this.logUtil.putF(gdStrings.CANVAS_NEW + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)
                                } else if(inputOnNewScene) {
                                    this.logUtil.putF(gdStrings.SCENE_NEW + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)
                                } else {
                                    this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)
                                    PathFindingThreadPool.getInstance().clear()
                                    val abToGBUtil: ABToGBUtil = ABToGBUtil.getInstance()
                                    val abCanvas: MyCanvas = abToGBUtil.abCanvas as MyCanvas
                                    <xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:if test="contains(text(), '(')" >//Invalid Scene - </xsl:if></xsl:if></xsl:for-each>abCanvas.getCustomCommandListener().commandAction(GDGameCommandFactory.getInstance().<xsl:value-of select="$command" />_GD_LAYOUT, ProgressCanvasFactory.getInstance())
<!--                                    <xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:if test="contains(text(), '(')" >//Invalid Scene - </xsl:if></xsl:if></xsl:for-each>abCanvas.getCustomCommandListener().commandAction(<xsl:if test="$command = 'RESUME'" >MyCommandsFactory.getInstance().RESUME_COMMAND</xsl:if><xsl:if test="$command != 'RESUME'" >GDGameCommandFactory.getInstance().<xsl:value-of select="$command" />_GD_LAYOUT</xsl:if>, ProgressCanvasFactory.getInstance());-->
                                }

                            } catch(e: Exception) {
                                this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e)
                            }

                            return true
                        }


                    override fun process(motionGestureEvent: MotionGestureEvent, lastMotionGestureInput: MotionGestureInput): Boolean {
                        super.processStats(motionGestureEvent)

                        //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                        return this.process()
                    }


                    override fun processGD(gameLayerArray: Array&lt;GDGameLayer&gt;): Boolean {
                        super.processGDStats(gameLayerArray)

                        try {
                            //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                            return this.process()
                        } catch(e: Exception) {
                            this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e)
                        }
                        return true
                    }

                        </xsl:if>

                        <xsl:if test="contains($forExtension, 'found')" >

                        override fun process(objectArray: Array&lt;Object&gt;, intArray: IntArray, longArray: LongArray, floatArray: FloatArray): Boolean {

                            //Map from object array with action params
                            val gameLayer: GDGameLayer = objectArray[1] as GDGameLayer
                            this.process(gameLayer, intArray[3], intArray[5])

                            return true
                        }
                        </xsl:if>

                        fun process(gameLayer: GDGameLayer, x: Int, y: Int) {
                            val gdObject: GDObject = gameLayer.gdObject
                            this.process(gdObject, x, y)
                        }

                        fun process(gdObject: GDObject, x: Int, y: Int) {
                            throw RuntimeException()
                        }

    </xsl:template>

    <xsl:template name="launchFileActionProcess" >
        <xsl:param name="forExtension" />

                        //LaunchFile - action - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >

                        override fun process(): Boolean {
                            super.processStats()

                            <xsl:if test="type/value = 'LaunchFile'" >
                            <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 2" >
                            //<xsl:value-of select="translate(text(), '\&quot;', '')" />
                            </xsl:if>
                            </xsl:for-each>
                            </xsl:if>

                            <xsl:variable name="command" >
                            <xsl:if test="type/value = 'LaunchFile'" >
                            <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" ><xsl:value-of select="translate(text(), '\&quot;', '')" /></xsl:if>
                            </xsl:for-each>
                            </xsl:if>
                            </xsl:variable>

                            try {

                                this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                                val abToGBUtil: ABToGBUtil = ABToGBUtil.getInstance()
                                val abCanvas: MyCanvas = abToGBUtil.abCanvas as MyCanvas

                                //TWB - maybe exclude logic when not from parent input
                                val inputOnNewScene: Boolean = gameGlobalsFactory.newDisplaybleTime <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> gameTickTimeDelayHelper.startTime - 250
                                //this.logUtil.putF("gameGlobalsFactory.newDisplaybleTime > gameTickTimeDelayHelper.startTime - 250: " + gameGlobalsFactory.newDisplaybleTime + " > " + (gameTickTimeDelayHelper.startTime - 250), this, this.commonStrings.PROCESS)

                                if(gameGlobalsFactory.newCanvas) {
                                    this.logUtil.putF(gdStrings.CANVAS_NEW + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)
                                } else if(inputOnNewScene) {
                                    this.logUtil.putF(gdStrings.SCENE_NEW + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)
                                } else {
                                    //<xsl:value-of select="$command" />
                                    <xsl:if test="contains($command, 'https://localhost/about.html')" >
                                    abCanvas.getCustomCommandListener().commandAction(org.allbinary.game.commands.GameCommandsFactory.getInstance().DISPLAY_ABOUT, ProgressCanvasFactory.getInstance())
                                    </xsl:if>
                                    <xsl:if test="not(contains($command, 'https://localhost/about.html')) and contains($command, 'http')" >
                                    org.allbinary.graphics.displayable.screen.WebCommandProcessor.getInstance().list.add("<xsl:value-of select="$command" />")
                                    abCanvas.getCustomCommandListener().commandAction(org.allbinary.game.commands.GameCommandsFactory.getInstance().OPEN_WEB_URL, ProgressCanvasFactory.getInstance())
                                    </xsl:if>
                                    <xsl:if test="not(contains($command, 'http'))" >
                                        throw RuntimeException("Not Implemented")
                                    </xsl:if>
                                }

                            } catch(e: Exception) {
                                this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e)
                            }

                            return true
                        }
                        </xsl:if>

                        <xsl:if test="contains($forExtension, 'found')" >

                        override fun process(objectArray: Array&lt;Object&gt;, intArray: IntArray, longArray: LongArray, floatArray: FloatArray): Boolean {

                            //Map from object array with action params
                            val gameLayer: GDGameLayer = objectArray[1] as GDGameLayer
                            this.process(gameLayer, intArray[3], intArray[5])

                            return true
                        }
                        </xsl:if>

                        fun process(gameLayer: GDGameLayer, x: Int, y: Int) {
                            val gdObject: GDObject = gameLayer.gdObject
                            this.process(gdObject, x, y)
                        }

                        fun process(gdObject: GDObject, x: Int, y: Int) {
                            throw RuntimeException()
                        }
    </xsl:template>

</xsl:stylesheet>
