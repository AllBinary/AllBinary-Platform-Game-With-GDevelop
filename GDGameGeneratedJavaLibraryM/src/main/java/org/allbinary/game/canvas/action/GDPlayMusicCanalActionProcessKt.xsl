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

    <xsl:template name="playMusicCanalActionProcess" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

                    //PlayMusicCanal - action - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >

                    override fun process(): Boolean {
                        super.processStats()

                        //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                        <xsl:variable name="fileName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:call-template name="after-lastIndexOf"><xsl:with-param name="string" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="char" >/</xsl:with-param></xsl:call-template></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:variable name="fileName2" ><xsl:value-of select="translate(substring-before($fileName, '.'), '_', ' ')" /></xsl:variable>
                        <xsl:variable name="fileName3" ><xsl:call-template name="camelcase" ><xsl:with-param name="text" ><xsl:value-of select="$fileName2" /></xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:variable name="fileName4" ><xsl:value-of select="translate($fileName3, ' ', '')" /></xsl:variable>

                        <xsl:variable name="volume" ><xsl:for-each select="parameters" ><xsl:if test="position() = 5" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        try {

                            val sound: Sound = <xsl:if test="$fileName4 = 'Select' or $fileName4 = 'Error'" >org.allbinary.media.audio.</xsl:if><xsl:if test="not($fileName4 = 'Select' or $fileName4 = 'Error')" >org.allbinary.game.gd.resource.GD</xsl:if><xsl:value-of select="$fileName4" />Sound.getInstance()
                            val player: PlayerComposite = sound.getPlayerP() as PlayerComposite

                            var leftVolume: Int = 100
                            var rightVolume: Int = 100
                            <xsl:if test="string-length($volume) > 0 and (number($volume) = $volume or contains($volume, 'Variable'))" >
                            val volume: Int = <xsl:value-of select="$volume" />
                            //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + volume, this, this.commonStrings.PROCESS)
                            leftVolume = volume
                            rightVolume = volume
                            player.setVolume(leftVolume, rightVolume)
                            </xsl:if>

                            if(!gameGlobals.channelSoundArray[<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>].contains(sound)) {
                                gameGlobals.channelSoundArray[<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>].add(sound)
                            }

                            //player.start()
                            val abToGBUtil: ABToGBUtil = ABToGBUtil.getInstance()
                            val abCanvas: MyCanvas = abToGBUtil.abCanvas as MyCanvas
                            abCanvas.nextSong(sound, leftVolume, rightVolume)

                        } catch(e: Exception) {
                            this.logUtil.put(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e)
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

</xsl:stylesheet>
