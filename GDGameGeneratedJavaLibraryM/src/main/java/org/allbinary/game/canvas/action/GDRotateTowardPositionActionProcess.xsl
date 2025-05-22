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

    <xsl:import href="../GDLayoutInstances.xsl" />
    
    <xsl:template name="rotateTowardPositionActionProcess" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />
        
        private final NoDecimalTrigTable noDecimalTrigTable = NoDecimalTrigTable.getInstance();
        
        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //RotateTowardPosition - action
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();
                        
                        <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >final int size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size();</xsl:if></xsl:for-each>
                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >final GDGameLayer gameLayer = (((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index)));</xsl:if></xsl:for-each>
                            this.processGD(gameLayer, null, globals.graphics);
                            gameLayer.updateGDObject(globals.globalsGameTickTimeDelayHelper.timeDelta);
                        }

                        return true;
                    }

                    @Override
                    public boolean processGD(final GDGameLayer gameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
                        super.processGDStats(gameLayer);

                            <xsl:call-template name="layoutInstances" >
                                <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                                <xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param>
                            </xsl:call-template>

                        <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >final GDObject <xsl:value-of select="text()" /> = gameLayer.gdObject;</xsl:if></xsl:for-each>
                        <xsl:text>&#10;</xsl:text>
<xsl:text>                        </xsl:text>final int dx = <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />.x - </xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if></xsl:for-each>
                        <xsl:text>&#10;</xsl:text>
<xsl:text>                        </xsl:text>final int dy = <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />.y - </xsl:if><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if></xsl:for-each>

                            final int angleOfTarget = noDecimalTrigTable.antiTan(dx, dy);
                            short angle = (short) (270 - angleOfTarget - <xsl:value-of select="$name" />.angle);
                            while (angle <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 359) {
                                angle -= 360;
                            }
                            while (angle <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> 0) {
                                angle += 360;
                            }
                            
                            <xsl:value-of select="$name" />.rotation = angle;
                            if(<xsl:value-of select="$name" />.rotation != 0) {
                                LogUtil.put(LogFactory.getInstance(new StringMaker().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(<xsl:value-of select="$name" />.rotation).append("<xsl:text>&lt;</xsl:text>").append(<xsl:value-of select="$name" />.angle).toString(), this, commonStrings.PROCESS));
                            }
                            gameLayer.updateRotation(1000);
                            if(<xsl:value-of select="$name" />.rotation != 0) {
                                LogUtil.put(LogFactory.getInstance(new StringMaker().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(<xsl:value-of select="$name" />.rotation).append("<xsl:text>&gt;</xsl:text>").append(<xsl:value-of select="$name" />.angle).toString(), this, commonStrings.PROCESS));
                            }
                            <xsl:value-of select="$name" />.rotation = 0;

                        <xsl:text>&#10;</xsl:text>
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />.y</xsl:if></xsl:for-each>, this, commonStrings.PROCESS));
                        
                        return true;
                    }

                    @Override
                    public boolean process(final int index) throws Exception {
                        super.processStats(index);

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));
                        
                        try {

                            <xsl:call-template name="layoutInstances" >
                                <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                                <xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param>
                            </xsl:call-template>
                                                
                        <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >final GDGameLayer gameLayer = ((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index));</xsl:if></xsl:for-each>
                        <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >final GDObject <xsl:value-of select="text()" /> = gameLayer.gdObject;</xsl:if></xsl:for-each>
                        <xsl:text>&#10;</xsl:text>

<xsl:text>                        </xsl:text>final int dx = <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />.x - </xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if></xsl:for-each>
                        <xsl:text>&#10;</xsl:text>
<xsl:text>                        </xsl:text>final int dy = <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />.y - </xsl:if><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if></xsl:for-each>
                        
                            final int angleOfTarget = noDecimalTrigTable.antiTan(dx, dy);
                            short angle = (short) (270 - angleOfTarget - <xsl:value-of select="$name" />.angle);
                            while (angle <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 359) {
                                angle -= 360;
                            }
                            while (angle <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> 0) {
                                angle += 360;
                            }

                            <xsl:value-of select="$name" />.rotation = angle;
                            if(<xsl:value-of select="$name" />.rotation != 0) {
                                LogUtil.put(LogFactory.getInstance(new StringMaker().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(<xsl:value-of select="$name" />.rotation).append("<xsl:text>&lt;</xsl:text>").append(<xsl:value-of select="$name" />.angle).toString(), this, commonStrings.PROCESS));
                            }
                            gameLayer.updateRotation(1000);
                            if(<xsl:value-of select="$name" />.rotation != 0) {
                                LogUtil.put(LogFactory.getInstance(new StringMaker().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(<xsl:value-of select="$name" />.rotation).append("<xsl:text>&gt;</xsl:text>").append(<xsl:value-of select="$name" />.angle).toString(), this, commonStrings.PROCESS));
                            }
                            <xsl:value-of select="$name" />.rotation = 0;

                        } catch(Exception e) {
                            LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                        }
                        
                        <xsl:text>&#10;</xsl:text>
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />.x</xsl:if></xsl:for-each>, this, commonStrings.PROCESS));

                        return true;
                    }

    </xsl:template>

</xsl:stylesheet>
