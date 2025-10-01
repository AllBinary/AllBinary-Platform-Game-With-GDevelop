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

    <xsl:template name="variablesForGDObject" >
                    <xsl:for-each select="variables" >
                        <xsl:variable name="name" ><xsl:call-template name="lower-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>
                    //Object - //variable - //<xsl:value-of select="type" /> - name=<xsl:value-of select="name" /> - value=<xsl:value-of select="value" />
                        <xsl:if test="type = 'string'" >
                            <xsl:if test="number(value) != value" >
                    public String <xsl:value-of select="name" /> = <xsl:if test="string-length(value) > 0" ><xsl:value-of select="value" /></xsl:if><xsl:if test="string-length(value) = 0" >stringUtil.EMPTY_STRING</xsl:if>;
                            </xsl:if>
                            <xsl:if test="number(value) = value" >
                    //This is supposed to be a string
                    public float <xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="type = 'number'" >
                            <xsl:if test="contains($name, 'speed')" >
                    //TWB - speed hack
                                <xsl:if test="contains($name, '_speed')" >
                    public float <xsl:value-of select="name" /> = <xsl:value-of select="value" /> * ((SWTUtil.isSWT || AndroidUtil.isAndroid()) ? 2 : 3);
                                </xsl:if>
                                <xsl:if test="contains($name, 'speed') and not(contains($name, '_speed'))" >
                    public int <xsl:value-of select="name" /> = <xsl:value-of select="value" /> * ((SWTUtil.isSWT || AndroidUtil.isAndroid()) ? 2 : 3);
                                </xsl:if>
                            </xsl:if>
                            <xsl:if test="not(contains(name, 'Time') or contains(name, 'Delay') or contains(name, 'MAX_VALUE') or contains($name, 'speed') or contains(name, 'score'))" >
                    public int <xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                            </xsl:if>
                            <xsl:if test="contains(name, 'Time') or contains(name, 'Delay') or contains(name, 'MAX_VALUE') or contains(name, 'score')" >
                                <xsl:if test="value != '9223372036854776000'" >
                    public long <xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                                </xsl:if>
                                <xsl:if test="value = '9223372036854776000'" >
                    //Long.MAX_VALUE = 9223372036854776000 GD does not like the real value 9223372036854775807L
                    public long <xsl:value-of select="name" /> = 9223372036854775807L;
                                </xsl:if>
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="type = 'boolean'" >
                    public boolean <xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                        </xsl:if>
                        <xsl:if test="type = 'array'" >
                            <xsl:if test="contains(name, 'BoolArray')" >
                    public boolean[] <xsl:value-of select="name" /> = {
                            <xsl:for-each select="children" >
                        <xsl:value-of select="value" />,
                            </xsl:for-each>
                    };
                            </xsl:if>
                            <xsl:if test="contains(name, 'IntArray')" >
                    public int[] <xsl:value-of select="name" /> = {
                            <xsl:for-each select="children" >
                                <xsl:if test="contains(value, ';')" >
                        basicColorUtil.get(<xsl:value-of select="translate(translate(value, '\&quot;', ''), ';', ',')" />),
                                </xsl:if>
                                <xsl:if test="not(contains(value, ';'))" >
                        <xsl:value-of select="value" />,
                                </xsl:if>
                            </xsl:for-each>
                    };
                            </xsl:if>
                            <xsl:if test="contains(name, 'LongArray')" >
                        public long[] <xsl:value-of select="name" /> = {
                            <xsl:for-each select="children" >
                            <xsl:value-of select="value" />,
                            </xsl:for-each>
                        };
                            </xsl:if>
                            <xsl:if test="not(contains(name, 'IntArray') or contains(name, 'LongArray') or contains(name, 'BoolArray'))" >
                    public String[] <xsl:value-of select="name" /> = {
                            <xsl:for-each select="children" >
                        "<xsl:value-of select="value" />",
                            </xsl:for-each>
                    };
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="variablesResetForGDObject" >
                    <xsl:for-each select="variables" >
                        <xsl:variable name="name" ><xsl:call-template name="lower-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>
                    //Object - //reset - //variable - //<xsl:value-of select="type" /> - name=<xsl:value-of select="name" /> - value=<xsl:value-of select="value" />
                        <xsl:if test="type = 'string'" >
                            <xsl:if test="number(value) != value" >
                    this.<xsl:value-of select="name" /> = <xsl:if test="string-length(value) > 0" ><xsl:value-of select="value" /></xsl:if><xsl:if test="string-length(value) = 0" >stringUtil.EMPTY_STRING</xsl:if>;
                            </xsl:if>
                            <xsl:if test="number(value) = value" >
                    //This is supposed to be a string
                    this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="type = 'number'" >
                            <xsl:if test="contains(name, 'scale')" >
                    //Skip resetting scale
                            </xsl:if>
                            <xsl:if test="not(contains(name, 'scale'))" >
                            <xsl:if test="contains($name, 'speed')" >
                    //TWB - speed hack
                    this.<xsl:value-of select="name" /> = <xsl:value-of select="value" /> * ((SWTUtil.isSWT || AndroidUtil.isAndroid()) ? 2 : 3);
                            </xsl:if>
                            <xsl:if test="not(contains(name, 'time') or contains(name, 'Time') or contains(name, 'Delay') or contains(name, 'MAX_VALUE') or contains($name, 'speed'))" >
                    this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                            </xsl:if>
                            <xsl:if test="contains(name, 'time') or contains(name, 'Time') or contains(name, 'Delay') or contains(name, 'MAX_VALUE')" >
                                <xsl:if test="value != '9223372036854776000'" >
                    this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                                </xsl:if>
                                <xsl:if test="value = '9223372036854776000'" >
                    //Long.MAX_VALUE = 9223372036854776000 GD does not like the real value 9223372036854775807L
                    this.<xsl:value-of select="name" /> = 9223372036854775807L;
                                </xsl:if>
                            </xsl:if>
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="type = 'boolean'" >
                    this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                        </xsl:if>
                        <xsl:if test="type = 'array'" >
                            <xsl:if test="contains(name, 'BoolArray')" >
                    this.<xsl:value-of select="name" /> = new boolean[] {
                            <xsl:for-each select="children" >
                        "<xsl:value-of select="value" />",
                            </xsl:for-each>
                    };
                            </xsl:if>
                            <xsl:if test="contains(name, 'IntArray')" >
                    this.<xsl:value-of select="name" /> = new int[] {
                            <xsl:for-each select="children" >
                                <xsl:if test="contains(value, ';')" >
                        basicColorUtil.get(<xsl:value-of select="translate(translate(value, '\&quot;', ''), ';', ',')" />),
                                </xsl:if>
                                <xsl:if test="not(contains(value, ';'))" >
                        <xsl:value-of select="value" />,
                                </xsl:if>
                            </xsl:for-each>
                    };
                            </xsl:if>
                            <xsl:if test="contains(name, 'LongArray')" >
                    this.<xsl:value-of select="name" /> = new long[] {
                            <xsl:for-each select="children" >
                        <xsl:value-of select="value" />,
                            </xsl:for-each>
                    };
                            </xsl:if>
                            <xsl:if test="not(contains(name, 'IntArray') or contains(name, 'LongArray') or contains(name, 'BoolArray'))" >
                    this.<xsl:value-of select="name" /> = new String[] {
                            <xsl:for-each select="children" >
                        "<xsl:value-of select="value" />",
                            </xsl:for-each>
                    };
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="gdObject" >
        <xsl:param name="name" />
        <xsl:variable name="hasObjectInObjectsGroups" ><xsl:for-each select="/game/layouts/objectsGroups" ><xsl:variable name="objectsGroupsName" select="name" /><xsl:for-each select="objects" ><xsl:if test="name = $name" >found</xsl:if></xsl:for-each></xsl:for-each></xsl:variable>
        <xsl:for-each select="/game/layouts/objectsGroups" ><xsl:variable name="objectsGroupsName" select="name" /><xsl:for-each select="objects" ><xsl:if test="name = $name" ><xsl:value-of select="$objectsGroupsName" /></xsl:if></xsl:for-each></xsl:for-each><xsl:if test="not(contains($hasObjectInObjectsGroups, 'found'))" >GDObject</xsl:if>
    </xsl:template>
    
    <xsl:template name="objectsClassPropertyGDObjects" >

        //ObjectsGroups - GDObject
        <xsl:for-each select="/game/layouts/objectsGroups" >
        public class <xsl:value-of select="name" /> extends GDObject {
        
            public <xsl:value-of select="name" />(final int width, final int height, final String name, final String type) {
                super(width, height, name, type);
            }

            <xsl:for-each select="objects" >
                <xsl:if test="position() = 1" >
                <xsl:variable name="objectName" select="name" />
                
            <xsl:for-each select="/game/layouts/objects" >
                <xsl:variable name="name" select="name" />

                    <xsl:if test="name = $objectName" >
                    <xsl:call-template name="variablesForGDObject" />
                    </xsl:if>

            </xsl:for-each>
                </xsl:if>
            </xsl:for-each>

            //objectsClassPropertyGDObjects
            public void reset() {
            
            <xsl:for-each select="objects" >
                <xsl:if test="position() = 1" >
                <xsl:variable name="objectName" select="name" />
                
            <xsl:for-each select="/game/layouts/objects" >
                <xsl:variable name="name" select="name" />
                
                <xsl:if test="name = $objectName" >
                    <xsl:call-template name="variablesResetForGDObject" />
                </xsl:if>

            </xsl:for-each>
                </xsl:if>
            </xsl:for-each>

                this.initialVariables.reset();
            }

            /*            
            public void setX(final int x) {
                //if(Math.abs(x) > 10000)
                logUtil.put(new StringMaker().append(" TWBx: ").append(x).toString(), this, commonStrings.PROCESS, new Exception());
                super.setX(x);
            }

            public void setY(final int y) {
                //if(Math.abs(y) > 10000)
                logUtil.put(new StringMaker().append(" TWBy: ").append(y).toString(), this, commonStrings.PROCESS, new Exception());
                super.setY(y);
            }
            */
            
        }
        </xsl:for-each>
        
        //objects - all - //objectsClassPropertyGDObjects - START
        <xsl:for-each select="objects" >

            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="type" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:if test="type != 'ParticleSystem::ParticleEmitter'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                <xsl:variable name="NAME" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>

                public final class <xsl:value-of select="name" /> extends <xsl:call-template name="gdObject" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template> 
                <xsl:if test="type = 'SpriteMultitouchJoystick::SpriteMultitouchJoystick'" > implements SoftJoystickInterface </xsl:if>{

                    <xsl:variable name="hasObjectInObjectsGroups" ><xsl:for-each select="/game/layouts/objectsGroups" ><xsl:variable name="objectsGroupsName" select="name" /><xsl:for-each select="objects" ><xsl:if test="name = $name" >found</xsl:if></xsl:for-each></xsl:for-each></xsl:variable>

                    <xsl:if test="not(contains($hasObjectInObjectsGroups, 'found'))" >

                        <xsl:call-template name="variablesForGDObject" />

                    //objectsClassPropertyGDObjects2
                    public void reset() {
                        <xsl:call-template name="variablesResetForGDObject" />
                    
                        this.initialVariables.reset();

                    }
                    </xsl:if>

                <xsl:if test="animations" >
                    //animations/directions/sprites/originPoint/x <xsl:value-of select="animations/directions/sprites/originPoint/x" />
                    //animations/directions/sprites/originPoint/y <xsl:value-of select="animations/directions/sprites/originPoint/y" />                    
                    public final String[] ANIMATION_NAMES = {
                <xsl:for-each select="animations" >
                    <xsl:variable name="animationName" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(name, '&quot;', '')" /></xsl:with-param></xsl:call-template></xsl:variable>
                    <xsl:if test="string-length($animationName) > 0" >
                    <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$animationName" />,
                    </xsl:if>
                </xsl:for-each>
                    };                
                </xsl:if>

                    public <xsl:value-of select="name" />(final int width, final int height, final String name) {
                        super(width, height, name, <xsl:if test="string-length(type) = 0 or type = 'TextObject::Text' or type = 'TextInput::TextInputObject' or type = 'PanelSpriteSlider::PanelSpriteSlider'" >null</xsl:if><xsl:if test="not(string-length(type) = 0 or type = 'TextObject::Text' or type = 'TextInput::TextInputObject' or type = 'PanelSpriteSlider::PanelSpriteSlider')" ><xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(type, ':', '_')" /></xsl:with-param></xsl:call-template></xsl:if>);

                    <xsl:for-each select="behaviors" >
                        //Behavior name=<xsl:value-of select="name" /> as <xsl:value-of select="type" /> extraBorder=<xsl:value-of select="extraBorder" />
                        <xsl:if test="type = 'PathfindingBehavior::PathfindingBehavior'" >
                        this.behaviorArray[gdBehaviorUtil.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_BEHAVIOR_INDEX] = gdBehaviorUtil.getInstance(gdBehaviorUtil.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_BEHAVIOR_INDEX);
                        //Behaviors are enabled by default.
                        this.isBehaviorEnabledArray[gdBehaviorUtil.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_BEHAVIOR_INDEX] = true;
                        this.hasBehaviorArray[gdBehaviorUtil.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_BEHAVIOR_INDEX] = true;
                        </xsl:if>
                    </xsl:for-each>

                    <xsl:if test="contains($hasObjectInObjectsGroups, 'found')" >
                    <xsl:for-each select="variables" >
                        <xsl:variable name="name" ><xsl:call-template name="lower-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>
                    //animations - //variable - //<xsl:value-of select="type" /> - name=<xsl:value-of select="name" /> - value=<xsl:value-of select="value" />
                        <xsl:if test="type = 'string'" >
                            <xsl:if test="number(value) != value" >
                    this.<xsl:value-of select="name" /> = <xsl:if test="string-length(value) > 0" ><xsl:value-of select="value" /></xsl:if><xsl:if test="string-length(value) = 0" >stringUtil.EMPTY_STRING</xsl:if>;
                            </xsl:if>
                            <xsl:if test="number(value) = value" >
                    //This is supposed to be a string
                    this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="type = 'number'" >
                            <xsl:if test="contains(name, 'scale')" >
                    //Skip resetting scale
                            </xsl:if>
                            <xsl:if test="not(contains(name, 'scale'))" >
                            <xsl:if test="contains($name, 'speed')" >
                   //TWB - speed hack
                    this.<xsl:value-of select="name" /> = <xsl:value-of select="value" /> * ((SWTUtil.isSWT || AndroidUtil.isAndroid()) ? 2 : 3);
                            </xsl:if>
                            <xsl:if test="not(contains(name, 'Time') or contains(name, 'Delay') or contains(name, 'MAX_VALUE') or contains($name, 'speed'))" >
                    this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                            </xsl:if>
                            <xsl:if test="contains(name, 'Time') or contains(name, 'Delay') or contains(name, 'MAX_VALUE')" >
                                <xsl:if test="value != '9223372036854776000'" >
                    this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                                </xsl:if>
                                <xsl:if test="value = '9223372036854776000'" >
                    //Long.MAX_VALUE = 9223372036854776000 GD does not like the real value 9223372036854775807L
                    this.<xsl:value-of select="name" /> = 9223372036854775807L;
                                </xsl:if>
                            </xsl:if>
                            </xsl:if>
                         </xsl:if>
                        <xsl:if test="type = 'boolean'" >
                    this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                        </xsl:if>
                        <xsl:if test="type = 'array'" >
                            <xsl:if test="contains(name, 'BoolArray')" >
                    this.<xsl:value-of select="name" /> = {
                            <xsl:for-each select="children" >
                        "<xsl:value-of select="value" />",
                            </xsl:for-each>
                    };
                            </xsl:if>
                            <xsl:if test="contains(name, 'IntArray')" >
                    this.<xsl:value-of select="name" /> = {
                            <xsl:for-each select="children" >
                        <xsl:value-of select="value" />,
                            </xsl:for-each>
                    };
                            </xsl:if>
                            <xsl:if test="contains(name, 'LongArray')" >
                    this.<xsl:value-of select="name" /> = {
                            <xsl:for-each select="children" >
                        <xsl:value-of select="value" />L,
                            </xsl:for-each>
                    };
                            </xsl:if>
                            <xsl:if test="not(contains(name, 'IntArray') or contains(name, 'LongArray') or contains(name, 'BoolArray'))" >
                    this.<xsl:value-of select="name" /> = {
                            <xsl:for-each select="children" >
                        "<xsl:value-of select="value" />",
                            </xsl:for-each>
                    };
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
                    </xsl:if>
                        
                    }

                    <xsl:if test="animations" >
                    public String getAnimationFromIndex(final int index) {
                        <xsl:variable name="hasAnimationWithName" >
                            <xsl:for-each select="animations" >
                                <xsl:if test="string-length(name) > 0" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:if test="contains($hasAnimationWithName, 'found')" >
                        return this.ANIMATION_NAMES[index];
                        </xsl:if>
                        <xsl:if test="not(contains($hasAnimationWithName, 'found'))" >
                        return null;
                        </xsl:if>
                    }

                    public String getAnimation(final String animationName) {
                        final int size = ANIMATION_NAMES.length;
                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            if(this.ANIMATION_NAMES[index] == animationName) {
                                //logUtil.put(animationName, this, "getAnimation");
                                return this.ANIMATION_NAMES[index];
                            }
                        }

                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            //TWB - This is slow please fix me.
                            if(this.ANIMATION_NAMES[index].compareTo(animationName) == 0) {
                                //logUtil.put(animationName, this, "getAnimation");
                                return this.ANIMATION_NAMES[index];
                            }
                        }
                        
                        throw new RuntimeException(animationName);
                    }
                    
                    public boolean setAnimation(final String animationName) {
                        final int size = ANIMATION_NAMES.length;
                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            if(this.ANIMATION_NAMES[index] == animationName) {
                                //logUtil.put(animationName, this, "setAnimation");
                                if(this.animation != index) {
                                    this.animation = index;
                                    return true;
                                } else if(this.ANIMATION_NAMES.length == 1) {
                                    return true;
                                } else {
                                    return false;
                                }
                            }
                        }
                        return false;
                    }
                    </xsl:if>
                    
                    <xsl:if test="animations/directions/sprites/originPoint/x = 0 and animations/directions/sprites/originPoint/y = 0" >
<!--                
                    public int Width(final Graphics graphics) {
                        return canvasWidth;
                    }
    
                    public int Height(final Graphics graphics) {
                        return canvasHeight;
                    }
-->
                    </xsl:if>
            
                    <xsl:if test="type = 'SpriteMultitouchJoystick::SpriteMultitouchJoystick'" >

                        <xsl:for-each select="//eventsFunctionsExtensions" >
                        
                            <xsl:if test="name = 'SpriteMultitouchJoystick'" >
                                
                                <xsl:for-each select="eventsBasedObjects" >
                        
                                    <xsl:for-each select="objects" >
<!--
                    <name>Border</name>
                    <type>Sprite</type>
-->
                    //type=<xsl:value-of select="type" />
                        <xsl:for-each select="behaviors" >
                    //private String name = "<xsl:value-of select="name" />";
                    //private String joystickIdentifier = "<xsl:value-of select="JoystickIdentifier" />";
                    //private boolean floatingEnabled = <xsl:value-of select="FloatingEnabled" />;
                    //private int touchIndex = <xsl:value-of select="TouchIndex" />;
                    //private int touchId = <xsl:value-of select="TouchId" />;
                    //private int controllerIdentifier = <xsl:value-of select="ControllerIdentifier" />;
                    //private float joystickAngle = <xsl:value-of select="JoystickAngle" />;
                    //private float joystickForce = <xsl:value-of select="JoystickForce" />;
                    private float deadZoneRadius = <xsl:value-of select="DeadZoneRadius" />f / 2;
                        </xsl:for-each>
                                   </xsl:for-each>

                                </xsl:for-each>

                            </xsl:if>
                        
                        </xsl:for-each>

                    private int id;
                    private GPoint point = PointFactory.getInstance().ZERO_ZERO;
                    private float stickForceX = 0.0f;
                    private float stickForceY = 0.0f;

                    public void setId(final int id) {
                        this.id = id;
                    }
                        
                    public int getId() {
                        return this.id;
                    }

                    public void setPoint(final GPoint point) {
                        this.point = point;
                    }
                        
                    public GPoint getPoint() {
                        return this.point;
                    }
                        
                    public void setStickForceX(final float stickForceX) {
                        this.stickForceX = stickForceX;
                    }

                    public void setStickForceY(final float stickForceY) {
                        this.stickForceY = stickForceY;
                    }

                    public float StickForceX() {
                        return stickForceX;
                    }

                    public float StickForceY() {
                        return stickForceY;
                    }
                        
                    public float DeadZoneRadius() {
                        return deadZoneRadius;
                    }
                    </xsl:if>
                                        
                };

                public final GDObjectFactory <xsl:value-of select="name" />GDObjectFactory = new GDObjectFactory() {

                    public GDObject get(final int width, final int height, final String name) {
                        return new <xsl:value-of select="name" />(width, height, name);
                    }

                };    
                        
            </xsl:if>
            <xsl:if test="type = 'ParticleSystem::ParticleEmitter'" >
                <xsl:variable name="stringValue" select="string" />

                //ParticleSystem::ParticleEmitter - GDObject
                public final class <xsl:value-of select="name" /> extends GDObject {
                    
                    //public final StringMaker stringMaker = new StringMaker();

                    public <xsl:value-of select="name" />(final int width, final int height, final String name) {
                        super(width, height, name, null);
                    }

                    public int Width(final Graphics graphics) {
                        return 0;
                    }

                    public int Height(final Graphics graphics) {
                        return 0;
                    }
                    
                    public String String() {
                        //return stringMaker.toString();
                        return StringUtil.getInstance().EMPTY_STRING;
                    }
                };

                public final GDObjectFactory <xsl:value-of select="name" />GDObjectFactory = new GDObjectFactory() {

                    public GDObject get(final int width, final int height, final String name) {
                        return new <xsl:value-of select="name" />(width, height, name);
                    }

                };    

            </xsl:if>

        </xsl:for-each>
        //objects - all - //objectsClassPropertyGDObjects - END

    </xsl:template>

</xsl:stylesheet>
