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

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

    <xsl:template name="rotateActionProcess" >

                        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:variable name="gdObjectName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                            
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

        <xsl:if test="../conditions" >
            //Sibling Conditions
            boolean siblingConditions = true;
            <xsl:for-each select="../conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:if test="$typeValue = 'Timer'" >
                    //Condition - //Timer - call
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'NbObjet'" >
                    //Condition - //NbObjet - call
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'VarScene'" >
                    //Condition - //VarScene - call
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                        siblingConditions = false;
                    }
                </xsl:if>
            </xsl:for-each>
        </xsl:if>

                        //if(globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList != null) {
                        if(globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.objectArray != arrayUtil.ZERO_OBJECT_ARRAY) {
                            GDGameLayer gameLayer;
                            final int size = globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.size();
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                gameLayer = (GDGameLayer) globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index);

        <xsl:if test="../conditions" >
            <xsl:for-each select="../conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:if test="$typeValue = 'PosX'" >
                    //PosX
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processG(gameLayer.gdObject, globals.graphics)) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'PosY'" >
                    //PosY
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processG(gameLayer.gdObject, globals.graphics)) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'VarObjet'" >
                    //VarObjet
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processG(gameLayer.gdObject, globals.graphics)) {
                        siblingConditions = false;
                    }
                </xsl:if>
            </xsl:for-each>
                if(siblingConditions) {
                    this.processGD(((GDGameLayer) globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index)), globals.graphics);
                }
        </xsl:if>

        <xsl:if test="not(../conditions)" >
                                this.processGD(((GDGameLayer) globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index)), globals.graphics);
        </xsl:if>
                                //updateGDObject - 5
                                gameLayer.updateGDObject(globals.timeDelta);
                                }
                            } else {
                                //LogUtil.put(LogFactory.getInstance("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> <xsl:value-of select="$gdObjectName" />GDGameLayerList was null", this, commonStrings.PROCESS));
                            }
                                
                            return true;
                        }

                        @Override
                        public void processReleased() throws Exception { //Rotate
                            super.processReleasedStats();
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, globals.PROCESS_RELEASE));

        <xsl:if test="../conditions" >
            //Sibling Conditions
            boolean siblingConditions = true;
            <xsl:for-each select="../conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:if test="$typeValue = 'Timer'" >
                    //Condition - //Timer - call
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'NbObjet'" >
                    //Condition - //NbObjet - call
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'VarScene'" >
                    //Condition - //VarScene - call
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                        siblingConditions = false;
                    }
                </xsl:if>
            </xsl:for-each>
        </xsl:if>

                        //if(globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList != null) {
                        if(globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.objectArray != arrayUtil.ZERO_OBJECT_ARRAY) {
                            GDGameLayer gameLayer;
                            final int size = globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.size();
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                gameLayer = (GDGameLayer) globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index);

        <xsl:if test="../conditions" >
            <xsl:for-each select="../conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:if test="$typeValue = 'PosX'" >
                    //Condition - //PosX - call
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processG(gameLayer.gdObject, globals.graphics)) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'PosY'" >
                    //Condition - //PosY - call
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processG(gameLayer.gdObject, globals.graphics)) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'VarObjet'" >
                    //Condition - //VarObjet - call
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processG(gameLayer.gdObject, globals.graphics)) {
                        siblingConditions = false;
                    }
                </xsl:if>
            </xsl:for-each>
                if(siblingConditions) {
                    this.processReleased(((GDGameLayer) globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index)).gdObject);
                }
        </xsl:if>

        <xsl:if test="not(../conditions)" >
                                this.processReleased(((GDGameLayer) globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index)).gdObject);
        </xsl:if>
                                //updateGDObject - 6
                                gameLayer.updateGDObject(globals.timeDelta);
                                }
                            } else {
                                //LogUtil.put(LogFactory.getInstance("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> <xsl:value-of select="$gdObjectName" />GDGameLayerList was null", this, commonStrings.PROCESS));
                            }
                        }

                        //Rotate
                        @Override
                        public boolean processG(final GDObject <xsl:value-of select="$name" />, final Graphics graphics) {

                            try {
                                super.processGStats(<xsl:value-of select="$name" />, graphics);
                        
                                return this.processGPaint(<xsl:value-of select="$name" />, graphics);
                            } catch(Exception e) {
                                //3
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }

                            return true;
                        }
                                
                        @Override
                        public boolean processGPaint(final GDObject <xsl:value-of select="$name" />, final Graphics graphics) {
                        
                            try {
                            <xsl:if test="$name = 'player'" >
                                //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                            </xsl:if>
                                //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                                //Parameters - 3
                                <xsl:for-each select="parameters" ><xsl:value-of select="text()" /><xsl:if test="position() = 1" >.rotation = <xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" >;</xsl:if></xsl:for-each>
                                //<xsl:for-each select="parameters" ><xsl:value-of select="text()" /><xsl:if test="position() = 1" >.angle += <xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" >;</xsl:if></xsl:for-each>
                            } catch(Exception e) {
                                //3
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }

                            return true;
                        }

                        @Override
                        public boolean processReleased(final GDObject <xsl:value-of select="$name" />) {
                        <xsl:if test="$name = 'player'" >
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, globals.PROCESS_RELEASE));
                        </xsl:if>
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                            <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />.rotation = 0;</xsl:if></xsl:for-each>
                            return true;
                        }

    </xsl:template>

</xsl:stylesheet>