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

    <xsl:template name="eventsCreateAssignGDObject" >
        <xsl:param name="caller" />
        <xsl:param name="totalRecursions" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="instancesAsString" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="conditionEventPosition" />

        //<xsl:value-of select="$caller" /> - eventsCreateAssignGDObject - START
        <xsl:for-each select="events" >
            <xsl:variable name="eventPosition" select="position()" />
            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />
            <xsl:for-each select="comment" >
                //Comment: <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="comment2" >
                <xsl:if test="string-length(text()) > 0" >
                    //Comment 2: <xsl:value-of select="text()" />
                </xsl:if>
            </xsl:for-each>
            <xsl:for-each select="infiniteLoopWarning" >
                //infiniteLoopWarning <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="iterableVariableName" >
                //iterableVariableName: <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="valueIteratorVariableName" >
                //valueIteratorVariableName: <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="name" >
                //name <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="source" >
                <xsl:if test="string-length(text()) > 0" >
                    //source <xsl:value-of select="text()" />
                </xsl:if>
            </xsl:for-each>
            <xsl:for-each select="colorR" >
                //colorR <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="colorG" >
                //colorG <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="colorB" >
                //colorB <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="target" >
                //target <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:variable name="actionWithUsedType" >
                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    <xsl:if test="$typeValue = 'Delete' or $typeValue = 'UnPauseTimer' or $typeValue = 'MettreX' or $typeValue = 'MettreY'  or $typeValue = 'MettreXY' or $typeValue = 'SetAngle' or $typeValue = 'ChangePlan' or $typeValue = 'ChangeAnimation' or $typeValue = 'ModVarObjet' or $typeValue = 'TextObject::ChangeColor' or $typeValue = 'ModVarGlobal' or $typeValue = 'ModVarScene' or $typeValue = 'AddForceAL'" >found</xsl:if>
                </xsl:for-each>
            </xsl:variable>

            <xsl:variable name="hasAssociatedSiblingCondition" select="conditions/type/value = 'MouseButtonReleased' or conditions/type/value = 'VarScene' or conditions/type/value = 'Timer'" />
            <xsl:variable name="parametersAsString" ><xsl:for-each select="actions" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:for-each></xsl:variable>

            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:if test="$typeValue = 'Timer'" >
                    if(this.actionArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }                    
                    this.actionArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDAction() {
                        
                        public void process() {
                            if(<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:if></xsl:for-each>TimeDelayHelper.isTime(GameTickTimeDelayHelperFactory.getInstance().getStartTime())) {
                            <xsl:for-each select="actions" >
                                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                            <xsl:text>&#10;</xsl:text>
                                actionArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                            </xsl:for-each>
                            }
                        }

                    };
                </xsl:if>
                <xsl:if test="$typeValue = 'PosX'" >
                    //PosX
                    if(this.actionArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }                    
                    this.actionArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDAction() {

                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>";
                        private final String ELSE_CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Else: " + CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;
                        
                        public void process() {
                            <xsl:variable name="gdObjectName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            final int size = <xsl:value-of select="$gdObjectName" />Array.length;
                            //GDObject <xsl:value-of select="$gdObjectName" />;
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                    
                                GDObject <xsl:value-of select="$gdObjectName" /><xsl:text> = </xsl:text><xsl:value-of select="$gdObjectName" />Array[index];
                                if(<xsl:for-each select="parameters" ><xsl:text><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:text><xsl:if test="position() = 1" >.x</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>) {
                                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                    <xsl:for-each select=".." >
                                        <xsl:call-template name="actionIdsGDObject" >
                                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>   
                                            <xsl:with-param name="gdObjectName" ><xsl:value-of select="$gdObjectName" />Array[index]</xsl:with-param>
                                            <xsl:with-param name="gdGameLayer" ><xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index)</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                } //else {
                                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ELSE_CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                //}
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, <xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index).toString()));
                            }

                        }

                    };
                </xsl:if>
                <xsl:if test="$typeValue = 'PosY'" >
                    //PosY
                    if(this.actionArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    this.actionArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDAction() {

                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>";
                        private final String ELSE_CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Else: " + CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;
                        
                        public void process() {
                    
                            <xsl:variable name="gdObjectName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            final int size = <xsl:value-of select="$gdObjectName" />Array.length;
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {

                                GDObject <xsl:value-of select="$gdObjectName" /><xsl:text> = </xsl:text><xsl:value-of select="$gdObjectName" />Array[index];
                                if(<xsl:for-each select="parameters" ><xsl:text><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:text><xsl:if test="position() = 1" >.y</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>) {
                                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                    <xsl:for-each select=".." >
                                        <xsl:call-template name="actionIdsGDObject" >
                                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>                                
                                            <xsl:with-param name="gdObjectName" ><xsl:value-of select="$gdObjectName" />Array[index]</xsl:with-param>
                                            <xsl:with-param name="gdGameLayer" ><xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index)</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                } //else {
                                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ELSE_CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                //}
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, <xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index).toString()));
                            }

                        }

                    };
                </xsl:if>
                <xsl:if test="$typeValue = 'NbObjet'" >
                    if(this.actionArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    this.actionArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDAction() {
                        
                        public void process() {
                    
                            if(<xsl:for-each select="parameters" ><xsl:if test="position() != 1" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if><xsl:if test="position() = 1" >groupLayerManagerListener.getGroupSize(gdGroupHelper.get(<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:with-param></xsl:call-template>))</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>) {
                    
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().START, this, "<xsl:for-each select="parameters" ><xsl:if test="position() != 1" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if><xsl:if test="position() = 1" >groupLayerManagerListener.getGroupSize(gdGroupHelper.get(<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:with-param></xsl:call-template>))</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>"));
                    
                                <xsl:for-each select=".." >
                                    <xsl:call-template name="actionIds" >
                                        <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                                        <xsl:with-param name="caller" >NbObjet</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:for-each>
                            } else {
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().START, this, "Else: <xsl:for-each select="parameters" ><xsl:if test="position() != 1" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if><xsl:if test="position() = 1" >groupLayerManagerListener.getGroupSize(gdGroupHelper.get(<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:with-param></xsl:call-template>))</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>"));
                            }

                        }

                    };                    
                </xsl:if>
                <xsl:if test="$typeValue = 'VarObjet'" >
                    if(this.actionArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    this.actionArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDAction() {
                        
                        public void process() {
                    
                            <xsl:variable name="gdObjectName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            final int size = <xsl:value-of select="$gdObjectName" />Array.length;
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                    
                                if(<xsl:for-each select="parameters" ><xsl:if test="text() = 'rotation'" >Array[index].</xsl:if><xsl:if test="position() != 1 and  text() != 'rotation'" ><xsl:text> </xsl:text></xsl:if><xsl:text><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:text><xsl:if test="text() = '='" >=</xsl:if></xsl:for-each>) {
                                    <xsl:for-each select=".." >
                                        <xsl:call-template name="actionIdsGDObject" >
                                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                                            <xsl:with-param name="gdObjectName" ><xsl:value-of select="$gdObjectName" />Array[index]</xsl:with-param>
                                            <xsl:with-param name="gdGameLayer" ><xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index)</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                }

                            }

                        }

                    };                    
                </xsl:if>
                <xsl:if test="$typeValue = 'VarScene'" >
                    if(this.actionArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    this.actionArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDAction() {
                        
                        public void process() {
                    
                            if(<xsl:for-each select="parameters" ><xsl:text><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:text><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>) {
                                <xsl:for-each select=".." >
                                    <xsl:call-template name="actionIds" >
                                        <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                                        <xsl:with-param name="caller" >VarScene</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:for-each>
                            }

                        }

                    };                    
                </xsl:if>
            </xsl:for-each>

            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />

                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:text>&#10;</xsl:text>

                    //Action - process - for Condition totalRecursions=<xsl:value-of select="$totalRecursions" /> eventPosition=<xsl:value-of select="$eventPosition" /> conditionEventPosition=<xsl:value-of select="$conditionEventPosition" /> hasAssociatedSiblingCondition=<xsl:value-of select="$hasAssociatedSiblingCondition" />
                    if(this.actionArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    this.actionArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDAction() {

                                <xsl:if test="$typeValue = 'Scene'" >
                        <xsl:variable name="quote" >"</xsl:variable>
                        <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        private final String ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($actionAsString, $quote, ' ')" />";
                        <xsl:text>&#10;</xsl:text>
                                    
                        //Scene
                        public void process() {
                            <xsl:if test="$typeValue = 'Scene'" >
                            <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 2" >
                            //<xsl:value-of select="translate(text(), '\&quot;', '')" />
                            final String TEXT = <xsl:value-of select="text()" />;
                            </xsl:if>
                            </xsl:for-each>
                            </xsl:if>

                            try {

                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                    
                                ((GDGameMIDlet) MIDletBridge.getCurrentMIDlet()).setGDLayout(TEXT);
                                
                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }
                                
                                </xsl:if>

                                <xsl:if test="$typeValue != 'Scene' and $typeValue != 'MettreX' and $typeValue != 'MettreY' and $typeValue != 'SceneBackground' and $typeValue != 'Rotate'" >

                                </xsl:if>
                                
                                <xsl:if test="$typeValue = 'MettreX'" >
                        <xsl:variable name="quote" >"</xsl:variable>
                        <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        private final String ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($actionAsString, $quote, ' ')" />";
                        <xsl:text>&#10;</xsl:text>
                                    
                        //MettreX
                        /*
                        public void process() {
                            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));

                            <xsl:variable name="gdObjectName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                            GDGameLayer gameLayer;
                            final int size = <xsl:value-of select="$gdObjectName" />GDGameLayerList.size();
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                gameLayer = (GDGameLayer) <xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index);
                                this.process(<xsl:value-of select="$gdObjectName" />Array[index]);
                                gameLayer.updateGDObject();
                            }
                        }
                        */                       

                        public void process(final GDObject gdObject) {
                            this.processG(gdObject, graphics);
                        }

                        public void processG(final GDObject gdObject, final Graphics graphics) {

                            try {

                                <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                                
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                final GDObject <xsl:value-of select="$name" /> = gdObject;
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, <xsl:value-of select="$name" />.toString()));
                                
                                <xsl:for-each select="parameters" >
                                <xsl:value-of select="text()" /><xsl:if test="position() = 1" >.x</xsl:if>
                                </xsl:for-each>;
                                
                                <xsl:variable name="name2" >touch:<xsl:value-of select="$name" />,</xsl:variable>
                                <xsl:if test="contains($instancesAsString, $name2)" >
                                //name2=<xsl:value-of select="$name2" /><xsl:text>&#10;</xsl:text>
                                <xsl:value-of select="$name" />Rectangle = new Rectangle(
                                    PointFactory.getInstance().getInstance(<xsl:value-of select="$name" />.x, <xsl:value-of select="$name" />.y),
                                    <xsl:value-of select="$name" />.Width(graphics), <xsl:value-of select="$name" />.Height(graphics));
                                </xsl:if>
                                
                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }
                                </xsl:if>
                                <xsl:if test="$typeValue = 'MettreY'" >
                        <xsl:variable name="quote" >"</xsl:variable>
                        <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        private final String ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($actionAsString, $quote, ' ')" />";
                        <xsl:text>&#10;</xsl:text>

                        //MettreY
                        public void process(final GDObject gdObject) {
                            this.processG(gdObject, graphics);
                        }

                        public void processG(final GDObject gdObject, final Graphics graphics) {


                            try {

                                <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                                
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                
                                final GDObject <xsl:value-of select="$name" /> = gdObject;
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, <xsl:value-of select="$name" />.toString()));
                                
                                <xsl:for-each select="parameters" >
                                <xsl:value-of select="text()" /><xsl:if test="position() = 1" >.y</xsl:if>
                                </xsl:for-each>;

                                <xsl:variable name="name2" >touch:<xsl:value-of select="$name" />,</xsl:variable>
                                <xsl:if test="contains($instancesAsString, $name2)" >
                                //name2=<xsl:value-of select="$name2" /><xsl:text>&#10;</xsl:text>
                                <xsl:value-of select="$name" />Rectangle = new Rectangle(
                                    PointFactory.getInstance().getInstance(<xsl:value-of select="$name" />.x, <xsl:value-of select="$name" />.y),
                                    <xsl:value-of select="$name" />.Width(graphics), <xsl:value-of select="$name" />.Height(graphics));
                                </xsl:if>
                                                
                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }
                                </xsl:if>
                                <xsl:if test="$typeValue = 'MettreXY'" >
                        <xsl:variable name="quote" >"</xsl:variable>
                        <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        private final String ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($actionAsString, $quote, ' ')" />";
                        <xsl:text>&#10;</xsl:text>

                        //MettreXY
                        public void process(final GDObject gdObject) {
                            this.processG(gdObject, graphics);
                        }

                        public void processG(final GDObject gdObject, final Graphics graphics) {


                            try {

                                <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                                
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                
                                final GDObject <xsl:value-of select="$name" /> = gdObject;
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, <xsl:value-of select="$name" />.toString()));
                                
                                <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" ><xsl:value-of select="text()" />.x</xsl:if><xsl:if test="position() = 2 or position() = 3" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;<xsl:text>&#10;</xsl:text></xsl:if>
                                </xsl:for-each>
                                <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" ><xsl:value-of select="text()" />.y</xsl:if><xsl:if test="position() > 3" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                                </xsl:for-each>

                                <xsl:variable name="name2" >touch:<xsl:value-of select="$name" />,</xsl:variable>
                                <xsl:if test="contains($instancesAsString, $name2)" >
                                //name2=<xsl:value-of select="$name2" /><xsl:text>&#10;</xsl:text>
                                <xsl:value-of select="$name" />Rectangle = new Rectangle(
                                    PointFactory.getInstance().getInstance(<xsl:value-of select="$name" />.x, <xsl:value-of select="$name" />.y),
                                    <xsl:value-of select="$name" />.Width(graphics), <xsl:value-of select="$name" />.Height(graphics));
                                </xsl:if>

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }
                                </xsl:if>
                                                                
                                <xsl:if test="$typeValue = 'UnPauseTimer'" >
                        <xsl:variable name="quote" >"</xsl:variable>
                        <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        private final String ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($actionAsString, $quote, ' ')" />";
                        <xsl:text>&#10;</xsl:text>

                        //UnPauseTimer
                        public void process() {

                            try {

                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                    
                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 2" ><xsl:value-of select="translate(text(), '&quot;', '')" />TimeDelayHelper.unPause();</xsl:if>
                                    </xsl:for-each>
                                
                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }
                                </xsl:if>

                                <xsl:if test="$typeValue = 'SetAngle'" >
                        <xsl:variable name="quote" >"</xsl:variable>
                        <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        private final String ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($actionAsString, $quote, ' ')" />";
                        <xsl:text>&#10;</xsl:text>
                    //SetAngle
                        public void process() {

                            try {

                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                    
                    <xsl:for-each select="parameters" >
                        //<xsl:if test="position() = 1" ><xsl:value-of select="text()" />Array[index].angle</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /> (short)</xsl:if><xsl:if test="position() = 3" ><xsl:if test="substring-before(text(), '.') = ''" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="substring-before(text(), '.') != ''" ><xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template>Array[index].<xsl:value-of select="substring-after(text(), '.')" /></xsl:if></xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                                
                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }
                                </xsl:if>

                                <xsl:if test="$typeValue = 'ChangePlan'" >
                        <xsl:variable name="quote" >"</xsl:variable>
                        <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        private final String ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($actionAsString, $quote, ' ')" />";
                        <xsl:text>&#10;</xsl:text>
                    
                    //ChangePlan
                        public void process() {

                            try {

                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                    
                    <xsl:for-each select="parameters" >
                        //<xsl:if test="position() = 1" ><xsl:value-of select="text()" />Array[index].zOrder</xsl:if><xsl:if test="position() != 1" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                                
                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }
                                </xsl:if>

                                <xsl:if test="$typeValue = 'ModVarScene'" >
                        <xsl:variable name="quote" >"</xsl:variable>
                        <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        private final String ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($actionAsString, $quote, ' ')" />";
                        <xsl:text>&#10;</xsl:text>

                    //ModVarScene
                        public void process() {

                            try {

                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));

                    <xsl:for-each select="parameters" >
                        <xsl:if test="contains(text(), 'player.')" >
                                //Hack for GDevelop player
                                final GDObject player = playerArray[0];
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:for-each select="parameters" >
                                //Hack for GDevelop player_life
                    </xsl:for-each>
                    <xsl:for-each select="parameters" >
                                <xsl:if test="text() = 'player_life'" >//</xsl:if><xsl:value-of select="text()" /><xsl:if test="text() = '+'" >=</xsl:if><xsl:if test="text() = '-'" >=</xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                                
                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }

                                </xsl:if>

                                <xsl:if test="$typeValue = 'TextObject::ChangeColor'" >
                        <xsl:variable name="quote" >"</xsl:variable>
                        <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        private final String ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($actionAsString, $quote, ' ')" />";
                        <xsl:text>&#10;</xsl:text>

                        //TextObject::ChangeColor
                        public void process() {

                            try {

                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                    
                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 1" >
                                            <xsl:value-of select="text()" />TextAnimation.setBasicColor(new BasicColor(255, </xsl:if>
                                        <xsl:if test="position() = 2" >
                                            <xsl:value-of select="translate(substring(text(), 2, string-length(text()) - 2), ';', ',')" />
                                        </xsl:if>
                                        <xsl:if test="position() = last()" >, "<xsl:value-of select="$typeValue" />"));</xsl:if>
                                    </xsl:for-each>
                                    <xsl:text>&#10;</xsl:text>
                                
                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }
                                    
                                </xsl:if>

                                <xsl:if test="$typeValue = 'Delete'" >
                        <xsl:variable name="quote" >"</xsl:variable>
                        <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        private final String ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($actionAsString, $quote, ' ')" />";
                        <xsl:text>&#10;</xsl:text>

                                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        //Delete
                        public void processGD(final GDGameLayer <xsl:value-of select="$name" />GDGameLayer) {

                            try {

                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                    
                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 1" >
                                            //<xsl:value-of select="text()" />
                                            allBinaryGameLayerManager.remove(<xsl:value-of select="text()" />GDGameLayer);
                                        </xsl:if>
                                    </xsl:for-each>
                                    <xsl:text>&#10;</xsl:text>
                                
                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }
                                    
                                </xsl:if>

                                <xsl:if test="$typeValue = 'AddForceAL'" >
                        <xsl:variable name="quote" >"</xsl:variable>
                        <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        private final String ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($actionAsString, $quote, ' ')" />";
                        <xsl:text>&#10;</xsl:text>

                                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //AddForceAL
                    public void process() {

                    try {
            <xsl:if test="../actions" >
                        final int size = <xsl:value-of select="$name" />GDGameLayerList.size();

                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                        
                            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().INDEX_LABEL + index));
            </xsl:if>
                <xsl:call-template name="gameLayerList" >
                    <xsl:with-param name="name" >
                        <xsl:value-of select="$name"/>
                    </xsl:with-param>
                </xsl:call-template>
            
                            this.processGD(<xsl:value-of select="$name" />GDGameLayer, <xsl:value-of select="$name" />);
            
            <xsl:if test="../actions" >
                        }
            </xsl:if>

                    } catch(Exception e) {
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, CommonStrings.getInstance().PROCESS, e));
                    }

                    }

                        public void processGD(final GDGameLayer <xsl:value-of select="$name" />GDGameLayer, final GDObject <xsl:value-of select="$name" />) {

                            try {

                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                    
                                    //name=<xsl:value-of select="$name" />
                                    <xsl:text>&#10;</xsl:text>
                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 1" >
                                            <xsl:value-of select="text()" />GDGameLayer.AddForceUsingPolarCoordinates(</xsl:if>
                                        <xsl:if test="position() != 1 and position() != last()" >
                                            <xsl:variable name="paramText" select="text()" />
                            
                                            <xsl:variable name="key" >
                                                <xsl:for-each select="/game/variables/value" >
                                                    <xsl:variable name="variable" >Variable(<xsl:value-of select="text()" />)</xsl:variable>
                                                    <xsl:if test="contains($paramText, $variable)" >
                                                        <xsl:value-of select="text()" />
                                                    </xsl:if>
                                                </xsl:for-each>
                                            </xsl:variable>
                            
                                            <xsl:if test="string-length($key) > 0" >
                                                <xsl:call-template name="string-replace-all" >
                                                    <xsl:with-param name="text" >
                                                        <xsl:value-of select="$paramText" />
                                                    </xsl:with-param>
                                                    <xsl:with-param name="find" >Variable(<xsl:value-of select="$key" />)</xsl:with-param>
                                                    <xsl:with-param name="replacementText" >Variable(<xsl:value-of select="$name" />.<xsl:value-of select="$key" />)</xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:if>
                                            <xsl:if test="string-length($key) = 0" >
                                                <xsl:value-of select="$paramText" />
                                            </xsl:if>,<xsl:text> </xsl:text>
                                        </xsl:if>
                                        <xsl:if test="position() = last()" >
                                            <xsl:value-of select="text()" />);
                                        </xsl:if>
                                    </xsl:for-each>
                                    <xsl:text>&#10;</xsl:text>
                                
                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }
                                                                        
                                </xsl:if>
                                                                
                                <xsl:if test="$typeValue = 'Rotate'" >
                        <xsl:variable name="quote" >"</xsl:variable>
                        <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        private final String ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($actionAsString, $quote, ' ')" />";
                        <xsl:text>&#10;</xsl:text>

                            <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            
                        //Rotate
                        public void process(GDObject <xsl:value-of select="$name" />) {
                            <xsl:for-each select="parameters" ><xsl:value-of select="text()" /><xsl:if test="position() = 1" >.rotation =<xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" >;</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>
                        }
                                </xsl:if>

                            <xsl:for-each select="../conditions" >

                                <xsl:variable name="typeValue" select="type/value" />
                                <xsl:if test="$typeValue = 'SourisSurObjet'" >
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>";

                        //SourisSurObjet
                        public void process(final MotionGestureEvent motionGestureEvent) {
                            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                <xsl:for-each select="parameters" >
                                    <xsl:if test="position() = 1" >
                            if(<xsl:value-of select="text()" />Rectangle != null) {
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "<xsl:value-of select="text()" />Rectangle - Not Null"));
                                final GPoint point = motionGestureEvent.getCurrentPoint();
                                final GPoint rectangePoint = <xsl:value-of select="text()" />Rectangle.getPoint();
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "<xsl:value-of select="text()" />Rectangle - motionGestureEvent: " + motionGestureEvent.toString()));
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "<xsl:value-of select="text()" />Rectangle: " + <xsl:value-of select="text()" />Rectangle.toString()));                                
                                if (RectangleCollisionUtil.isInside(rectangePoint.getX(), rectangePoint.getY(), <xsl:value-of select="text()" />Rectangle.getMaxX(), <xsl:value-of select="text()" />Rectangle.getMaxY(),
                                    point.getX(), point.getY()))
                                {
                                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "Inside"));
                                    this.process();
                                }
                            } else {
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "<xsl:value-of select="text()" />Rectangle - Null"));
                            }
                                    </xsl:if>
                                </xsl:for-each>
                        }
                                </xsl:if>
                            </xsl:for-each>
                    };
            </xsl:for-each>

            <xsl:if test="contains($actionWithUsedType, 'found')" >
                //Event - Actions - process - used
                if(this.actionArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                    throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                }
                this.actionArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDAction() {

            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'Create'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                final GDGameLayerFactory <xsl:value-of select="text()" />GDGameLayerFactory = GD1SpecialAnimation.this.<xsl:value-of select="text()" />GDGameLayerFactory;
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:for-each>

                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    <xsl:variable name="quote" >"</xsl:variable>
                    <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                    private final String ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Event Type Specific - <xsl:value-of select="translate($actionAsString, $quote, ' ')" />";
                    <xsl:text>&#10;</xsl:text>
                </xsl:for-each>

                    public void process() {

                    //objectGDObjectAtIndex2 - START
                    <xsl:call-template name="objectGDObjectAtIndex2" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="parametersAsString" >
                            <xsl:value-of select="$parametersAsString" />
                        </xsl:with-param>
                    </xsl:call-template>                    
                    <!--
                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />                        
                    <xsl:if test="not(preceding-sibling::actions[type/value/text() = 'Create'])">        
                    </xsl:if>
                </xsl:for-each>
                    -->
                    //objectGDObjectAtIndex2 - END
                                        
                    try {
            
            <xsl:if test="actions" >
                        //repeatExpression <xsl:value-of select="repeatExpression" />
                        final int size = <xsl:if test="not(repeatExpression)" >1</xsl:if><xsl:if test="repeatExpression" ><xsl:value-of select="repeatExpression" /></xsl:if>;
                        
                        <xsl:for-each select="actions" >
                            <xsl:variable name="typeValue" select="type/value" />
                            <xsl:if test="$typeValue = 'Create'" >
                                <xsl:variable name="nodeId" >nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> </xsl:variable>
                                <xsl:for-each select="parameters" >
                                    <xsl:if test="position() = 2" >
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "<xsl:value-of select="$nodeId" /><xsl:value-of select="text()" />GDGameLayerList = new BasicArrayList(size);"));
                        <xsl:value-of select="text()" />GDGameLayerList = new BasicArrayList(size);
                                    </xsl:if>
                                </xsl:for-each>
                            </xsl:if>
                        </xsl:for-each>

                        final BasicArrayList gameLayerList = new BasicArrayList();
                
                        final StringBuilder stringBuilder = new StringBuilder();        
                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
            </xsl:if>
            
            gameLayerList.clear();
            boolean actionWithUpdate = false;
            
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:text>&#10;</xsl:text>
                <xsl:if test="$typeValue = 'UnPauseTimer'" >
                    //UnPauseTimer
                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    <xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="translate(text(), '&quot;', '')" />TimeDelayHelper.unPause();</xsl:if></xsl:for-each>
                </xsl:if>
                <xsl:if test="$typeValue = 'Create'" >
                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    <xsl:variable name="nodeId" >nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> </xsl:variable>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            //Create
                            final GDObject <xsl:value-of select="text()" /> = <xsl:value-of select="text()" />Array[index];
                            stringBuilder.delete(0, stringBuilder.length());
                            final GDGameLayer <xsl:value-of select="text()" />GDGameLayer = <xsl:value-of select="text()" />GDGameLayerFactory.create(stringBuilder.append(<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>).append(CommonSeps.getInstance().UNDERSCORE).append(index).toString(), <xsl:value-of select="text()" />, <xsl:value-of select="text()" />GDActionsCollidableBehavior);
                            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "<xsl:value-of select="$nodeId" /> for <xsl:value-of select="text()" />GDGameLayerList.add(<xsl:value-of select="text()" />GDGameLayer); at: " + index));
                            <xsl:value-of select="text()" />GDGameLayerList.add(<xsl:value-of select="text()" />GDGameLayer);
                        </xsl:if>
                    </xsl:for-each>

                </xsl:if>
                
                <xsl:if test="$typeValue = 'MettreX'" >
                    //MettreX
                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        actionWithUpdate = true;
                        if(<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                            final GDGameLayer gameLayer = (GDGameLayer) <xsl:value-of select="text()" />GDGameLayerList.get(index);
                            if(!gameLayerList.contains(gameLayer)) {
                                gameLayerList.add(gameLayer);
                            }
                        }
                        <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                    actionArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />Array[index]</xsl:if></xsl:for-each>);
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'MettreY'" >
                    //MettreY
                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        actionWithUpdate = true;
                        if(<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                            final GDGameLayer gameLayer = (GDGameLayer) <xsl:value-of select="text()" />GDGameLayerList.get(index);
                            if(!gameLayerList.contains(gameLayer)) {
                                gameLayerList.add(gameLayer);
                            }
                        }
                        <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                    actionArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />Array[index]</xsl:if></xsl:for-each>);
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'MettreXY'" >
                    //MettreXY
                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        actionWithUpdate = true;
                        if(<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                            final GDGameLayer gameLayer = (GDGameLayer) <xsl:value-of select="text()" />GDGameLayerList.get(index);
                            if(!gameLayerList.contains(gameLayer)) {
                                gameLayerList.add(gameLayer);
                            }
                        }
                        <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                    actionArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />Array[index]</xsl:if></xsl:for-each>);
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'SetAngle'" >
                    //SetAngle
                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        actionWithUpdate = true;
                        if(<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                            final GDGameLayer gameLayer = (GDGameLayer) <xsl:value-of select="text()" />GDGameLayerList.get(index);
                            if(!gameLayerList.contains(gameLayer)) {
                                gameLayerList.add(gameLayer);
                            }
                        }
                        <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" ><xsl:value-of select="text()" />Array[index].angle</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /> (short)</xsl:if><xsl:if test="position() = 3" ><xsl:if test="substring-before(text(), '.') = ''" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="substring-before(text(), '.') != ''" ><xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template>Array[index].<xsl:value-of select="substring-after(text(), '.')" /></xsl:if></xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'ChangePlan'" >
                    //ChangePlan
                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        actionWithUpdate = true;
                        if(<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                            final GDGameLayer gameLayer = (GDGameLayer) <xsl:value-of select="text()" />GDGameLayerList.get(index);
                            if(!gameLayerList.contains(gameLayer)) {
                                gameLayerList.add(gameLayer);
                            }
                        }
                        <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" ><xsl:value-of select="text()" />Array[index].zOrder</xsl:if><xsl:if test="position() != 1" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'ChangeAnimation'" >
                    //ChangeAnimation
                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        actionWithUpdate = true;
                        if(<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                            final GDGameLayer gameLayer = (GDGameLayer) <xsl:value-of select="text()" />GDGameLayerList.get(index);
                            if(!gameLayerList.contains(gameLayer)) {
                                gameLayerList.add(gameLayer);
                            }
                        }
                        <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" ><xsl:value-of select="text()" />Array[index].animation</xsl:if><xsl:if test="position() != 1" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'ModVarObjet'" >
                    //ModVarObjet
                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        actionWithUpdate = true;
                        if(<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                            final GDGameLayer gameLayer = (GDGameLayer) <xsl:value-of select="text()" />GDGameLayerList.get(index);
                            if(!gameLayerList.contains(gameLayer)) {
                                gameLayerList.add(gameLayer);
                            }
                        }
                        <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" ><xsl:value-of select="text()" />Array[index].</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = 3" ><xsl:value-of select="text()" /><xsl:if test="text() = '+'" >=</xsl:if><xsl:if test="text() = '-'" >=</xsl:if></xsl:if><xsl:if test="position() = 4" ><xsl:if test="substring-before(text(), '.') = ''" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="substring-before(text(), '.') != ''" ><xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template>Array[index].<xsl:value-of select="substring-after(text(), '.')" /></xsl:if></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>

            </xsl:for-each>
            
            <xsl:for-each select="actions" >
                <xsl:variable name="nodeId" >nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> </xsl:variable>
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:if test="$typeValue = 'Create'" >
                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            <xsl:variable name="layerName" ><xsl:value-of select="text()" /></xsl:variable>
                            <xsl:variable name="gameLayer" ><xsl:value-of select="text()" />GDGameLayer</xsl:variable>
                            
                            //Create
                            if(<xsl:value-of select="$gameLayer" /> != null) {
                                <xsl:value-of select="$gameLayer" />.updateGDObject();
                                allBinaryGameLayerManager.insert(<xsl:value-of select="$gameLayer" />);

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
                                                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "<xsl:value-of select="$nodeId" /> for <xsl:value-of select="$groupName" />GDGameLayerList.add(<xsl:value-of select="$gameLayer" />); at: " + index));
                                                        <xsl:value-of select="$groupName" />GDGameLayerList.add(<xsl:value-of select="$gameLayer" />);
                                                    </xsl:if>
                                                </xsl:for-each>
                                            </xsl:for-each>

                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:for-each>
                                //objectsGroupsGDGameLayer - END

                            }
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>

            </xsl:for-each>

            <xsl:variable name="hasCreate" ><xsl:for-each select="actions" ><xsl:variable name="typeValue" select="type/value" /><xsl:if test="$typeValue = 'Create'" >Create</xsl:if></xsl:for-each></xsl:variable>

            <xsl:if test="not(contains($hasCreate, 'Create'))" >
                                if(actionWithUpdate) {

                                    final int size2 = gameLayerList.size();
                                    if(size2 <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                                        for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index2++) {
                                            ((GDGameLayer) gameLayerList.get(index2)).updateGDObject();
                                        }
                                    } else {
                                        LogUtil.put(LogFactory.getInstance("updateGDObject failed: <xsl:for-each select="actions" ><xsl:if test="type/value = 'MettreX' or type/value = 'MettreY' or type/value = 'MettreXY' or type/value = 'SetAngle' or type/value = 'ChangePlan' or type/value = 'ChangeAnimation' or type/value = 'ModVarObjet'" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />GDGameLayer </xsl:if></xsl:for-each></xsl:if></xsl:for-each>was null", this, CommonStrings.getInstance().EXCEPTION));
                                    }

                                }
            </xsl:if>
            
            <xsl:if test="actions" >
                        }
            </xsl:if>

                    } catch(Exception e) {
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, CommonStrings.getInstance().PROCESS, e));
                    }

                    }
                    
                    public void process(final CollidableCompositeLayer gameLayer, final CollidableCompositeLayer gameLayer2) {
                        
                        try {

            <xsl:variable name="create" >
                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    <xsl:if test="$typeValue != 'Create'" >
                        <xsl:value-of select="text()" />,
                    </xsl:if>
                </xsl:for-each>                
            </xsl:variable>

                <xsl:call-template name="objectGDObjectAtIndex" >
                    <xsl:with-param name="layoutIndex" >
                        <xsl:value-of select="$layoutIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="parametersAsString" >
                        <xsl:value-of select="$parametersAsString" />
                    </xsl:with-param>
                </xsl:call-template>

            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />

                <xsl:if test="$typeValue = 'UnPauseTimer'" >
                    //UnPauseTimer
                    actionArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>

                <xsl:if test="$typeValue = 'ModVarScene'" >
                    //ModVarScene
                    <xsl:for-each select="parameters" >
                        <xsl:value-of select="text()" />
                        <xsl:if test="text() = '+'" >=</xsl:if>
                        <xsl:if test="text() = '-'" >=</xsl:if>
                        <xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'TextObject::ChangeColor'" >
                    //TextObject::ChangeColor
                    actionArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>

            </xsl:for-each>
                                
                        //repeatExpression <xsl:value-of select="repeatExpression" />
                        final int size = <xsl:if test="not(repeatExpression)" >1</xsl:if><xsl:if test="repeatExpression" ><xsl:value-of select="repeatExpression" /></xsl:if>;

                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />

                    <xsl:if test="$typeValue = 'Create'" >
                        <xsl:variable name="nodeId" >nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> </xsl:variable>
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 2" >
                //<xsl:value-of select="$caller" /> - eventsCreateAssignGDObject - caller
                <xsl:value-of select="text()" />Array = new GDObject[size];
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                </xsl:for-each>
                                        
                    for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {

            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="quote" >"</xsl:variable>
                <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                    
                <xsl:if test="$typeValue = 'Create'" >
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                        //Create
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:value-of select="$name" />Array[index] = new <xsl:value-of select="$name" />(
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() != 2" >
                            <xsl:if test="position() != last()" >
                                <xsl:if test="string-length(text()) = 0" >
                                    null
                                </xsl:if>
                                <xsl:if test="string-length(text()) > 0" >
                                    <xsl:value-of select="text()" />
                                </xsl:if>,
                            </xsl:if>
                            <xsl:if test="position() = last()" >
                                <xsl:if test="string-length(text()) = 0" >
                                    <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>
                                </xsl:if>
                                <xsl:if test="string-length(text()) > 0" >
                                    <xsl:value-of select="text()" />
                                </xsl:if>
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>);
                    
                    <xsl:variable name="spriteName" >Sprite:<xsl:value-of select="$name" /></xsl:variable>
                    <xsl:if test="contains($objectsAsString, $spriteName)" >
                    //We may need to set a dimension for each image/animation.
                    <xsl:value-of select="$name" />Array[index].width = <xsl:value-of select="$name" />ImageArray[0].getWidth();
                    <xsl:value-of select="$name" />Array[index].height = <xsl:value-of select="$name" />ImageArray[0].getHeight();
                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, <xsl:value-of select="$name" />Array[index].toString()));
                    </xsl:if>
                    
                </xsl:if>

                <xsl:if test="$typeValue = 'SetAngle'" >
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));                    
                    //SetAngle
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" ><xsl:value-of select="text()" />Array[index].angle</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /> (short)</xsl:if><xsl:if test="position() = 3" ><xsl:if test="substring-before(text(), '.') = ''" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="substring-before(text(), '.') != ''" ><xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template>Array[index].<xsl:value-of select="substring-after(text(), '.')" /></xsl:if></xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'ChangePlan'" >
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));                    
                    //ChangePlan
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" ><xsl:value-of select="text()" />Array[index].zOrder</xsl:if><xsl:if test="position() != 1" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'ChangeAnimation'" >
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));                    
                    //ChangeAnimation
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" ><xsl:value-of select="text()" />Array[index].animation</xsl:if><xsl:if test="position() != 1" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'ModVarGlobal'" >
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));                    
                    //ModVarGlobal not implemented
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'ModVarObjet'" >
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));                    
                    //ModVarObjet
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" ><xsl:value-of select="text()" />Array[index].</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = 3" ><xsl:value-of select="text()" /><xsl:if test="text() = '+'" >=</xsl:if><xsl:if test="text() = '-'" >=</xsl:if></xsl:if><xsl:if test="position() = 4" ><xsl:if test="substring-before(text(), '.') = ''" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="substring-before(text(), '.') != ''" ><xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template>Array[index].<xsl:value-of select="substring-after(text(), '.')" /></xsl:if></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'Delete'" >
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    //Delete
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    actionArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(<xsl:value-of select="$name" />GDGameLayer, <xsl:value-of select="$name" />);
                </xsl:if>

                <xsl:if test="$typeValue = 'AddForceAL'" >
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    //AddForceAL
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    actionArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(<xsl:value-of select="$name" />GDGameLayer, <xsl:value-of select="$name" />);
                </xsl:if>

            </xsl:for-each>
                        
            <xsl:variable name="firstAction" >
                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    <xsl:if test="$typeValue = 'SetAngle' or $typeValue = 'ChangePlan' or $typeValue = 'ChangeAnimation' or $typeValue = 'ModVarObjet'" >
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                                <xsl:value-of select="text()" />,</xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                </xsl:for-each>                
            </xsl:variable>

            <xsl:if test="string-length($firstAction) and string-length($create) = 0" >
                <xsl:value-of select="substring-before($firstAction, ',')" />GDGameLayer.updateGDObject();
                <xsl:text>&#10;</xsl:text>
            </xsl:if>
            
                    }

                    } catch(Exception e) {
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, CommonStrings.getInstance().START, e));
                    }

                }
                
            };
            </xsl:if>

            <xsl:if test="not(contains($actionWithUsedType, 'found'))" >

                //Event - Actions - process - skipped
            if(this.actionArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
            }
            this.actionArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDAction() {
            
                <xsl:if test="actions" >            
                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    <xsl:variable name="quote" >"</xsl:variable>
                    <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                    private final String ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Skipped - <xsl:value-of select="translate($actionAsString, $quote, ' ')" />";
                    <xsl:text>&#10;</xsl:text>
                </xsl:for-each>
                </xsl:if>
            
                public void process() {
                <xsl:for-each select="events" >
                    //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" />
                    <xsl:if test="type = 'BuiltinCommonInstructions::Standard'" >
                        <!-- Event nodeId=N75237 - 9701 position=12 totalRecursions=1 type=BuiltinCommonInstructions::Standard disable=false -->
                        <xsl:if test="generate-id()= 'N75237'">
                    //BuiltinCommonInstructions::Standard                        
                    actionArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                        </xsl:if>
                        <!-- Event nodeId=N77640 - 12104 position=16 totalRecursions=2 type=BuiltinCommonInstructions::Standard disable=false
                             Action nodeId=N77651 - 12115 type=AddForceAL inverted=false parameters=player,Variable(player_movement_angle),Variable(player_speed),0, -->
                        <xsl:if test="generate-id()= 'N77640'">
                    //BuiltinCommonInstructions::Standard
                    actionArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                        </xsl:if>
                    </xsl:if>
                </xsl:for-each>
                
                <xsl:for-each select="conditions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                </xsl:for-each>

                <xsl:if test="actions" >
                <xsl:for-each select="actions" >
                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, new Exception()));
                </xsl:for-each>
                /*
                <xsl:call-template name="actionIds" >
                    <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                    <xsl:with-param name="caller" >eventsCreateAssignGDObject</xsl:with-param>
                </xsl:call-template>
                */
                </xsl:if>
                }
            };
            </xsl:if>

            <xsl:call-template name="eventsCreateAssignGDObject" >
                <xsl:with-param name="caller" >
                    <xsl:value-of select="$caller" />
                </xsl:with-param>
                <xsl:with-param name="layoutIndex" >
                    <xsl:value-of select="$layoutIndex" />
                </xsl:with-param>
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
                <xsl:with-param name="instancesAsString" >
                    <xsl:value-of select="$instancesAsString" />
                </xsl:with-param>
                <xsl:with-param name="objectsAsString" >
                    <xsl:value-of select="$objectsAsString" />
                </xsl:with-param>
                <xsl:with-param name="createdObjectsAsString" >
                    <xsl:value-of select="$createdObjectsAsString" />
                </xsl:with-param>
                <xsl:with-param name="conditionEventPosition" >
                    <xsl:value-of select="$eventPosition" />
                </xsl:with-param>

            </xsl:call-template>
        </xsl:for-each>
        //<xsl:value-of select="$caller" /> - eventsCreateAssignGDObject - END

    </xsl:template>

    <xsl:template name="paramIndexedArray" >
        <xsl:param name="createdObjectsAsString" />
        <xsl:variable name="name2" ><xsl:value-of select="substring-before(text(), '.')" /></xsl:variable><xsl:variable name="key" >,<xsl:value-of select="$name2" />,</xsl:variable><xsl:if test="contains($createdObjectsAsString, $key)" ><xsl:value-of select="$name2" /></xsl:if>
    </xsl:template>

</xsl:stylesheet>
