
                
                package org.allbinary.game.layer;

        import javax.microedition.lcdui.Canvas;

        import org.allbinary.animation.AnimationInterfaceFactoryInterface;
        import org.allbinary.animation.IndexedAnimationInterface;
        import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface;
        import org.allbinary.direction.Direction;
        import org.allbinary.direction.DirectionFactory;
        import org.allbinary.game.GameTypeFactory;
        import org.allbinary.game.behavior.platformer.GeographicMapPlatformGameLayerBehavior;
        import org.allbinary.game.behavior.platformer.InitialJumpBehavior;
        import org.allbinary.game.behavior.platformer.PlatformCharacterBehavior;
        import org.allbinary.game.behavior.platformer.PlatformCharacterInterface;
        import org.allbinary.game.behavior.platformer.PlayerPlatformCharacterBehavior;
        import org.allbinary.game.configuration.feature.Features;
        import org.allbinary.game.configuration.feature.InputFeatureFactory;
        import org.allbinary.game.identification.Group;
        import org.allbinary.game.input.GameInputProcessor;
        import org.allbinary.game.input.GameInputProcessorUtil;
        import org.allbinary.game.input.GameKeyEventSourceInterface;
        import org.allbinary.game.input.InputFactory;
        import org.allbinary.game.input.PlayerGameInput;
        import org.allbinary.game.input.event.GameKeyEvent;
        import org.allbinary.game.input.event.GameKeyEventHandler;
        import org.allbinary.game.layer.special.Special1GameInputProcessor;
        import org.allbinary.game.layer.special.Special2GameInputProcessor;
        import org.allbinary.game.layer.special.SpecialFireGameInputProcessor;
        import org.allbinary.game.layer.special.SpecialLeftGameInputProcessor;
        import org.allbinary.game.layer.special.SpecialRightGameInputProcessor;
        import org.allbinary.game.layer.special.SpecialUpGameInputProcessor;
        import org.allbinary.game.layout.GDObject;        
        import org.allbinary.game.physics.acceleration.BasicAccelerationProperties;
        import org.allbinary.game.physics.velocity.VelocityProperties;
        import org.allbinary.graphics.Rectangle;
        import org.allbinary.layer.AllBinaryLayerManager;
        import org.allbinary.logic.basic.string.CommonStrings;
        import org.allbinary.logic.communication.log.LogFactory;
        import org.allbinary.logic.communication.log.LogUtil;
        import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
        import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface;
        import org.allbinary.media.graphics.geography.map.GeographicMapInterface;
        import org.allbinary.util.BasicArrayList;

                public class GDCustomGameLayer extends GDGameLayer implements GameKeyEventSourceInterface,
        
                //Behavior name=PixelPerfectPlatformerCharacter as PixelPerfectMovement::PixelPerfectPlatformerCharacter
                //Behavior name=PlatformerObject as PlatformBehavior::PlatformerObjectBehavior
                       PlatformCharacterInterface 
                    
                //Behavior name=SmoothCamera as SmoothCamera::SmoothCamera
                //Behavior name=SmoothPlatformerCamera as SmoothCamera::SmoothPlatformerCamera
                //Behavior name=Platform as PlatformBehavior::PlatformBehavior
                //Behavior name=Platform as PlatformBehavior::PlatformBehavior
                //Behavior name=Platform as PlatformBehavior::PlatformBehavior
                {

        
                //Behavior name=PixelPerfectPlatformerCharacter as PixelPerfectMovement::PixelPerfectPlatformerCharacter
                //Behavior name=PlatformerObject as PlatformBehavior::PlatformerObjectBehavior
    private PlayerGameInput playerGameInput;
                        
                        
                    private final int id = 0;
                        
                    protected final GameInputProcessor[] inputProcessorArray = new GameInputProcessor[InputFactory.getInstance().MAX];

    protected final boolean isSingleKeyProcessing = 
        Features.getInstance().isFeature(
                InputFeatureFactory.getInstance().SINGLE_KEY_REPEAT_PRESS)
            || Features.getInstance().isFeature(
                    InputFeatureFactory.getInstance().SINGLE_KEY_PRESS);

                    private final InitialJumpBehavior initialJumpBehavior = new InitialJumpBehavior() {
                        public void process() {
                            //SecondaryPlayerQueueFactory.getInstance().add(JumpSound.getInstance());
                        }
                    };

                    protected final GeographicMapPlatformGameLayerBehavior platformGameBehavior = new GeographicMapPlatformGameLayerBehavior();                
                    protected final PlatformCharacterBehavior platformCharacterBehavior = new PlayerPlatformCharacterBehavior();

                    protected final AllBinaryGameLayerManager allBinaryGameLayerManager;

                    protected BasicAccelerationProperties acceleration;

    protected short angle = 0;
    protected int lastDirectionKey = Canvas.RIGHT;
    protected Direction direction = DirectionFactory.getInstance().RIGHT;
    protected Direction lastDirection = direction;
    
    protected boolean directionChanged = false;
                        
                    
                //Behavior name=SmoothCamera as SmoothCamera::SmoothCamera
                //Behavior name=SmoothPlatformerCamera as SmoothCamera::SmoothPlatformerCamera
                //Behavior name=Platform as PlatformBehavior::PlatformBehavior
                //Behavior name=Platform as PlatformBehavior::PlatformBehavior
                //Behavior name=Platform as PlatformBehavior::PlatformBehavior

                    public GDCustomGameLayer(final AllBinaryGameLayerManager allBinaryGameLayerManager,
                        final BasicArrayList gameLayerList, final BasicArrayList gameLayerDestroyedList, 
                        final BasicArrayList behaviorList,
                        final String gdName, final Group[] groupInterface,
                        final AnimationInterfaceFactoryInterface[] animationInterfaceFactoryInterfaceArray,
                        final ProceduralAnimationInterfaceFactoryInterface[] proceduralAnimationInterfaceFactoryInterfaceArray,
                        final Rectangle layerInfo,
                        final GDObject gdObject, final RotationBehaviorBase rotationBehavior) throws Exception {
                        
                        super(gameLayerList, gameLayerDestroyedList, 
                            behaviorList, gdName, groupInterface,
                            animationInterfaceFactoryInterfaceArray,
                            proceduralAnimationInterfaceFactoryInterfaceArray,
                            layerInfo, gdObject, rotationBehavior);
                        
                        this.allBinaryGameLayerManager = allBinaryGameLayerManager;

                        this.acceleration = new BasicAccelerationProperties(
                            velocityInterface.getMaxForwardVelocity() / 12, 
                            -velocityInterface.getMaxReverseVelocity() / 12);

        
                //Behavior name=PixelPerfectPlatformerCharacter as PixelPerfectMovement::PixelPerfectPlatformerCharacter
                //Behavior name=PlatformerObject as PlatformBehavior::PlatformerObjectBehavior
                        this.playerGameInput = new PlayerGameInput(this.getGameKeyEventList(), 0);

                        if (allBinaryGameLayerManager.getGameInfo().getGameType() != GameTypeFactory.getInstance().BOT)
                        {   
                            GameKeyEventHandler.getInstance().addListener(playerGameInput, playerGameInput.getPlayerInputId());
                            //AllBinaryGameCanvas.addPlayerGameInput(((PlayerGameInputCompositeInterface) this.playerLayer).getPlayerGameInput());
                        }
                        

                        this.initInputProcessors();                        
                    
                //Behavior name=SmoothCamera as SmoothCamera::SmoothCamera
                //Behavior name=SmoothPlatformerCamera as SmoothCamera::SmoothPlatformerCamera
                //Behavior name=Platform as PlatformBehavior::PlatformBehavior
                //Behavior name=Platform as PlatformBehavior::PlatformBehavior
                //Behavior name=Platform as PlatformBehavior::PlatformBehavior

                    }
                
        
                //Behavior name=PixelPerfectPlatformerCharacter as PixelPerfectMovement::PixelPerfectPlatformerCharacter - START
                    
                    //Behavior name=PixelPerfectPlatformerCharacter as PixelPerfectMovement::PixelPerfectPlatformerCharacter - END
                
                //Behavior name=PlatformerObject as PlatformBehavior::PlatformerObjectBehavior - START
                    

    public void initInputProcessors() {
        this.inputProcessorArray[Canvas.UP] = new SpecialUpGameInputProcessor(this);

        this.inputProcessorArray[Canvas.KEY_NUM1] = new SpecialFireGameInputProcessor(this);

        this.inputProcessorArray[Canvas.RIGHT] = new SpecialRightGameInputProcessor(this);

        //-key == Canvas.LEFT
        this.inputProcessorArray[Canvas.LEFT] = new SpecialLeftGameInputProcessor(this);

        this.inputProcessorArray[Canvas.KEY_NUM0] = new Special1GameInputProcessor(this);

        this.inputProcessorArray[Canvas.KEY_POUND] = new Special2GameInputProcessor(this);

        /*
       (key == Canvas.KEY_NUM5)
       {
       } else if (key == Canvas.KEY_NUM7)
       {
       } else if (key == Canvas.KEY_NUM9)
       {
       } else if ((key == Canvas.KEY_STAR || key == Canvas.KEY_NUM3))
       {
       }
         */
        GameInputProcessorUtil.init(this.inputProcessorArray);
    }

//    private int lastSize = -1;

    public synchronized void processInput2(final AllBinaryLayerManager allbinaryLayerManager) throws Exception {
        //this.workSpecialIndex = this.minSpecialIndex;

        final BasicArrayList list = this.getGameKeyEventList();
        final int size = list.size();
//        if(size != lastSize) {
//            LogUtil.put(LogFactory.getInstance(new StringMaker().append("Size: ").append(size).toString(), this, "processInput"));
//            lastSize = size;
//        }

        //if (this.isSingleKeyProcessing || this.timeHelper.isTime())
        //{
        int key = 0;
        GameKeyEvent gameKeyEvent;

        for (int index = 0; index < size; index++) {
            gameKeyEvent = (GameKeyEvent) list.get(index);
            key = gameKeyEvent.getKey();

            inputProcessorArray[key].process(allbinaryLayerManager, gameKeyEvent);
        }
        //this.updateSpecialAnimation();
//      }
    }
                        
    public void terrainEvent(final int dx, final int dy, final GeographicMapInterface geographicMapInterface,
            final GeographicMapCellPosition geographicMapCellPosition) throws Exception {
    }

    public void terrainMove(final GeographicMapInterface geographicMapInterface, final int dx, final int dy) {
        this.platformCharacterBehavior.terrainMove(this, geographicMapInterface, dx, dy);
    }
   
    public void terrainLand() {
        //this.specialAnimationInterfaceArray[LEGS_ANIMATION].setFrame(STANDARD_FRAME);
    }

    public void move() {
        try {
            final GeographicMapCompositeInterface geographicMapCompositeInterface
                    = (GeographicMapCompositeInterface) this.allBinaryGameLayerManager;

            final GeographicMapInterface geographicMapInterface
                    = geographicMapCompositeInterface.getGeographicMapInterface();

            this.platformGameBehavior.move(geographicMapInterface, this.velocityInterface, this);

        } catch (Exception e) {
            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, "move", e));
        }
    }

    public void up()
    {
        LogUtil.put(LogFactory.getInstance("Jump", this, "processInput"));
        this.platformGameBehavior.up((VelocityProperties) this.velocityInterface, acceleration, initialJumpBehavior, 1);
        
        //updateGDObject(globals.timeDelta);
        updateGDObject(1000);
    }    
    
   public void right()
   {
      this.velocityInterface.getVelocityXBasicDecimal().add(-this.acceleration.getReverse());
      this.velocityInterface.limitXYToForwardAndReverseMaxVelocity();

      LogUtil.put(LogFactory.getInstance("Right: dx: " + this.velocityInterface.getVelocityXBasicDecimal().getUnscaled(), this, "processInput"));
      
      // this.getVelocityProperties().addVelocity(
      // this.acceleration.getReverse(), 180);

      this.angle = 0;
      lastDirectionKey = Canvas.RIGHT;
      
      //updateGDObject(globals.timeDelta);
      updateGDObject(1000);
   }

   public void left()
   {
       this.velocityInterface.getVelocityXBasicDecimal().add(this.acceleration.getReverse());
       this.velocityInterface.limitXYToForwardAndReverseMaxVelocity();

       LogUtil.put(LogFactory.getInstance("Left: dx: " + this.velocityInterface.getVelocityXBasicDecimal().getUnscaled(), this, "processInput"));

       // this.getVelocityProperties().addVelocity(this.acceleration.getReverse(), 0);

       // this.specialAnimationArray[this.specialIndex++] = LEFT;

       this.angle = 180;
       lastDirectionKey = Canvas.LEFT;

      //updateGDObject(globals.timeDelta);
      updateGDObject(1000);
    }
        
   public void inputFrames()
   {

      this.platformGameBehavior.inputFrames(this.velocityInterface);

      //TWB - Was this supposed to be remarked
      //this.specialAnimationInterfaceArray[HEAD_ANIMATION].setFrame(this.direction.getFrameFactor());

      // this.armAnimation();

      final IndexedAnimationInterface indexedAnimationInterface = this.getIndexedAnimationInterface();
      if (this.directionChanged && !this.isReadyForExplosion())
      {
         indexedAnimationInterface.setFrame(this.direction.getFrameFactor());
      }

      /*
       * int hatFrame = (int) this.absoluteXVelocity / hatReverseDenominator;
       * int yHatFrame = (int)
       * Math.abs(this.velocityInterface.getVelocityYBasicDecimal().getUnscaled()) /
       * hatReverseDenominator; hatFrame += yHatFrame;
       * 
       * if (hatFrame &gt; TOTAL_HAT_FRAMES - 1) { hatFrame = TOTAL_HAT_FRAMES -
       * 1; }
       * this.specialAnimationInterfaceArray[HAT_ANIMATION].setFrame(hatFrame +
       * (this.direction.getFrameFactor() * TOTAL_HAT_FRAMES));
       */

//      final IndexedAnimationInterface legsIndexedAnimationInterface =
//         this.specialAnimationInterfaceArray[LEGS_ANIMATION];
//
//      if (this.platformGameBehavior.gravityActionIndex == 0  || this.platformGameBehavior.isFallingWithoutJumpAttempt)
//      {
//         int legDirectionIndex = this.direction.getFrameFactor() * TOTAL_LEG_FRAMES;
//
//         if (this.movedEnoughForMovement || this.directionChanged)
//         {
//            int nextFrame = this.runFrameSequence[legsIndexedAnimationInterface.getFrame()];
//            legsIndexedAnimationInterface.setFrame(nextFrame + legDirectionIndex);
//         }
//         else if (!isMovingEnough)
//         {
//            this.specialAnimationInterfaceArray[LEGS_ANIMATION].setFrame(STANDARD_FRAME + legDirectionIndex);
//         }
//      }

    }

    public void armAnimation() {
//        final int armsDirectionIndex = TOTAL_ARM_FRAMES * this.direction.getFrameFactor();
//        if (this.platformGameBehavior.gravityActionIndex > 0) {
//            this.specialAnimationInterfaceArray[ARMS_ANIMATION].setFrame(JUMP_ARMS_FRAME + armsDirectionIndex);
//        } else if (!this.movedEnoughForMovement) {
//            this.specialAnimationInterfaceArray[ARMS_ANIMATION].setFrame(armsDirectionIndex);
//        }
    }

    public void reset() throws Exception
    {
        //this.specialIndex = this.minSpecialIndex;

        this.platformGameBehavior.land((VelocityProperties) this.velocityInterface);
        this.velocityInterface.zero();

        //this.initPosition();

        //this.setAnimationInterface(this.getAnimationInterfaceFactoryInterface().getInstance());

        //this.getIndexedAnimationInterface().setFrame(0);
        //directionChanged = true;
    }
    
    public int getSourceId() {
        return id;
    }
    
                        
        
    public synchronized void processInput(final AllBinaryLayerManager allbinaryLayerManager) throws Exception
    {
        try
        {
            this.processInput2(allbinaryLayerManager);

            if (isSingleKeyProcessing)
            {
                this.playerGameInput.clear();
            }
            else
            {
                this.playerGameInput.update();
            }

        }
        catch (Exception e)
        {
            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, "processInput"));
            //LogUtil.put(LogFactory.getInstance("Danger Danger Danger ^^^%%$*($)*@)!$", this, "processInput", e));
        }

    }

    public PlayerGameInput getPlayerGameInput()
    {
        return this.playerGameInput;
    }
    
    public boolean implmentsGameInputInterface()
    {
        return true;
    }
    
                        
                    //Behavior name=PlatformerObject as PlatformBehavior::PlatformerObjectBehavior - END
                
                //Behavior name=SmoothCamera as SmoothCamera::SmoothCamera - START
                    
                    //Behavior name=SmoothCamera as SmoothCamera::SmoothCamera - END
                
                //Behavior name=SmoothPlatformerCamera as SmoothCamera::SmoothPlatformerCamera - START
                    
                    //Behavior name=SmoothPlatformerCamera as SmoothCamera::SmoothPlatformerCamera - END
                
                //Behavior name=Platform as PlatformBehavior::PlatformBehavior - START
                    
                    //Behavior name=Platform as PlatformBehavior::PlatformBehavior - END
                
                //Behavior name=Platform as PlatformBehavior::PlatformBehavior - START
                    
                    //Behavior name=Platform as PlatformBehavior::PlatformBehavior - END
                
                //Behavior name=Platform as PlatformBehavior::PlatformBehavior - START
                    
                    //Behavior name=Platform as PlatformBehavior::PlatformBehavior - END
                
            
                
                }

    
