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
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

                        //Scene
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();

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
                                final boolean inputOnNewScene = gameGlobalsFactory.newDisplaybleTime <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> gameTickTimeDelayHelper.startTime - 250;
                                //logUtil.put("gameGlobalsFactory.newDisplaybleTime > gameTickTimeDelayHelper.startTime - 250: " + gameGlobalsFactory.newDisplaybleTime + " > " + (gameTickTimeDelayHelper.startTime - 250), this, commonStrings.PROCESS);
                                
                                if(gameGlobalsFactory.newCanvas) {
                                    logUtil.put(gdStrings.CANVAS_NEW + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                                } else if(inputOnNewScene) {
                                    logUtil.put(gdStrings.SCENE_NEW + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                                } else {
                                    logUtil.put(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                                    PathFindingThreadPool.getInstance().clear();
                                    final ABToGBUtil abToGBUtil = ABToGBUtil.getInstance();
                                    final MyCanvas abCanvas = abToGBUtil.abCanvas;
                                    <xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:if test="contains(text(), '(')" >//Invalid Scene - </xsl:if></xsl:if></xsl:for-each>abCanvas.getCustomCommandListener().commandAction(GDGameCommandFactory.getInstance().<xsl:value-of select="$command" />_GD_LAYOUT, ProgressCanvasFactory.getInstance());
<!--                                    <xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:if test="contains(text(), '(')" >//Invalid Scene - </xsl:if></xsl:if></xsl:for-each>abCanvas.getCustomCommandListener().commandAction(<xsl:if test="$command = 'RESUME'" >MyCommandsFactory.getInstance().RESUME_COMMAND</xsl:if><xsl:if test="$command != 'RESUME'" >GDGameCommandFactory.getInstance().<xsl:value-of select="$command" />_GD_LAYOUT</xsl:if>, ProgressCanvasFactory.getInstance());-->
                                }

                            } catch(Exception e) {
                                logUtil.put(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e);
                            }

                            return true;
                        }
        
    </xsl:template>

    <xsl:template name="launchFileActionProcess" >
        
                        //LaunchFile - action
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();

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

                                logUtil.put(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);

                                final ABToGBUtil abToGBUtil = ABToGBUtil.getInstance();
                                final MyCanvas abCanvas = abToGBUtil.abCanvas;

                                //TWB - maybe exclude logic when not from parent input
                                final boolean inputOnNewScene = gameGlobalsFactory.newDisplaybleTime <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> gameTickTimeDelayHelper.startTime - 250;
                                //logUtil.put("gameGlobalsFactory.newDisplaybleTime > gameTickTimeDelayHelper.startTime - 250: " + gameGlobalsFactory.newDisplaybleTime + " > " + (gameTickTimeDelayHelper.startTime - 250), this, commonStrings.PROCESS);

                                if(gameGlobalsFactory.newCanvas) {
                                    logUtil.put(gdStrings.CANVAS_NEW + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                                } else if(inputOnNewScene) {
                                    logUtil.put(gdStrings.SCENE_NEW + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                                } else {
                                    //<xsl:value-of select="$command" />
                                    <xsl:if test="contains($command, 'https://localhost/about.html')" >
                                    abCanvas.getCustomCommandListener().commandAction(org.allbinary.game.commands.GameCommandsFactory.getInstance().DISPLAY_ABOUT, ProgressCanvasFactory.getInstance());
                                    </xsl:if>
                                    <xsl:if test="not(contains($command, 'https://localhost/about.html')) and contains($command, 'http')" >
                                    org.allbinary.graphics.displayable.screen.WebCommandProcessor.getInstance().list.add("<xsl:value-of select="$command" />");
                                    abCanvas.getCustomCommandListener().commandAction(org.allbinary.game.commands.GameCommandsFactory.getInstance().OPEN_WEB_URL, ProgressCanvasFactory.getInstance());
                                    </xsl:if>
                                    <xsl:if test="not(contains($command, 'http'))" >
                                        throw new RuntimeException("Not Implemented");
                                    </xsl:if>
                                }

                            } catch(Exception e) {
                                logUtil.put(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e);
                            }

                            return true;
                        }
        
    </xsl:template>

</xsl:stylesheet>
