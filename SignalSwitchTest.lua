-- THIS IS A TESTING SCRIPT. NOT FOR USE.
-- SignalSwitchTests for RBLXS
-- Simulation 1 (AREA: LG):
-- Map:
-- - game
-- |- Workspace
-- | |- Signals
-- | | |- SignalXX (Model)
-- | | | |- TOPSIG (Top Light, Part)
-- | | | |- TWOSIG (Second Light, Part)
-- | | | |- THREESIG (Third Light, Part)
-- | | | |- BOTSIG (Bottom Light, Part)
-- | |- SignalDetector
-- | | |- DetXX (Part)
-- Examples for: SignalLG001 Det001
-- Line:
-- <-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-
-- -|-------------|------------------|--------------|-----------------|--------------------|----------0X00--------|
--  SignalLG003.   Det003.           SignalLG002.    Det002.          SignalLG001.          Det001.               STARTSIG            
-- Start Block
local sig0 = game.Workspace.Signals.STARTSIG
local one0 = sig0.TOPSIG
local two0 = sig0.TWOSIG
local three0 = sig0.THREESIG
local four0 = sig0.BOTSIG
-- Block 001 
local sig1 = game.Workspace.Signals.SignalLG001
local one1 = sig1.TOPSIG
local two1 = sig1.TWOSIG
local three1 = sig1.THREESIG
local four1 = sig1.BOTSIG
local det1 = game.Workspace.SignalDetector.Det001
-- Block 002
local sig2 = game.Workspace.Signals.SignalLG002
local one2 = sig2.TOPSIG
local two2 = sig2.TWOSIG
local three2 = sig2.THREESIG
local four2 = sig2.BOTSIG
local det2 = game.Workspace.SignalDetector.Det002
-- Block 003
local sig3 = game.Workspace.Signals.SignalLG003
local one3 = sig3.TOPSIG
local two3 = sig3.TWOSIG
local three3 = sig3.THREESIG
local four3 = sig3.BOTSIG
local det3 = game.Workspace.SignalDetector.Det003
-- Scenario: 0X00 Passed Det001, In block 001.
-- Set Starting signal to DANGER
det1.Touched:Connect(function(hit)
    four0.Color = Color3.fromRGB(255, 0, 0)
    one0.Color = Color3.fromRGB(0, 0, 0)
    two0.Color = Color3.fromRGB(0, 0, 0)
    three0.Color = Color3.fromRGB(0, 0, 0)
    print("STARTSIG SET TO DANGER")
)
-- Scenario: 0X00 Passed Det002, In block 002
-- Set LG001 to DANGER, Set STARTSIG to CAUTION
det2.Touched:Connect(function(hit)
    -- LG001
    one1.Color = Color3.fromRGB(0, 0, 0)
    two1.Color = Color3.fromRGB(0, 0, 0)
    three1.Color = Color3.fromRGB(0, 0, 0)
    four1.Color = Color3.fromRGB(255, 0, 0)
    print("LG001 SET TO DANGER")
    -- STARTSIG
    one0.Color = Color3.fromRGB(0, 0, 0)
    two0.Color = Color3.fromRGB(0, 0, 0)
    three0.Color = Color3.fromRGB(255, 255, 0)
    four0.Color = Colour3.fromRGB(0, 0, 0)
    print("STARTSIG SET TO CAUTION")
)
-- Scenario: 0X00 Passed Det003, In block 003
-- SET LG002 TO DANGER, SET LG001 TO CAUTION, SET STARTSIG TO PRELC
det3.Touched:Connect(function(hit)
    -- LG002
    one2.Color = Color3.fromRGB(0, 0, 0)
    two2.Color = Color3.fromRGB(0, 0, 0)
    three3.Color = Color3.fromRGB(0, 0, 0)
    four3.Color = Color3.fromRGB(255, 0, 0)
    print("LG002 SET TO DANGER")
    -- LG001
    one1.Color = Color3.fromRGB(0, 0, 0)
    two1.Color = Color3.fromRGB(0, 0, 0)
    three1.Color = Color3.fromRGB(255, 255, 0)
    four1.Color = Color3.fromRGB(0, 0, 0)
    print("LG001 SET TO CAUTION")
    -- STARTSIG
    one0.Color = Color3.fromRGB(255, 255, 0)
    two0.Color = Color3.fromRGB(0, 0, 0)
    three0.Color = Color3.fromRGB(255, 255, 0)
    four0.Color = Color3.fromRGB(0, 0, 0)
    print("STARTSIG SET TO PRELC")
)
-- Simulation 2 (Area: BN, Shunt: BNXXXS, Switch: SWBNXXX):
--->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->
--                      SWBN001 
--LINE02------------------|---/----------|--------------|--------------|--------------|--------------|---
--LINE01------0X00--------|--/ | BN001S
--                     SWDET001          DET001.        BN001.         DET002.        BN002.         DET003.  
-- SAME MAP AS LAST, ADDED:
-- game.Workspace.Switches
-- game.Workspace.Switches.SWBN001
-- game.Workspace.Switches.SWBN001.Line01 (Script that sets SWBN001 for LINE01 TO MEET LINE02)
-- game.Workspace.Switches.SWBN001.Line02 (Script that sets SWBN001 for LINE02 TO CONTINUE)
-- SHUNT MAP
-- ------------
-- | TOP       \
-- | LEFT RIGHT \
-- --------------
-- SWITCH
local switch = game.Workspace.Switches.SWBN001
local sdet = game.Workspace.SwitchDetector.SWDET001
local shunt = game.Workspace.Signals.Shunt.BN001S
local stop = shunt.TOP
local sleft = shunt.LEFT
local sright = shunt.RIGHT
-- SIGNALS
local sig1 = game.Workspace.Signals.BN001
local one1 = sig1.TOPSIG
local two1 = sig1.TWOSIG
local three1 = sig1.THREESIG
local four1 = sig1.BOTSIG
local sig2 = game.Workspace.Signals.BN002
local one2 = sig2.TOPSIG
local two2 = sig2.TWOSIG
local three2 = sig2.THREESIG
local four2 = sig2.BOTSIG
-- DETECTORS
local dets = game.Workspace.SignalDetector
local det1 = dets.DET001
local det2 = dets.DET002
local det3 = dets.DET003
-- Scenario: 0X00 has entered SWDET001, Set the Switch to join lines and Shunt
